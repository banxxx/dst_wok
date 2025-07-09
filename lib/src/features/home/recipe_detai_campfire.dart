import 'package:dst_wok/src/models/campfire_recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/constants/custom_colors.dart';
import '../../common/utils/TextParserUtil.dart';
import '../../common/widgets/custom_appBar.dart';

/// 火源食谱详情页面
class RecipeDetailsCampfire extends StatelessWidget {
  final CampfireRecipe recipe;

  const RecipeDetailsCampfire({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    // 获取屏幕宽度
    final screenWidth = MediaQuery.of(context).size.width;
    double maxWidthRatio = 1; // 默认100%

    // 多种设备判断
    switch (screenWidth) {
      case < 360: // 小屏手机
        maxWidthRatio = 0.98;
        break;
      case < 480: // 普通手机
        maxWidthRatio = 0.92;
        break;
      case < 600: // 大屏手机
        maxWidthRatio = 0.86;
        break;
      case < 768: // 小屏平板
        maxWidthRatio = 0.78;
        break;
      case < 992: // 普通平板
        maxWidthRatio = 0.72;
        break;
      case < 1200: // 大屏平板
        maxWidthRatio = 0.68;
        break;
      case < 1440: // 小屏电脑
        maxWidthRatio = 0.64;
        break;
      case < 1920: // 普通电脑
        maxWidthRatio = 0.62;
        break;
      default: // 超大屏幕
        maxWidthRatio = 0.6;
    }

    final maxWidth = screenWidth * maxWidthRatio;

    return Scaffold(
      appBar: CustomAppBar(title: const Text('')),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        bottom: true, // 启用底部安全区域
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildRecipeImage(context),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: _buildRecipeInfo(context),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: _buildRecipeDocs(context),
              ),
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
  Widget _buildRecipeImage(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(recipe.imageUrl, width: 200, height: 200),
          Image.asset('assets/setting/top.png', width: 150),
          Text(
            recipe.name,
            style: TextStyle(
              fontSize: 38,
              color: Theme.of(context).extension<CustomColors>()!.recipeTitle,
            ),
          ),
          Image.asset('assets/setting/bottom.png', width: 150),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).extension<CustomColors>()!.recipePrimary,
              ),
              children: [
                TextSpan(text: '代码: "'),
                WidgetSpan(
                  child: InkWell(
                    onLongPress: () {
                      Clipboard.setData(ClipboardData(text: recipe.id));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('代码 "${recipe.id}" 已复制到剪贴板!')),
                      );
                    },
                    borderRadius: BorderRadius.circular(4.0), // 添加圆角
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        recipe.id,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).extension<CustomColors>()!.recipePrimary,
                        ),
                      ),
                    ),
                  ),
                ),
                TextSpan(text: '"'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 食谱补充说明
  Widget _buildRecipeDocs(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                Theme.of(context).extension<CustomColors>()!.recipeDetailBorder,
            width: 2,
          ),
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
                            color:
                                Theme.of(
                                  context,
                                ).extension<CustomColors>()!.recipePrimary,
                          ),
                          children: [
                            // 使用工具类解析描述文本
                            ...TextParserUtil.parseCondition(
                              recipe.desc,
                              imgSize: 26, // 调整图片尺寸匹配当前上下文
                              textStyle: TextStyle(
                                // 保持原有文本样式
                                fontSize: 16,
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<CustomColors>()!.recipePrimary,
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
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            Theme.of(context)
                                .extension<CustomColors>()!
                                .recipeSelectorBorderOut,
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

  // 食物三维属性
  Widget _buildRecipeInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).extension<CustomColors>()?.recipeDetailBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color:
                Theme.of(context).extension<CustomColors>()!.recipeDetailBorder,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatusItem(
                context,
                'assets/setting/status_health_64.png',
                '健康值',
                recipe.health.toString(),
                Colors.redAccent,
              ),
              _buildStatusItem(
                context,
                'assets/setting/status_hunger_64.png',
                '饥饿值',
                recipe.hunger.toString(),
                Colors.orangeAccent,
              ),
              _buildStatusItem(
                context,
                'assets/setting/status_sanity_64.png',
                '理智值',
                recipe.sanity.toString(),
                Colors.deepOrange,
              ),
              _buildStatusItem(
                context,
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
    BuildContext context,
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
              color: Theme.of(context).extension<CustomColors>()!.recipePrimary,
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
}
