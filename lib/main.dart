import 'package:dst_wok/routes/app_router.dart';
import 'package:dst_wok/src/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

/// 应用入口函数
void main() {
  // 初始化绑定
  WidgetsFlutterBinding.ensureInitialized();
  // 锁定竖屏方向
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // 竖屏正方向
  ]).then((_) {
    runApp(MyApp());
  });
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
            routerConfig: router, // 使用我们配置的路由
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
