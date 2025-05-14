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
  // 初始化绑定
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化缓存系统
  await CacheManager().initCacheDirs();

  // 仅限桌面端执行窗口初始化
  if (Platform.isWindows || Platform.isMacOS) {
    doWhenWindowReady(() {
      // 设置窗口最小尺寸（iPhone 13 mini 的竖屏尺寸）
      appWindow.minSize = const Size(420, 760);
      // 设置窗口标题（可选）
      appWindow.title = "饥锅";
      // 设置窗口初始位置居中（可选）
      appWindow.alignment = Alignment.center;
      // 显示窗口
      appWindow.show();
    });
  }

  // 锁定竖屏方向（移动端专用）
  if (Platform.isAndroid || Platform.isIOS) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // 竖屏正方向
    ]);
  }

  // 启动应用
  runApp(const MyApp());
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
              return WindowBorder(
                color: Colors.grey[300]!,       // 窗口边框颜色
                width: 0,                       // 边框宽度
                child: Column(              // 启用拖拽的核心组件
                  children: [
                    // 标题栏容器（关键修正）
                    Container(
                      height: 32,
                      color: Colors.white, // 必须设置背景色
                      child: Row(
                        children: [
                          Expanded(
                            child: MoveWindow(),
                          ),
                          // 添加按钮间距
                          WindowControlButtons(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: child!,
                    ),
                  ]
                ),
              );
            },
            routerConfig: router, // 使用我们配置的路由
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
