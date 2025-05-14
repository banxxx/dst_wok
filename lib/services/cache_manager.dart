import 'dart:io';
import 'dart:math';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class CacheManager {
  static final CacheManager _instance = CacheManager._internal();
  factory CacheManager() => _instance;
  CacheManager._internal();

  /// 定义缓存目录类型
  static const Map<CacheType, String> _cachePaths = {
    CacheType.image: '/image_cache',
    CacheType.temp: '/temp_files',
    CacheType.data: '/persistent_data',
  };

  /// 初始化所有缓存目录
  Future<void> initCacheDirs() async {
    try {
      for (final type in CacheType.values) {
        await _getOrCreateCacheDir(type);
      }
      if (kDebugMode) {
        print('All cache directories initialized');
      }
    } catch (e) {
      throw Exception('Failed to initialize cache: $e');
    }
  }

  /// 获取指定类型的缓存目录
  Future<Directory> getCacheDir(CacheType type) async {
    final appDir = await getApplicationDocumentsDirectory();
    return Directory('${appDir.path}${_cachePaths[type]}');
  }

  /// 清理指定类型缓存
  Future<void> clearCache(CacheType type) async {
    try {
      final dir = await getCacheDir(type);
      if (await dir.exists()) {
        await dir.delete(recursive: true);
        await dir.create();
      }
    } catch (e) {
      throw Exception('Failed to clear ${type.name} cache: $e');
    }
  }

  /// 清理所有缓存
  Future<void> clearAllCache() async {
    try {
      for (final type in CacheType.values) {
        await clearCache(type);
      }
    } catch (e) {
      throw Exception('Full cache clearance failed: $e');
    }
  }

  /// 获取缓存总大小(格式化)
  Future<String> getTotalCacheSize() async {
    int totalSize = 0;

    for (final type in CacheType.values) {
      final dir = await getCacheDir(type);
      if (await dir.exists()) {
        totalSize += await _calculateDirSize(dir);
      }
    }

    return _formatSize(totalSize);
  }

  /// 获取缓存总大小(int)
  Future<int> getTotalCacheBytes() async {
    int totalSize = 0;
    for (final type in CacheType.values) {
      final dir = await getCacheDir(type);
      if (await dir.exists()) {
        totalSize += await _calculateDirSize(dir);
      }
    }
    return totalSize;
  }

  /// 创建目录（如果不存在）
  Future<Directory> _getOrCreateCacheDir(CacheType type) async {
    final dir = await getCacheDir(type);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  /// 计算目录大小
  Future<int> _calculateDirSize(Directory dir) async {
    int size = 0;
    final files = dir.listSync(recursive: true);

    for (var entity in files) {
      if (entity is File) {
        size += entity.lengthSync();
      }
    }

    return size;
  }

  /// 格式化文件大小
  String _formatSize(int bytes) {
    if (bytes <= 0) return '0 B';
    const units = ['B', 'KB', 'MB', 'GB'];
    int digitGroups = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, digitGroups)).toStringAsFixed(2)} ${units[digitGroups]}';
  }
}

/// 缓存类型枚举
enum CacheType {
  image,
  temp,
  data,
}