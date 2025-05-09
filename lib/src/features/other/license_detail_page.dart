import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LicenseDetailPage extends StatelessWidget {
  const LicenseDetailPage({super.key});

  Future<String> _loadLicense() async {
    return await rootBundle.loadString('assets/document/license.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPL-3.0 协议'),
        centerTitle: true, // 全局居中
      ),
      body: FutureBuilder<String>(
        future: _loadLicense(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('加载失败: ${snapshot.error}'),
            );
          }

          return _buildScrollableContent(context, snapshot.data!);
        },
      ),
    );
  }

  Widget _buildScrollableContent(BuildContext context, String text) {
    return SingleChildScrollView( // 滚动容器
      padding: const EdgeInsets.all(16),
      child: SelectableText( // 使用可选文本组件
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          height: 1.5,
          fontSize: 14,
        ),
      ),
    );
  }
}