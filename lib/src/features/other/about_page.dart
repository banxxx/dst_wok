import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于项目'),
        centerTitle: true,
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
                child: Image.asset('assets/setting/books01-7.png'), // 替换为你的应用图标路径
              ),
            ),
            const SizedBox(height: 24),

            // 项目名称
            Text(
              '饥荒厨房模拟器',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // 项目简介
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      '项目简介',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '这是一个基于《饥荒》游戏的厨房模拟器应用，'
                          '帮助玩家快速查询各种烹饪配方和食材组合。'
                          '应用包含了游戏中所有烹饪锅、便携锅和火堆的配方，'
                          '并提供了智能搜索和收藏功能。',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // GitHub链接
            Card(
              child: ListTile(
                leading: const Icon(Icons.code),
                title: const Text('GitHub 仓库'),
                subtitle: const Text('查看项目源代码'),
                trailing: const Icon(Icons.open_in_new),
                onTap: () => _launchUrl('https://github.com/yourusername/dont-starve-cookbook'),
              ),
            ),
            const SizedBox(height: 12),

            // 作者信息
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      '开发团队',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 作者1
                    _buildAuthorTile(
                      context,
                      avatar: 'assets/setting/books01-7.png', // 替换为作者头像路径
                      name: '张三',
                      role: '主开发者 & UI设计',
                      email: 'zhangsan@example.com',
                    ),
                    const SizedBox(height: 12),

                    // 作者2
                    _buildAuthorTile(
                      context,
                      avatar: 'assets/setting/books01-7.png', // 替换为作者头像路径
                      name: '李四',
                      role: '后端开发 & 数据整理',
                      email: 'lisi@example.com',
                    ),
                  ],
                ),
              ),
            ),

            // 版本信息
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                '版本 1.0.0',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 作者信息组件
  Widget _buildAuthorTile(
      BuildContext context, {
        required String avatar,
        required String name,
        required String role,
        required String email,
      }) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(avatar),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                role,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              GestureDetector(
                onTap: () => _launchUrl('mailto:$email'),
                child: Text(
                  email,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 打开URL
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('无法打开: $url');
    }
  }
}