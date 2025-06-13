import 'package:dst_wok/src/common/constants/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/route_names.dart';
import '../../common/enums/cooking_method.dart';
import '../../models/base_recipe.dart';
import '../../repositories/recipe_repository.dart';
import '../drawer/app_end_drawer.dart';
import 'method_selector.dart';
import 'recipe_selector.dart';

/// 定义排序字段的枚举
enum SortField {
  health,
  hunger,
  sanity,
  // 可以添加其他需要排序的字段，例如 name
  // name,
}

/// 定义排序顺序的枚举
enum SortOrder { ascending, descending }

/// 自定义顶部按钮组件
class CraftingScreen extends StatefulWidget {
  const CraftingScreen({super.key});

  @override
  State<CraftingScreen> createState() => _CraftingScreenState();
}

class _CraftingScreenState extends State<CraftingScreen> {
  // 当前选中的烹饪方式（默认烹饪锅）
  CookingMethod _currentMethod = CookingMethod.crockPot;
  late PageController _pageController; // 新增页面控制器

  // 用于管理搜索框文本的控制器
  final TextEditingController _searchController = TextEditingController();
  // 使用 ValueNotifier 来持有过滤后的食谱列表
  late ValueNotifier<List<BaseRecipe>> _filteredRecipesNotifier;

  // 数据仓库实例
  final _repo = RecipeRepository();

  // 记录当前选择的排序字段
  SortField _currentSortField = SortField.health; // 默认按生命值排序
  // 记录当前选择的排序顺序
  SortOrder _currentSortOrder = SortOrder.descending; // 默认降序

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentMethod.index, // 初始页面对应方法索引
    );
    // 初始化 ValueNotifier
    _filteredRecipesNotifier = ValueNotifier<List<BaseRecipe>>([]);
    // 监听搜索框文本变化
    _searchController.addListener(_filterRecipes);
    // 初始化过滤后的食谱列表
    _filterRecipes();
  }

  @override
  void dispose() {
    _pageController.dispose(); // 释放资源
    _searchController.removeListener(_filterRecipes); // 移除监听器
    _searchController.dispose(); // 释放控制器
    _filteredRecipesNotifier.dispose(); // 释放 ValueNotifier
    super.dispose();
  }

  // 根据当前方法和搜索文本过滤食谱
  void _filterRecipes() {
    final method = _currentMethod; // 获取当前方法
    final searchText = _searchController.text.toLowerCase();

    // 1. 获取过滤后的食谱列表 (使用 RecipeRepository 的 searchRecipes 方法)
    List<BaseRecipe> filteredList = _repo.searchRecipes(method, searchText);

    // 2. 根据当前排序字段和顺序进行排序
    filteredList.sort((a, b) {
      int compareResult = 0;
      switch (_currentSortField) {
        case SortField.health:
          // 确保 health, hunger, sanity 是可比较的类型 (如 num)
          compareResult = (a.health as num).compareTo(b.health as num);
          break;
        case SortField.hunger:
          compareResult = (a.hunger as num).compareTo(b.hunger as num);
          break;
        case SortField.sanity:
          compareResult = (a.sanity as num).compareTo(b.sanity as num);
          break;
        // case SortField.name: // 如果需要按名称排序
        //   compareResult = a.name.compareTo(b.name);
        //   break;
      }
      // 应用排序顺序
      return _currentSortOrder == SortOrder.ascending
          ? compareResult
          : -compareResult;
    });
    // 更新 ValueNotifier 的值
    _filteredRecipesNotifier.value = filteredList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 80, // 高度
        // 烹饪方式选择区域
        title: MethodSelector(
          currentMethod: _currentMethod,
          onMethodChanged: (newMethod) {
            // 切换方法时也收起键盘
            FocusScope.of(context).unfocus();
            _updateMethodWithAnimation(newMethod);
          },
          pageController:
              _pageController, // 将 PageController 传递给 MethodSelector
        ),
        centerTitle: false, // 关闭居中
        actions: [
          // 在右上角添加抽屉按钮
          Builder(
            builder:
                (context) => IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(), // 可选：移除默认的最小点击区域约束
                  icon: Padding(
                    // 在图标外部添加 padding
                    padding: const EdgeInsets.only(right: 12.0),
                    child: SvgPicture.asset(
                      'assets/setting/list-ui-mono.svg', // 使用 SVG 图标
                      width: 38,
                      height: 38,
                    ),
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus(); // 点击抽屉按钮也收起键盘
                    Scaffold.of(context).openEndDrawer();
                  },
                  hoverColor: Colors.transparent, // 移除悬停背景色
                  highlightColor: Colors.transparent, // 移除按压高亮色
                  splashColor: Colors.transparent, // 移除水波纹效果
                ),
          ),
        ],
      ),
      endDrawer: const AppEndDrawer(),
      body: Listener(
        onPointerDown: (_) {
          // 只有当当前有焦点（键盘可能弹出了）时才收起键盘
          if (FocusManager.instance.primaryFocus?.hasFocus ?? false) {
            FocusScope.of(context).unfocus();
          }
        },
        child: Column(
          children: [
            // 搜索输入框
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 8.0,
              ),
              child: Row(
                // 将搜索框和筛选按钮放在一个 Row 中
                children: [
                  Expanded(
                    // 让搜索框占据 Row 的大部分空间
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        // hintText: '搜索食谱名称',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none, // 可选，去除边框
                        ),
                        filled: true, // 可选，填充背景颜色
                        fillColor: Theme.of(context).cardColor, // 可选，背景颜色
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 10.0,
                        ),
                      ),
                      onSubmitted:
                          (_) => FocusScope.of(context).unfocus(), // 提交时隐藏键盘
                      onChanged: (_) => _filterRecipes(), // 输入变化时实时过滤和排序
                    ),
                  ),
                  const SizedBox(width: 8.0), // 搜索框和按钮之间的间距
                  // 筛选按钮
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/setting/filter-mono.svg', // 使用 SVG 图标
                      width: 28, // 根据需要调整图标大小
                      height: 28,
                      color: Theme.of(context).iconTheme.color, // 使用主题颜色
                    ), // 筛选图标
                    onPressed: () {
                      FocusScope.of(context).unfocus(); // 点击筛选按钮收起键盘
                      _showSortOptions(context); // 显示排序选项底部弹窗
                    },
                    // 根据需要调整按钮的视觉样式
                    splashColor: Colors.transparent, // 移除水波纹效果
                    padding: EdgeInsets.zero, // 移除默认内边距
                    tooltip: '筛选食谱', // 长按提示
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  _updateMethod(CookingMethod.values[index]);
                  _filterRecipes(); // 当页面改变时重新过滤并更新 ValueNotifier
                },
                itemCount: CookingMethod.values.length,
                itemBuilder: (context, index) => _buildRecipePage(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipePage(int index) {
    final method = CookingMethod.values[index];
    // 使用 ValueListenableBuilder 监听 _filteredRecipesNotifier 的变化
    return ValueListenableBuilder<List<BaseRecipe>>(
      valueListenable: _filteredRecipesNotifier,
      builder: (context, filteredRecipes, child) {
        // 在这里根据当前页面的方法，再次过滤 ValueNotifier 中的食谱列表
        // 这是为了确保在 PageView 切换时，即使搜索文本没变，也能显示对应方法的过滤结果
        // final currentMethodFilteredRecipes =
        //     filteredRecipes.where((recipe) => recipe.method == method).toList();
        // RecipeSelector 现在接收过滤后的食谱列表
        return RecipeSelector(
          key: PageStorageKey(method),
          selectedMethod: method,
          recipes: filteredRecipes, // 将过滤后的食谱列表传递给 RecipeSelector
          onSelect: _handleSelectRecipe,
        );
      },
    );
  }

  // 带动画的更新方法
  void _updateMethodWithAnimation(CookingMethod newMethod) {
    if (_currentMethod == newMethod) return;
    _pageController.animateToPage(
      newMethod.index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // 同步更新方法
  void _updateMethod(CookingMethod newMethod) {
    if (_currentMethod == newMethod) return;
    setState(() => _currentMethod = newMethod);
  }

  void _handleSelectRecipe(BaseRecipe selectedRecipe) {
    if (CookingMethod.campfire == selectedRecipe.method) {
      context.pushNamed(
        RouteNames.recipeDetailsCampfire,
        extra: selectedRecipe, // 传递数据
      );
    } else {
      context.pushNamed(
        RouteNames.recipeDetails,
        extra: selectedRecipe, // 传递数据
      );
    }
  }

  // 显示排序选项底部弹窗的方法
  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          // 确保内容不会被系统 UI 遮挡
          child: Wrap(
            // Wrap 会根据内容自动调整高度
            children: <Widget>[
              // 标题
              ListTile(
                title: Text(
                  '排序方式',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                ),
              ),
              // const Divider(), // 分隔线
              // 按生命值排序选项
              _buildSortOptionTile(context, SortField.health, '生命值'),
              // 按饱食度排序选项
              _buildSortOptionTile(context, SortField.hunger, '饱食度'),
              // 按 San 值排序选项
              _buildSortOptionTile(context, SortField.sanity, 'San值'),
            ],
          ),
        );
      },
    );
  }

  // 构建单个排序选项的 ListTile
  Widget _buildSortOptionTile(
    BuildContext context,
    SortField field,
    String title,
  ) {
    // 判断当前是否选中该字段
    bool isSelectedField = _currentSortField == field;
    final customColors = Theme.of(context).extension<CustomColors>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 0.0,
          ), // 减小垂直内边距
          title: Text(
            title,
            style: TextStyle(
              height: 1.0,
              fontWeight: isSelectedField ? FontWeight.bold : FontWeight.normal,
              color: isSelectedField ? customColors?.sortText : null,
            ),
          ),
          trailing:
              isSelectedField
                  ? (_currentSortOrder == SortOrder.ascending
                      ? const Icon(Icons.arrow_upward)
                      : const Icon(Icons.arrow_downward))
                  : null, // 未选中时不显示图标
          onTap: () {
            // 如果点击的是当前已选字段，则切换排序顺序
            if (isSelectedField) {
              setState(() {
                _currentSortOrder =
                    _currentSortOrder == SortOrder.ascending
                        ? SortOrder.descending
                        : SortOrder.ascending;
              });
            } else {
              // 如果点击的是新的字段，则切换字段并重置排序顺序为降序 (或你希望的默认顺序)
              setState(() {
                _currentSortField = field;
                _currentSortOrder = SortOrder.descending; // 默认降序
              });
            }
            Navigator.pop(context); // 关闭底部弹窗
            _filterRecipes(); // 重新过滤和排序食谱列表
          },
        ),
        // if (isSelectedField) const Divider(), // 如果选中，在下面加一条分隔线
      ],
    );
  }
}
