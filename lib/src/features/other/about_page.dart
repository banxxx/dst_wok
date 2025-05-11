import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/route_names.dart';
import '../../common/widgets/custom_appBar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  // 公共常量提取
  static const _cardElevation = 0.0;
  static const _itemSpacing = 12.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: const Text('关于')),
      body: SafeArea(
        bottom: true, // 启用底部安全区域
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 开源许可证模块
              _buildLicenseCard(context),
              const SizedBox(height: _itemSpacing),

              // GitHub链接
              _buildGitHubCard(),
              const SizedBox(height: _itemSpacing),

              // 新增资料引用模块
              _buildReferenceCard(context),
              const SizedBox(height: _itemSpacing),

              _buildClearCacheCard(context),
              const SizedBox(height: _itemSpacing),

              // 版本信息模块（增加点击功能）
              _buildVersionInfo(context),

              // 添加底部安全区域间距（自动计算高度）
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
      ),
    );
  }

  // 可复用的卡片点击效果
  Widget _customCard({required Widget child, VoidCallback? onTap}) {
    return Card(
      elevation: _cardElevation,
      shape: RoundedRectangleBorder(
        // 添加圆角
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12), // 圆角匹配卡片
        onTap: onTap,
        child: child,
      ),
    );
  }

  // 打开URL
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('无法打开: $url');
    }
  }

  // GitHub链接
  Widget _buildGitHubCard() {
    return _customCard(
      onTap: () => _launchUrl('https://github.com/banxxx/dst_wok'),
      child: ListTile(
        title: const Text('GitHub 仓库'),
        subtitle: const Text('查看项目源代码'),
      ),
    );
  }

  // 构建许可证卡片
  Widget _buildLicenseCard(BuildContext context) {
    return _customCard(
      onTap: () => _navigateToLicense(context),
      child: ListTile(
        title: const Text('开源许可证'),
        subtitle: const Text('GPL-3.0 协议'),
      ),
    );
  }

  // 构建资料引用卡片
  Widget _buildReferenceCard(BuildContext context) {
    final references = [
      {
        'title': '灰机WIKI - 饥荒板块',
        'url': 'https://dontstarve.huijiwiki.com/wiki/',
      },
    ];

    return _customCard(
      child: Column(
        children: [
          ListTile(
            title: const Text('资料引用来源'),
            subtitle: const Text('点击查看详细信息'),
          ),
          // 添加分割线
          const Divider(
            height: 1, // 分割线高度
            thickness: 1, // 线宽
            indent: 16, // 左侧缩进
            endIndent: 16, // 右侧缩进
            color: Colors.black12, // 颜色设置
          ),
          ...references.map(
            (ref) => Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(12), // 底部圆角匹配卡片
                ),
                onTap: () => _launchUrl(ref['url']!),
                child: ListTile(
                  title: Text(
                    ref['title']!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  dense: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 新增缓存清理卡片
  Widget _buildClearCacheCard(BuildContext context) {
    return _customCard(
      child: ListTile(
        title: const Text('清除缓存'),
        subtitle: FutureBuilder<String>(
          future: _getCacheSize(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Text('当前缓存：${snapshot.data ?? "未知"}');
            }
            return Text('正在计算缓存大小...');
          },
        ),
        trailing: IconButton(
          icon: Image.asset('assets/setting/wendy_gravestone.png', width: 26),
          onPressed: () async {
            final messenger = ScaffoldMessenger.of(context);
            try {
              await _clearCache();
              messenger.showSnackBar(const SnackBar(content: Text('缓存清理成功')));
            } catch (e) {
              messenger.showSnackBar(SnackBar(content: Text('清理失败：$e')));
            }
          },
        ),
      ),
    );
  }

  // 构建版本信息
  Widget _buildVersionInfo(BuildContext context) {
    return Card(
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _checkForUpdate(context),
        child: ListTile(
          title: const Text('检查更新'),
          subtitle: FutureBuilder<String>(
            future: getAppVersion(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Text(
                  '当前版本: ${snapshot.data ?? "未知"}', // 成功时显示版本号，失败显示"未知"
                );
              } else {
                return Text(
                  '正在获取版本号...', // 加载中的提示
                );
              }
            },
          ),
        ),
      ),
    );
  }

  // 检查更新逻辑
  void _checkForUpdate(BuildContext context) {
    // 这里可以添加实际的更新检查逻辑
    // 示例弹窗提示
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('已是最新版本'),
            content: const Text('当前已安装最新版本的应用'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('确定'),
              ),
            ],
          ),
    );
  }

  // 导航到许可证详情页
  void _navigateToLicense(BuildContext context) {
    context.pushNamed(RouteNames.licenseDetailPage);
  }

  // 异步获取版本信息
  Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version; // 返回版本号
  }

  // 新增方法：获取缓存目录路径
  Future<Directory> _getCacheDir() async {
    return await getTemporaryDirectory();
  }

  // 新增方法：获取缓存大小
  Future<String> _getCacheSize() async {
    final dir = await _getCacheDir();
    int size = 0;

    if (await dir.exists()) {
      final files = dir.listSync(recursive: true);
      for (var file in files) {
        if (file is File) {
          size += await file.length();
        }
      }
    }

    if (size < 1024) {
      return '${size}B';
    } else if (size < 1048576) {
      return '${(size / 1024).toStringAsFixed(2)}KB';
    } else {
      return '${(size / 1048576).toStringAsFixed(2)}MB';
    }
  }

  // 新增方法：清除缓存
  Future<void> _clearCache() async {
    final dir = await _getCacheDir();
    if (await dir.exists()) {
      await dir.delete(recursive: true);
    }
  }
}
