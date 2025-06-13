import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../../../routes/route_names.dart';
import '../../../services/cache_manager.dart';
import '../../common/constants/custom_colors.dart';
import '../../common/widgets/custom_appBar.dart';
import '../../theme/theme_manager.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  // SnackBar控制器
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>?
  _snackBarController;
  // 缓存管理器实例
  final CacheManager _cacheManager = CacheManager();
  // 公共常量提取
  static const _cardElevation = 0.0;
  static const _itemSpacing = 12.0;

  // GitHub 仓库信息
  static const String _githubOwner = 'banxxx'; // 替换为你的 GitHub 用户名
  static const String _githubRepo = 'dst_wok'; // 替换为你的 GitHub 仓库名
  static const String _githubReleasesApi =
      'https://api.github.com/repos/$_githubOwner/$_githubRepo/releases/latest';

  // 防抖计时器
  Timer? _debounceTimer;
  // 防抖时间，例如 500 毫秒
  final Duration _debounceDuration = const Duration(milliseconds: 500);

  late double _currentPointerAngle;
  // 目标角度
  final double _angle60 = 60 * (pi / 180);
  final double _angle300 = 300 * (pi / 180);

  // 主题管理器引用
  late ThemeManager _themeManager;

  @override
  void initState() {
    super.initState();

    // 获取主题管理器
    _themeManager = Provider.of<ThemeManager>(context, listen: false);

    // 初始化指针角度
    _updatePointerAngle(_themeManager.themeMode);

    // 监听主题变化
    _themeManager.addListener(_handleThemeChange);
  }

  @override
  void dispose() {
    // 移除监听器
    _themeManager.removeListener(_handleThemeChange);
    // 页面销毁时关闭 SnackBar
    _snackBarController?.close();
    // 页面销毁时取消防抖计时器，避免内存泄漏
    _debounceTimer?.cancel();
    super.dispose();
  }

  // 处理主题变化
  void _handleThemeChange() {
    // 当主题变化时更新指针角度
    _updatePointerAngle(_themeManager.themeMode);
  }

  // 更新指针角度（可选择是否触发动画）
  void _updatePointerAngle(ThemeMode themeMode, [bool animate = true]) {
    setState(() {
      switch (themeMode) {
        case ThemeMode.dark:
          _currentPointerAngle = _angle300;
          break;
        case ThemeMode.light:
          _currentPointerAngle = _angle60;
          break;
        case ThemeMode.system:
          // 系统模式使用亮色角度（或根据实际需求）
          _currentPointerAngle = _angle60;
          break;
      }
    });
  }

  // 7. 统一处理主题切换
  void _handleThemeToggle() {
    // 判断当前模式并切换到相反模式
    ThemeMode newThemeMode;
    switch (_themeManager.themeMode) {
      case ThemeMode.dark:
        newThemeMode = ThemeMode.light;
        break;
      case ThemeMode.light:
      case ThemeMode.system:
        newThemeMode = ThemeMode.dark;
        break;
    }

    // 通过主题管理器切换主题（会自动保存到持久化存储）
    _themeManager.toggleTheme(newThemeMode == ThemeMode.dark);

    // 立即更新指针（监听器也会触发，双保险）
    _updatePointerAngle(newThemeMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: const Text('关于')),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        bottom: true, // 启用底部安全区域
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 主题切换模块 (现在是一个独立的卡片)
              _buildThemeToggleCard(context),
              const SizedBox(height: _itemSpacing),

              // 开源许可证模块
              _buildLicenseCard(context),
              const SizedBox(height: _itemSpacing),

              // GitHub链接
              _buildGitHubCard(),
              const SizedBox(height: _itemSpacing),

              // 资料引用模块
              _buildReferenceCard(context),
              const SizedBox(height: _itemSpacing),

              // 清除缓存模块
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
      color: Theme.of(context).cardColor,
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

  // 打开 URL
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('无法打开: $url');
    }
  }

  // 主题切换卡片
  Widget _buildThemeToggleCard(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, themeManager, child) {
        final bool isDarkMode = themeManager.themeMode == ThemeMode.dark;
        return _customCard(
          // 将 onTap 移动到时钟区域，以便点击时钟切换角度
          onTap: _handleThemeToggle, // 点击卡片区域切换角度
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  title: const Text('主题模式'),
                  subtitle: Text(isDarkMode ? '当前：暗色模式' : '当前：亮色模式'),
                ),
              ),
              Padding(
                // 添加 Padding
                padding: const EdgeInsets.all(16.0), // 调整 Padding 值
                // 时钟区域
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: GestureDetector(
                    // 使用 GestureDetector 来处理时钟区域的点击
                    onTap: _handleThemeToggle,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // 时钟背景图
                        Image.asset(
                          'assets/setting/clock.png', // 替换为你的时钟背景图路径
                          width: 35,
                          height: 35,
                        ),
                        // 指针图
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(
                            begin: _currentPointerAngle,
                            end: _currentPointerAngle,
                          ),
                          duration: const Duration(milliseconds: 500), // 动画时长
                          builder: (context, angle, child) {
                            return Transform.rotate(
                              angle: angle,
                              child: Image.asset(
                                'assets/setting/clock_hand.png', // 替换为你的指针图路径
                                width: 40, // 指针图与背景图大小相同
                                height: 40, // 指针图与背景图大小相同
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 构建 GitHub 链接卡片
  Widget _buildGitHubCard() {
    return _customCard(
      onTap: () => _launchUrl('https://github.com/banxxx/dst_wok'),
      child: const ListTile(
        title: Text('GitHub 仓库'),
        subtitle: Text('查看项目源代码'),
      ),
    );
  }

  // 构建许可证卡片
  Widget _buildLicenseCard(BuildContext context) {
    return _customCard(
      onTap: () => _navigateToLicense(context),
      child: const ListTile(title: Text('开源许可证'), subtitle: Text('GPL-3.0 协议')),
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
          const ListTile(title: Text('资料引用来源'), subtitle: Text('点击查看详细信息')),
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

  // 构建清除缓存卡片
  Widget _buildClearCacheCard(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return _customCard(
      child: ListTile(
        title: const Text('清除缓存'),
        subtitle: FutureBuilder<String>(
          future: _getCacheSize(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Text('当前缓存：${snapshot.data ?? "未知"}');
            }
            return const Text('正在计算缓存大小...');
          },
        ),
        trailing: IconButton(
          icon: Image.asset(
            'assets/setting/wendy_gravestone.png',
            width: 26,
            color: customColors?.cacheBg,
          ),
          onPressed: _handleClearCache,
        ),
      ),
    );
  }

  // 处理清除缓存逻辑
  void _handleClearCache() async {
    try {
      final bytes = await _cacheManager.getTotalCacheBytes();

      if (bytes != 0) {
        await _cacheManager.clearAllCache();
        // 确保 State 仍然挂载后才执行 UI 操作
        if (!mounted) return;
        final messenger = ScaffoldMessenger.of(context);
        _snackBarController = messenger.showSnackBar(
          const SnackBar(content: Text('所有缓存已成功清理')),
        );
        setState(() {}); // 刷新缓存大小显示
      }
    } catch (e) {
      // 确保 State 仍然挂载后才执行 UI 操作
      if (!mounted) return;
      final messenger = ScaffoldMessenger.of(context);
      _snackBarController = messenger.showSnackBar(
        SnackBar(content: Text('清理失败: ${e.toString()}')),
      );
    }
  }

  // 构建版本信息组件
  Widget _buildVersionInfo(BuildContext context) {
    return _customCard(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _checkForUpdateDebounced(), // 调用防抖包装函数，不再传递 context
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
                return const Text(
                  '正在获取版本号...', // 加载中的提示
                );
              }
            },
          ),
        ),
      ),
    );
  }

  // 防抖包装函数，用于延迟执行更新检查
  void _checkForUpdateDebounced() {
    // 如果上一个计时器还在运行，就取消它
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }
    // 设置一个新的计时器
    _debounceTimer = Timer(_debounceDuration, () {
      _checkForUpdate(); // 计时器结束后执行实际的更新检查逻辑，不传递 context
    });
  }

  // 检查更新逻辑 (实际的逻辑，现在由防抖函数调用)
  // 注意：此方法不再接收 BuildContext 参数，而是直接使用 this.context
  void _checkForUpdate() async {
    // 在显示加载指示器前确保 State 仍然挂载
    if (!mounted) return;

    // 1. 显示加载指示器，防止用户疑惑
    showDialog(
      context: context, // 使用 this.context
      barrierDismissible: false, // 不允许点击外部关闭
      builder:
          (ctx) => const AlertDialog(
            // 这里的 ctx 是 dialog 自己的 context，总是安全的
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('正在检查更新...'),
              ],
            ),
          ),
    );

    try {
      final localVersion = await getAppVersion();
      final latestRelease = await _getLatestReleaseFromGitHub();

      // 在关闭加载指示器前确保 State 仍然挂载
      if (!mounted) return;
      // 2. 关闭加载指示器
      Navigator.pop(context); // 使用 this.context

      if (latestRelease != null) {
        final githubVersion = latestRelease['tag_name'] as String;
        final releaseBody = latestRelease['body'] as String;
        final releaseUrl = latestRelease['html_url'] as String;

        // 在显示弹窗前确保 State 仍然挂载
        if (!mounted) return;
        if (_compareVersions(githubVersion, localVersion) > 0) {
          _showUpdateDialog(
            context, // 使用 this.context
            githubVersion,
            releaseBody,
            releaseUrl,
          );
        } else {
          _showNoUpdateDialog(context); // 使用 this.context
        }
      } else {
        // 在显示错误弹窗前确保 State 仍然挂载
        if (!mounted) return;
        _showErrorDialog(context, '无法获取更新信息，请稍后再试。'); // 使用 this.context
      }
    } catch (e) {
      // 在关闭加载指示器前确保 State 仍然挂载
      if (!mounted) return;
      // 3. 关闭加载指示器
      Navigator.pop(context);
      // 在显示错误弹窗前确保 State 仍然挂载
      if (!mounted) return;
      _showErrorDialog(
        context,
        '检查更新时发生错误: ${e.toString()}',
      ); // 使用 this.context
    }
  }

  // 从 GitHub API 获取最新发布信息
  Future<Map<String, dynamic>?> _getLatestReleaseFromGitHub() async {
    try {
      final response = await http.get(Uri.parse(_githubReleasesApi));

      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  // 比较两个版本字符串（简单比较，复杂版本需调整，已处理 'v' 前缀）
  // 返回 > 0 如果 version1 较新，< 0 如果 version2 较新，0 如果相同。
  int _compareVersions(String version1, String version2) {
    // 移除版本号开头的 'v'，如果存在的话
    final cleanVersion1 =
        version1.startsWith('v') ? version1.substring(1) : version1;
    final cleanVersion2 =
        version2.startsWith('v') ? version2.substring(1) : version2;

    final v1Parts = cleanVersion1.split('.').map(int.parse).toList();
    final v2Parts = cleanVersion2.split('.').map(int.parse).toList();

    for (int i = 0; i < v1Parts.length; i++) {
      if (i >= v2Parts.length) return 1; // v1 有更多部分，因此更新
      if (v1Parts[i] > v2Parts[i]) return 1;
      if (v1Parts[i] < v2Parts[i]) return -1;
    }
    if (v2Parts.length > v1Parts.length) return -1; // v2 有更多部分，因此更新
    return 0; // 版本号相同
  }

  // 显示有可用更新的弹窗
  void _showUpdateDialog(
    BuildContext context,
    String githubVersion,
    String releaseBody,
    String releaseUrl,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('发现新版本：$githubVersion'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('更新内容：'),
                  const SizedBox(height: 8),
                  Text(releaseBody),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('稍后更新'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // 关闭弹窗
                  _launchUrl(releaseUrl); // 打开 GitHub 发布页面
                },
                child: const Text('立即更新'),
              ),
            ],
          ),
    );
  }

  // 显示没有可用更新的弹窗
  void _showNoUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('已是最新版本'),
            content: const Text('当前已安装最新版本的应用。'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('确定'),
              ),
            ],
          ),
    );
  }

  // 显示错误弹窗
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('错误'),
            content: Text(message),
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

  // 异步获取应用版本信息
  Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version; // 返回版本号
  }

  // 获取缓存大小
  Future<String> _getCacheSize() async {
    try {
      return await _cacheManager.getTotalCacheSize();
    } catch (e) {
      return '无法获取缓存大小';
    }
  }
}
