import 'package:dst_wok/src/common/constants/app_colors.dart';
import 'package:dst_wok/src/models/campfire_recipe.dart';
import 'package:flutter/material.dart';

import '../../common/utils/TextParserUtil.dart';
import '../../common/widgets/custom_appBar.dart';

/// 火源食谱详情页面
class RecipeDetailsCampfire extends StatelessWidget {
  final CampfireRecipe recipe;

  const RecipeDetailsCampfire({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: const Text('')),
      body: SafeArea(
        bottom: true, // 启用底部安全区域
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildRecipeImage(),
              _buildRecipeInfo(),
              _buildRecipeDocs(),
              if (recipe.tips.isNotEmpty) _buildRecipeTips(),
              // 可以继续添加更多内容
              // 添加底部安全区域间距（自动计算高度）
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
      ),
    );
  }

  // 食谱图片
  Widget _buildRecipeImage() {
    return Center(
      child: Column(
        children: [
          Image.asset(recipe.imageUrl, width: 200, height: 200),
          Image.asset('assets/setting/top.png', width: 150),
          Text(
            recipe.name,
            style: TextStyle(fontSize: 38, color: Colors.grey[600]),
          ),
          Image.asset('assets/setting/bottom.png', width: 150),
          Text(
            '代码: "${recipe.id}"',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  // 食谱补充说明
  Widget _buildRecipeDocs() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFF1D7C3), width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (recipe.desc.isNotEmpty)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/setting/craft_slot_prototype.png',
                      width: 28,
                      height: 28,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            // 基础样式
                            fontSize: 16,
                            color: AppColors.recipeText,
                          ),
                          children: [
                            // 使用工具类解析描述文本
                            ...TextParserUtil.parseCondition(
                              recipe.desc,
                              imgSize: 26, // 调整图片尺寸匹配当前上下文
                              textStyle: TextStyle(
                                // 保持原有文本样式
                                fontSize: 16,
                                color: AppColors.recipeText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              if (recipe.desc.isNotEmpty && recipe.favorites.isNotEmpty)
                const SizedBox(height: 8),
              if (recipe.favorites.isNotEmpty)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      recipe.favorites.first.imageAsset,
                      width: 28,
                      height: 28,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      recipe.favorites.first.displayName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "喜欢的食物",
                      style: TextStyle(fontSize: 16, color: Color(0xFFB2744E)),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  // 食物三维属性
  Widget _buildRecipeInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFF1D7C3), width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatusItem(
                'assets/setting/status_health_64.png',
                '健康值',
                recipe.health.toString(),
                Colors.redAccent,
              ),
              _buildStatusItem(
                'assets/setting/status_hunger_64.png',
                '饥饿值',
                recipe.hunger.toString(),
                Colors.orangeAccent,
              ),
              _buildStatusItem(
                'assets/setting/status_sanity_64.png',
                '理智值',
                recipe.sanity.toString(),
                Colors.deepOrange,
              ),
              _buildStatusItem(
                'assets/setting/status_spoil_64.png',
                '保质期',
                '${recipe.freshness} 天',
                Colors.black26,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 三维组件统一的状态项构建方法
  Widget _buildStatusItem(
    String iconPath,
    String label,
    String value,
    Color color,
  ) {
    final parts = value.split(' ');
    final numberPart = parts[0];
    final unitPart = parts.length > 1 ? parts[1] : '';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Image.asset(iconPath, width: 40, height: 40),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey[600],
            // fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            style: TextStyle(
              // 全局基础样式
              fontSize: 20,
              color: Colors.brown,
              fontWeight: FontWeight.bold,
              height: 1.2, // 统一行高
            ),
            children: [
              TextSpan(
                text: numberPart,
                style: TextStyle(fontFamily: 'LoveLight'),
              ),
              if (unitPart.isNotEmpty)
                TextSpan(
                  text: ' $unitPart',
                  style: TextStyle(
                    fontSize: 16, // 调小字号
                    fontWeight: FontWeight.w100,
                    textBaseline: TextBaseline.ideographic, // 基线对齐
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  // 其他补充说明
  Widget _buildRecipeTips() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFF1D7C3), width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (recipe.tips.isNotEmpty)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            // 基础样式
                            fontSize: 16,
                            color: AppColors.recipeText,
                          ),
                          children: [
                            // 使用工具类解析描述文本
                            ...TextParserUtil.parseCondition(
                              recipe.tips,
                              imgSize: 26, // 调整图片尺寸匹配当前上下文
                              textStyle: TextStyle(
                                // 保持原有文本样式
                                fontSize: 16,
                                color: AppColors.recipeText,
                              ),
                            ),
                          ],
                        ),
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

}
