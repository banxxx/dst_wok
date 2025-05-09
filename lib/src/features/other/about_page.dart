import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/route_names.dart';
import '../../common/widgets/custom_appBar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('关于'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 项目图标
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/setting/ic_launcher.png'), // 替换为你的应用图标路径
              ),
            ),
            const SizedBox(height: 24),

            // 项目名称
            Text(
              '饥锅',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // 应用简介
            _buildInfoCard(context),
            const SizedBox(height: 20),

            // 开源许可证模块
            _buildLicenseCard(context),
            const SizedBox(height: 12),

            // GitHub链接
            _buildGitHubCard(),
            const SizedBox(height: 20),

            // 新增资料引用模块
            _buildReferenceCard(context),
            const SizedBox(height: 12),


            // 版本信息模块（增加点击功能）
            _buildVersionInfo(context),
          ],
        ),
      ),
    );
  }

  // 打开URL
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('无法打开: $url');
    }
  }

  // 简介卡片
  Widget _buildInfoCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            const Text(
              '这是一个基于《饥荒联机版》游戏的食谱查询应用，'
                  '帮助玩家快速查询各种烹饪配方和食材组合。'
                  '应用目前只包含了联机版游戏中的火源烹饪及料理烹饪的配方说明。'
                  '资料参考灰机WIKI(饥荒板块)和哔哩哔哩饥荒WIKI',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // GitHub链接
  Widget _buildGitHubCard() {
    return Card(
      child: ListTile(
        leading: Image.asset(
          'assets/setting/wendy_gravestone.png',
          width: 28,
          height: 28,
        ),
        title: const Text('GitHub 仓库'),
        subtitle: const Text('查看项目源代码'),
        onTap: () => _launchUrl('https://github.com/banxxx/dst_wok'),
      ),
    );
  }

  // 构建许可证卡片
  Widget _buildLicenseCard(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.article_outlined),
        title: const Text('开源许可证'),
        subtitle: const Text('GPL-3.0 协议'),
        onTap: () => _navigateToLicense(context),
      ),
    );
  }

  // 构建资料引用卡片
  Widget _buildReferenceCard(BuildContext context) {
    final references = [
      {
        'title': '灰机WIKI - 饥荒板块',
        'url': 'https://dontstarve.fandom.com/zh/wiki/%E9%A5%A5%E8%8D%92_Wiki'
      },
      {
        'title': '哔哩哔哩饥荒WIKI',
        'url': 'https://wiki.biligame.com/dst/%E9%A6%96%E9%A1%B5'
      },
    ];

    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.source_outlined),
            title: Text('资料引用来源'),
            subtitle: Text('点击查看详细信息'),
          ),
          ...references.map((ref) => ListTile(
            title: Text(ref['title']!),
            trailing: const Icon(Icons.open_in_new),
            dense: true,
            onTap: () => _launchUrl(ref['url']!),
          )),
        ],
      ),
    );
  }

// 构建版本信息
  Widget _buildVersionInfo(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12), // 保持圆角一致
        onTap: () => _checkForUpdate(context),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 图标
              Icon(
                Icons.system_update_alt_outlined,
                size: 28,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 12),
              // 版本号
              Text(
                '当前版本',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                '1.0.0',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // 更新提示
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 16,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '已是最新版本',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ],
              ),
            ],
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
      builder: (context) => AlertDialog(
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

}