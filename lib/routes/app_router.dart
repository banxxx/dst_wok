import 'package:dst_wok/src/models/campfire_recipe.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../src/features/home/crafting_screen.dart';
import '../src/features/home/recipe_detai_campfire.dart';
import '../src/features/home/recipe_detail.dart';
import '../src/features/other/about_page.dart';
import '../src/features/other/license_detail_page.dart';
import '../src/models/base_recipe.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const CraftingScreen(),
    ),
    GoRoute(
      path: '/foodbook',
      name: 'foodbook',
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      path: '/maketool',
      name: 'maketool',
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      path: '/about',
      name: 'about',
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      path: '/recipeDetails',
      name: 'recipeDetails',
      builder: (context, state) {
        final recipe = state.extra as BaseRecipe; // 接收参数
        return RecipeDetails(recipe: recipe);
      },
    ),
    GoRoute(
      path: '/recipeDetailsCampfire',
      name: 'recipeDetailsCampfire',
      builder: (context, state) {
        final recipe = state.extra as CampfireRecipe; // 接收参数
        return RecipeDetailsCampfire(recipe: recipe);
      },
    ),
    GoRoute(
      path: '/licenseDetailPage',
      name: 'licenseDetailPage',
      builder: (context, state) => const LicenseDetailPage()
    ),
  ],

  // 错误页面处理
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Error: ${state.error}'),
    ),
  ),
);