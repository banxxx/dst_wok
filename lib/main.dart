import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dst_wok/routes/app_router.dart';
import 'package:dst_wok/services/cache_manager.dart';
import 'package:dst_wok/src/common/widgets/window_control_buttons.dart';
import 'package:dst_wok/src/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

/// 应用入口函数
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 并行初始化关键模块
  await Future.wait([
    // 平台相关初始化
    _initPlatformEssentials(),
    // 初始化缓存系统
    _initCoreServices(),
  ], eagerError: true);

  // 启动应用
  runApp(const MyApp());
}

/// 平台相关初始化（按优先级排序）
Future<void> _initPlatformEssentials() async {
  if (Platform.isWindows || Platform.isMacOS) {
    await _initDesktopWindow();
  } else {
    await _initMobileSettings();
  }
}

/// 桌面端窗口配置
Future<void> _initDesktopWindow() async {
  doWhenWindowReady(() {
    appWindow
      ..minSize = const Size(420, 760) // 设置窗口最小尺寸（iPhone 13 mini 的竖屏尺寸）
      ..title =
          "饥锅" // 设置窗口标题（可选）
      ..alignment =
          Alignment
              .center // 设置窗口初始位置居中
      ..show(); // 显示窗口
  });
}

/// 移动端配置
Future<void> _initMobileSettings() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]); // 竖屏正方向
}

/// 核心服务初始化（拆分优先级）
Future<void> _initCoreServices() async {
  // 关键缓存立即加载
  await CacheManager().initCacheDirs();
}

/// 应用创建器
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: Consumer<ThemeManager>(
        builder: (context, themeManager, child) {
          return MaterialApp.router(
            title: '饥锅',
            theme: ThemeData(
              primarySwatch: Colors.blue, // 设置主题颜色
              useMaterial3: true, // 启用Material 3设计
            ),
            // windows窗口装饰和拖拽区域
            builder: (context, child) {
              if (Platform.isWindows || Platform.isMacOS) {
                return WindowBorder(
                  color: Colors.grey[300]!, // 窗口边框颜色
                  width: 0, // 边框宽度
                  child: Column(
                    // 启用拖拽的核心组件
                    children: [
                      // 标题栏容器（关键修正）
                      Container(
                        height: 32,
                        color: Colors.white, // 必须设置背景色
                        child: Row(
                          children: [
                            Expanded(child: MoveWindow()),
                            // 添加按钮间距
                            WindowControlButtons(),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 8),
                          child: child!,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Material(child: child);
            },
            routerConfig: router, // 使用我们配置的路由
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
