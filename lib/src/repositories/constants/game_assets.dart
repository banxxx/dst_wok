import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../../common/enums/character.dart';

/// 食材常量池
class Ingredient {
  final String id; // 素材唯一标识符
  final String imageAsset; // 素材图片资源路径
  final String displayName; // 显示名称

  /// 常量构造函数
  const Ingredient({
    required this.id,
    required this.imageAsset,
    required this.displayName,
  });

  // 重写 == 和 hashCode，基于 id 判断相等性
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Ingredient && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

abstract class GameAssets {
  // 基础路径常量
  static const _campfirePath = 'assets/campfire'; // 火源烹饪
  static const _campfire64Path = 'assets/campfire_64'; // 火源烹饪64分辨率
  static const _crockPotPath = 'assets/crockPot'; // 烹饪锅烹饪
  static const _crockPot64Path = 'assets/crockPot_64'; // 烹饪锅烹饪64分辨率
  static const _ingredientsPath = 'assets/ingredients'; // 原始食材素材
  static const _portableCookerPath = 'assets/portableCooker'; // 便携锅烹饪
  static const _portableCooker64Path = 'assets/portableCooker_64'; // 便携锅烹饪64分辨率
  static const _otherPath = 'assets/other'; // 其他

  //========== 食材分类 ==========//

  /// 火源烹饪
  static const acornCooked = Ingredient(
    id: 'acorn_cooked',
    imageAsset: '$_campfirePath/acorn_cooked.png',
    displayName: '烤桦栗果',
  );
  static const ancientfruitNightvisionCooked = Ingredient(
    id: 'ancientfruit_nightvision_cooked',
    imageAsset: '$_campfirePath/ancientfruit_nightvision_cooked.png',
    displayName: '熟夜莓',
  );
  static const asparagusCooked = Ingredient(
    id: 'asparagus_cooked',
    imageAsset: '$_campfirePath/asparagus_cooked.png',
    displayName: '烤芦笋',
  );
  static const barnacleCooked = Ingredient(
    id: 'barnacle_cooked',
    imageAsset: '$_campfirePath/barnacle_cooked.png',
    displayName: '熟藤壶',
  );
  static const batnoseCooked = Ingredient(
    id: 'batnose_cooked',
    imageAsset: '$_campfirePath/batnose_cooked.png',
    displayName: '炭烤鼻孔',
  );
  static const batwingCooked = Ingredient(
    id: 'batwing_cooked',
    imageAsset: '$_campfirePath/batwing_cooked.png',
    displayName: '熟蝙蝠翅膀',
  );
  static const berriesCooked = Ingredient(
    id: 'berries_cooked',
    imageAsset: '$_campfirePath/berries_cooked.png',
    displayName: '烤浆果',
  );
  static const berriesJuicyCooked = Ingredient(
    id: 'berries_juicy_cooked',
    imageAsset: '$_campfirePath/berries_juicy_cooked.png',
    displayName: '烤多汁浆果',
  );
  static const birdEggCooked = Ingredient(
    id: 'bird_egg_cooked',
    imageAsset: '$_campfirePath/bird_egg_cooked.png',
    displayName: '熟鸟蛋',
  );
  static const blueCapCooked = Ingredient(
    id: 'blue_cap_cooked',
    imageAsset: '$_campfirePath/blue_cap_cooked.png',
    displayName: '熟蓝蘑菇',
  );
  static const cactusMeatCooked = Ingredient(
    id: 'cactus_meat_cooked',
    imageAsset: '$_campfirePath/cactus_meat_cooked.png',
    displayName: '熟仙人掌肉',
  );
  static const carrotCooked = Ingredient(
    id: 'carrot_cooked',
    imageAsset: '$_campfirePath/carrot_cooked.png',
    displayName: '烤胡萝卜',
  );
  static const caveBananaCooked = Ingredient(
    id: 'cave_banana_cooked',
    imageAsset: '$_campfirePath/cave_banana_cooked.png',
    displayName: '熟香蕉',
  );
  static const cookedmandrake = Ingredient(
    id: 'cookedmandrake',
    imageAsset: '$_campfirePath/cookedmandrake.png',
    displayName: '熟曼德拉草',
  );
  static const cookedmeat = Ingredient(
    id: 'cookedmeat',
    imageAsset: '$_campfirePath/cookedmeat.png',
    displayName: '熟肉',
  );
  static const cookedmonstermeat = Ingredient(
    id: 'cookedmonstermeat',
    imageAsset: '$_campfirePath/cookedmonstermeat.png',
    displayName: '熟怪物肉',
  );
  static const cookedsmallmeat = Ingredient(
    id: 'cookedsmallmeat',
    imageAsset: '$_campfirePath/cookedsmallmeat.png',
    displayName: '熟小肉',
  );
  static const cornCooked = Ingredient(
    id: 'corn_cooked',
    imageAsset: '$_campfirePath/corn_cooked.png',
    displayName: '爆米花',
  );
  static const dragonfruitCooked = Ingredient(
    id: 'dragonfruit_cooked',
    imageAsset: '$_campfirePath/dragonfruit_cooked.png',
    displayName: '熟火龙果',
  );
  static const drumstickCooked = Ingredient(
    id: 'drumstick_cooked',
    imageAsset: '$_campfirePath/drumstick_cooked.png',
    displayName: '炸鸟腿',
  );
  static const durianCooked = Ingredient(
    id: 'durian_cooked',
    imageAsset: '$_campfirePath/durian_cooked.png',
    displayName: '超臭榴莲',
  );
  static const eelCooked = Ingredient(
    id: 'eel_cooked',
    imageAsset: '$_campfirePath/eel_cooked.png',
    displayName: '熟鳗鱼',
  );
  static const eggplantCooked = Ingredient(
    id: 'eggplant_cooked',
    imageAsset: '$_campfirePath/eggplant_cooked.png',
    displayName: '烤茄子',
  );
  static const figCooked = Ingredient(
    id: 'fig_cooked',
    imageAsset: '$_campfirePath/fig_cooked.png',
    displayName: '熟无花果',
  );
  static const fishMeatCooked = Ingredient(
    id: 'fish_meat_cooked',
    imageAsset: '$_campfirePath/fish_meat_cooked.png',
    displayName: '鱼排',
  );
  static const fishMeatSmallCooked = Ingredient(
    id: 'fish_meat_small_cooked',
    imageAsset: '$_campfirePath/fish_meat_small_cooked.png',
    displayName: '熟小鱼块',
  );
  static const froglegsCooked = Ingredient(
    id: 'froglegs_cooked',
    imageAsset: '$_campfirePath/froglegs_cooked.png',
    displayName: '熟蛙腿',
  );
  static const garlicCooked = Ingredient(
    id: 'garlic_cooked',
    imageAsset: '$_campfirePath/garlic_cooked.png',
    displayName: '烤大蒜',
  );
  static const greenCapCooked = Ingredient(
    id: 'green_cap_cooked',
    imageAsset: '$_campfirePath/green_cap_cooked.png',
    displayName: '熟绿蘑菇',
  );
  static const kelpCooked = Ingredient(
    id: 'kelp_cooked',
    imageAsset: '$_campfirePath/kelp_cooked.png',
    displayName: '熟海带叶',
  );
  static const moonCapCooked = Ingredient(
    id: 'moon_cap_cooked',
    imageAsset: '$_campfirePath/moon_cap_cooked.png',
    displayName: '熟月亮蘑菇',
  );
  static const onionCooked = Ingredient(
    id: 'onion_cooked',
    imageAsset: '$_campfirePath/onion_cooked.png',
    displayName: '烤洋葱',
  );
  static const pepperCooked = Ingredient(
    id: 'pepper_cooked',
    imageAsset: '$_campfirePath/pepper_cooked.png',
    displayName: '烤辣椒',
  );
  static const pomegranateCooked = Ingredient(
    id: 'pomegranate_cooked',
    imageAsset: '$_campfirePath/pomegranate_cooked.png',
    displayName: '切片熟石榴',
  );
  static const potatoCooked = Ingredient(
    id: 'potato_cooked',
    imageAsset: '$_campfirePath/potato_cooked.png',
    displayName: '烤土豆',
  );
  static const pumpkinCooked = Ingredient(
    id: 'pumpkin_cooked',
    imageAsset: '$_campfirePath/pumpkin_cooked.png',
    displayName: '烤南瓜',
  );
  static const redCapCooked = Ingredient(
    id: 'red_cap_cooked',
    imageAsset: '$_campfirePath/red_cap_cooked.png',
    displayName: '熟红蘑菇',
  );
  static const rockAvocadoFruitRipeCooked = Ingredient(
    id: 'rock_avocado_fruit_ripe_cooked',
    imageAsset: '$_campfirePath/rock_avocado_fruit_ripe_cooked.png',
    displayName: '熟石果',
  );
  static const seedsCooked = Ingredient(
    id: 'seeds_cooked',
    imageAsset: '$_campfirePath/seeds_cooked.png',
    displayName: '烤种子',
  );
  static const tallbirdeggCooked = Ingredient(
    id: 'tallbirdegg_cooked',
    imageAsset: '$_campfirePath/tallbirdegg_cooked.png',
    displayName: '煎高脚鸟蛋',
  );
  static const tomatoCooked = Ingredient(
    id: 'tomato_cooked',
    imageAsset: '$_campfirePath/tomato_cooked.png',
    displayName: '烤番茄',
  );
  static const trunkCooked = Ingredient(
    id: 'trunk_cooked',
    imageAsset: '$_campfirePath/trunk_cooked.png',
    displayName: '象鼻排',
  );
  static const watermelonCooked = Ingredient(
    id: 'watermelon_cooked',
    imageAsset: '$_campfirePath/watermelon_cooked.png',
    displayName: '烤西瓜',
  );
  static const wobsterShellerDeadCooked = Ingredient(
    id: 'wobster_sheller_dead_cooked',
    imageAsset: '$_campfirePath/wobster_sheller_dead_cooked.png',
    displayName: '美味的龙虾',
  );

  /// 火源烹饪64分辨率
  static const acornCooked64 = Ingredient(
    id: 'acorn_cooked_64',
    imageAsset: '$_campfire64Path/acorn_cooked_64.png',
    displayName: '烤桦栗果',
  );
  static const ancientfruitNightvisionCooked64 = Ingredient(
    id: 'ancientfruit_nightvision_cooked_64',
    imageAsset: '$_campfire64Path/ancientfruit_nightvision_cooked_64.png',
    displayName: '熟夜莓',
  );
  static const asparagusCooked64 = Ingredient(
    id: 'asparagus_cooked_64',
    imageAsset: '$_campfire64Path/asparagus_cooked_64.png',
    displayName: '烤芦笋',
  );
  static const barnacleCooked64 = Ingredient(
    id: 'barnacle_cooked_64',
    imageAsset: '$_campfire64Path/barnacle_cooked_64.png',
    displayName: '熟藤壶',
  );
  static const batnoseCooked64 = Ingredient(
    id: 'batnose_cooked_64',
    imageAsset: '$_campfire64Path/batnose_cooked_64.png',
    displayName: '炭烤鼻孔',
  );
  static const batwingCooked64 = Ingredient(
    id: 'batwing_cooked_64',
    imageAsset: '$_campfire64Path/batwing_cooked_64.png',
    displayName: '熟蝙蝠翅膀',
  );
  static const berriesCooked64 = Ingredient(
    id: 'berries_cooked_64',
    imageAsset: '$_campfire64Path/berries_cooked_64.png',
    displayName: '烤浆果',
  );
  static const berriesJuicyCooked64 = Ingredient(
    id: 'berries_juicy_cooked_64',
    imageAsset: '$_campfire64Path/berries_juicy_cooked_64.png',
    displayName: '烤多汁浆果',
  );
  static const birdEggCooked64 = Ingredient(
    id: 'bird_egg_cooked_64',
    imageAsset: '$_campfire64Path/bird_egg_cooked_64.png',
    displayName: '熟鸟蛋',
  );
  static const blueCapCooked64 = Ingredient(
    id: 'blue_cap_cooked_64',
    imageAsset: '$_campfire64Path/blue_cap_cooked_64.png',
    displayName: '熟蓝蘑菇',
  );
  static const cactusMeatCooked64 = Ingredient(
    id: 'cactus_meat_cooked_64',
    imageAsset: '$_campfire64Path/cactus_meat_cooked_64.png',
    displayName: '熟仙人掌肉',
  );
  static const carrotCooked64 = Ingredient(
    id: 'carrot_cooked_64',
    imageAsset: '$_campfire64Path/carrot_cooked_64.png',
    displayName: '烤胡萝卜',
  );
  static const caveBananaCooked64 = Ingredient(
    id: 'cave_banana_cooked_64',
    imageAsset: '$_campfire64Path/cave_banana_cooked_64.png',
    displayName: '熟香蕉',
  );
  static const cookedmandrake64 = Ingredient(
    id: 'cookedmandrake_64',
    imageAsset: '$_campfire64Path/cookedmandrake_64.png',
    displayName: '熟曼德拉草',
  );
  static const cookedmeat64 = Ingredient(
    id: 'cookedmeat_64',
    imageAsset: '$_campfire64Path/cookedmeat_64.png',
    displayName: '熟肉',
  );
  static const cookedmonstermeat64 = Ingredient(
    id: 'cookedmonstermeat_64',
    imageAsset: '$_campfire64Path/cookedmonstermeat_64.png',
    displayName: '熟怪物肉',
  );
  static const cookedsmallmeat64 = Ingredient(
    id: 'cookedsmallmeat_64',
    imageAsset: '$_campfire64Path/cookedsmallmeat_64.png',
    displayName: '熟小肉',
  );
  static const cornCooked64 = Ingredient(
    id: 'corn_cooked_64',
    imageAsset: '$_campfire64Path/corn_cooked_64.png',
    displayName: '爆米花',
  );
  static const dragonfruitCooked64 = Ingredient(
    id: 'dragonfruit_cooked_64',
    imageAsset: '$_campfire64Path/dragonfruit_cooked_64.png',
    displayName: '熟火龙果',
  );
  static const drumstickCooked64 = Ingredient(
    id: 'drumstick_cooked_64',
    imageAsset: '$_campfire64Path/drumstick_cooked_64.png',
    displayName: '炸鸟腿',
  );
  static const durianCooked64 = Ingredient(
    id: 'durian_cooked_64',
    imageAsset: '$_campfire64Path/durian_cooked_64.png',
    displayName: '超臭榴莲',
  );
  static const eelCooked64 = Ingredient(
    id: 'eel_cooked_64',
    imageAsset: '$_campfire64Path/eel_cooked_64.png',
    displayName: '熟鳗鱼',
  );
  static const eggplantCooked64 = Ingredient(
    id: 'eggplant_cooked_64',
    imageAsset: '$_campfire64Path/eggplant_cooked_64.png',
    displayName: '烤茄子',
  );
  static const figCooked64 = Ingredient(
    id: 'fig_cooked_64',
    imageAsset: '$_campfire64Path/fig_cooked_64.png',
    displayName: '熟无花果',
  );
  static const fishMeatCooked64 = Ingredient(
    id: 'fishmeat_cooked_64',
    imageAsset: '$_campfire64Path/fishmeat_cooked_64.png',
    displayName: '鱼排',
  );
  static const fishMeatSmallCooked64 = Ingredient(
    id: 'fishmeat_small_cooked_64',
    imageAsset: '$_campfire64Path/fishmeat_small_cooked_64.png',
    displayName: '熟小鱼块',
  );
  static const froglegsCooked64 = Ingredient(
    id: 'froglegs_cooked_64',
    imageAsset: '$_campfire64Path/froglegs_cooked_64.png',
    displayName: '熟蛙腿',
  );
  static const garlicCooked64 = Ingredient(
    id: 'garlic_cooked_64',
    imageAsset: '$_campfire64Path/garlic_cooked_64.png',
    displayName: '烤大蒜',
  );
  static const greenCapCooked64 = Ingredient(
    id: 'green_cap_cooked_64',
    imageAsset: '$_campfire64Path/green_cap_cooked_64.png',
    displayName: '熟绿蘑菇',
  );
  static const kelpCooked64 = Ingredient(
    id: 'kelp_cooked_64',
    imageAsset: '$_campfire64Path/kelp_cooked_64.png',
    displayName: '熟海带叶',
  );
  static const kelpDried64 = Ingredient(
    id: 'kelp_dried_64',
    imageAsset: '$_campfire64Path/kelp_dried_64.png',
    displayName: '干海带叶',
  );
  static const meatDried64 = Ingredient(
    id: 'meat_dried_64',
    imageAsset: '$_campfire64Path/meat_dried_64.png',
    displayName: '肉干',
  );
  static const monstermeatDried64 = Ingredient(
    id: 'monstermeat_dried_64',
    imageAsset: '$_campfire64Path/monstermeat_dried_64.png',
    displayName: '怪物肉干',
  );
  static const moonCapCooked64 = Ingredient(
    id: 'moon_cap_cooked_64',
    imageAsset: '$_campfire64Path/moon_cap_cooked_64.png',
    displayName: '熟月亮蘑菇',
  );
  static const onionCooked64 = Ingredient(
    id: 'onion_cooked_64',
    imageAsset: '$_campfire64Path/onion_cooked_64.png',
    displayName: '烤洋葱',
  );
  static const pepperCooked64 = Ingredient(
    id: 'pepper_cooked_64',
    imageAsset: '$_campfire64Path/pepper_cooked_64.png',
    displayName: '烤辣椒',
  );
  static const plantmeatCooked64 = Ingredient(
    id: 'plantmeat_cooked_64',
    imageAsset: '$_campfire64Path/plantmeat_cooked_64.png',
    displayName: '熟叶肉',
  );
  static const pomegranateCooked64 = Ingredient(
    id: 'pomegranate_cooked_64',
    imageAsset: '$_campfire64Path/pomegranate_cooked_64.png',
    displayName: '切片熟石榴',
  );
  static const potatoCooked64 = Ingredient(
    id: 'potato_cooked_64',
    imageAsset: '$_campfire64Path/potato_cooked_64.png',
    displayName: '烤土豆',
  );
  static const pumpkinCooked64 = Ingredient(
    id: 'pumpkin_cooked_64',
    imageAsset: '$_campfire64Path/pumpkin_cooked_64.png',
    displayName: '烤南瓜',
  );
  static const redCapCooked64 = Ingredient(
    id: 'red_cap_cooked_64',
    imageAsset: '$_campfire64Path/red_cap_cooked_64.png',
    displayName: '熟红蘑菇',
  );
  static const rockAvocadoFruitRipeCooked64 = Ingredient(
    id: 'rock_avocado_fruit_ripe_cooked_64',
    imageAsset: '$_campfire64Path/rock_avocado_fruit_ripe_cooked_64.png',
    displayName: '熟石果',
  );
  static const seedsCooked64 = Ingredient(
    id: 'seeds_cooked_64',
    imageAsset: '$_campfire64Path/seeds_cooked_64.png',
    displayName: '烤种子',
  );
  static const smallmeat_dried64 = Ingredient(
    id: 'smallmeat_dried_64',
    imageAsset: '$_campfire64Path/smallmeat_dried_64.png',
    displayName: '小风干肉',
  );
  static const tallbirdeggCooked64 = Ingredient(
    id: 'tallbirdegg_cooked_64',
    imageAsset: '$_campfire64Path/tallbirdegg_cooked_64.png',
    displayName: '煎高脚鸟蛋',
  );
  static const tomatoCooked64 = Ingredient(
    id: 'tomato_cooked_64',
    imageAsset: '$_campfire64Path/tomato_cooked_64.png',
    displayName: '烤番茄',
  );
  static const trunkCooked64 = Ingredient(
    id: 'trunk_cooked_64',
    imageAsset: '$_campfire64Path/trunk_cooked_64.png',
    displayName: '象鼻排',
  );
  static const watermelonCooked64 = Ingredient(
    id: 'watermelon_cooked_64',
    imageAsset: '$_campfire64Path/watermelon_cooked_64.png',
    displayName: '烤西瓜',
  );
  static const wobsterShellerDeadCooked64 = Ingredient(
    id: 'wobster_sheller_dead_cooked_64',
    imageAsset: '$_campfire64Path/wobster_sheller_dead_cooked_64.png',
    displayName: '美味的龙虾',
  );

  ///烹饪锅烹饪
  static const asparagussoup = Ingredient(
    id: 'asparagussoup',
    imageAsset: '$_crockPotPath/asparagussoup.png',
    displayName: '芦笋汤',
  );
  static const baconeggs = Ingredient(
    id: 'baconeggs',
    imageAsset: '$_crockPotPath/baconeggs.png',
    displayName: '培根煎蛋',
  );
  static const bananajuice = Ingredient(
    id: 'bananajuice',
    imageAsset: '$_crockPotPath/bananajuice.png',
    displayName: '香蕉奶昔',
  );
  static const bananapop = Ingredient(
    id: 'bananapop',
    imageAsset: '$_crockPotPath/bananapop.png',
    displayName: '香蕉冻',
  );
  static const barnaclepita = Ingredient(
    id: 'barnaclepita',
    imageAsset: '$_crockPotPath/barnaclepita.png',
    displayName: '藤壶皮塔饼',
  );
  static const barnaclestuffedfishhead = Ingredient(
    id: 'barnaclestuffedfishhead',
    imageAsset: '$_crockPotPath/barnaclestuffedfishhead.png',
    displayName: '酿鱼头',
  );
  static const barnaclesushi = Ingredient(
    id: 'barnaclesushi',
    imageAsset: '$_crockPotPath/barnaclesushi.png',
    displayName: '藤壶握寿司',
  );
  static const barnaclinguine = Ingredient(
    id: 'barnaclinguine',
    imageAsset: '$_crockPotPath/barnaclinguine.png',
    displayName: '藤壶中细面',
  );
  static const batnosehat = Ingredient(
    id: 'batnosehat',
    imageAsset: '$_crockPotPath/batnosehat.png',
    displayName: '牛奶帽',
  );
  static const beefalofeed = Ingredient(
    id: 'beefalofeed',
    imageAsset: '$_crockPotPath/beefalofeed.png',
    displayName: '蒸树枝',
  );
  static const beefalotreat = Ingredient(
    id: 'beefalotreat',
    imageAsset: '$_crockPotPath/beefalotreat.png',
    displayName: '皮弗娄牛零食',
  );
  static const bonestew = Ingredient(
    id: 'bonestew',
    imageAsset: '$_crockPotPath/bonestew.png',
    displayName: '炖肉汤',
  );
  static const bunnystew = Ingredient(
    id: 'bunnystew',
    imageAsset: '$_crockPotPath/bunnystew.png',
    displayName: '炖兔子',
  );
  static const butterflymuffin = Ingredient(
    id: 'butterflymuffin',
    imageAsset: '$_crockPotPath/butterflymuffin.png',
    displayName: '蝴蝶松饼',
  );
  static const californiaroll = Ingredient(
    id: 'californiaroll',
    imageAsset: '$_crockPotPath/californiaroll.png',
    displayName: '加州卷',
  );
  static const ceviche = Ingredient(
    id: 'ceviche',
    imageAsset: '$_crockPotPath/ceviche.png',
    displayName: '酸橘汁腌鱼',
  );
  static const dragonpie = Ingredient(
    id: 'dragonpie',
    imageAsset: '$_crockPotPath/dragonpie.png',
    displayName: '火龙果派',
  );
  static const dustmeringue = Ingredient(
    id: 'dustmeringue',
    imageAsset: '$_crockPotPath/dustmeringue.png',
    displayName: '琥珀美食',
  );
  static const figatoni = Ingredient(
    id: 'figatoni',
    imageAsset: '$_crockPotPath/figatoni.png',
    displayName: '无花果意面',
  );
  static const figkabab = Ingredient(
    id: 'figkabab',
    imageAsset: '$_crockPotPath/figkabab.png',
    displayName: '无花果烤串',
  );
  static const fishsticks = Ingredient(
    id: 'fishsticks',
    imageAsset: '$_crockPotPath/fishsticks.png',
    displayName: '炸鱼排',
  );
  static const fishtacos = Ingredient(
    id: 'fishtacos',
    imageAsset: '$_crockPotPath/fishtacos.png',
    displayName: '鱼肉玉米卷',
  );
  static const flowersalad = Ingredient(
    id: 'flowersalad',
    imageAsset: '$_crockPotPath/flowersalad.png',
    displayName: '花沙拉',
  );
  static const frogglebunwich = Ingredient(
    id: 'frogglebunwich',
    imageAsset: '$_crockPotPath/frogglebunwich.png',
    displayName: '蛙腿三明治',
  );
  static const frognewton = Ingredient(
    id: 'frognewton',
    imageAsset: '$_crockPotPath/frognewton.png',
    displayName: '无花果蛙腿三明治',
  );
  static const frozenbananadaiquiri = Ingredient(
    id: 'frozenbananadaiquiri',
    imageAsset: '$_crockPotPath/frozenbananadaiquiri.png',
    displayName: '冰香蕉冻唇蜜',
  );
  static const fruitmedley = Ingredient(
    id: 'fruitmedley',
    imageAsset: '$_crockPotPath/fruitmedley.png',
    displayName: '水果圣代',
  );
  static const guacamole = Ingredient(
    id: 'guacamole',
    imageAsset: '$_crockPotPath/guacamole.png',
    displayName: '鳄梨酱',
  );
  static const honeyham = Ingredient(
    id: 'honeyham',
    imageAsset: '$_crockPotPath/honeyham.png',
    displayName: '蜜汁火腿',
  );
  static const honeynuggets = Ingredient(
    id: 'honeynuggets',
    imageAsset: '$_crockPotPath/honeynuggets.png',
    displayName: '蜜汁卤肉',
  );
  static const hotchili = Ingredient(
    id: 'hotchili',
    imageAsset: '$_crockPotPath/hotchili.png',
    displayName: '辣椒炖肉',
  );
  static const icecream = Ingredient(
    id: 'icecream',
    imageAsset: '$_crockPotPath/icecream.png',
    displayName: '冰淇淋',
  );
  static const jammypreserves = Ingredient(
    id: 'jammypreserves',
    imageAsset: '$_crockPotPath/jammypreserves.png',
    displayName: '果酱',
  );
  static const jellybean = Ingredient(
    id: 'jellybean',
    imageAsset: '$_crockPotPath/jellybean.png',
    displayName: '彩虹糖豆',
  );
  static const justeggs = Ingredient(
    id: 'justeggs',
    imageAsset: '$_crockPotPath/justeggs.png',
    displayName: '普通煎蛋',
  );
  static const kabobs = Ingredient(
    id: 'kabobs',
    imageAsset: '$_crockPotPath/kabobs.png',
    displayName: '肉串',
  );
  static const koalefigTrunk = Ingredient(
    id: 'koalefig_trunk',
    imageAsset: '$_crockPotPath/koalefig_trunk.png',
    displayName: '无花果酿象鼻',
  );
  static const leafloaf = Ingredient(
    id: 'leafloaf',
    imageAsset: '$_crockPotPath/leafloaf.png',
    displayName: '叶肉糕',
  );
  static const leafymeatburger = Ingredient(
    id: 'leafymeatburger',
    imageAsset: '$_crockPotPath/leafymeatburger.png',
    displayName: '素食堡',
  );
  static const leafymeatsouffle = Ingredient(
    id: 'leafymeatsouffle',
    imageAsset: '$_crockPotPath/leafymeatsouffle.png',
    displayName: '果冻沙拉',
  );
  static const lobsterbisque = Ingredient(
    id: 'lobsterbisque',
    imageAsset: '$_crockPotPath/lobsterbisque.png',
    displayName: '龙虾汤',
  );
  static const lobsterdinner = Ingredient(
    id: 'lobsterdinner',
    imageAsset: '$_crockPotPath/lobsterdinner.png',
    displayName: '龙虾正餐',
  );
  static const mandrakesoup = Ingredient(
    id: 'mandrakesoup',
    imageAsset: '$_crockPotPath/mandrakesoup.png',
    displayName: '曼德拉草汤',
  );
  static const mashedpotatoes = Ingredient(
    id: 'mashedpotatoes',
    imageAsset: '$_crockPotPath/mashedpotatoes.png',
    displayName: '奶油土豆泥',
  );
  static const meatballs = Ingredient(
    id: 'meatballs',
    imageAsset: '$_crockPotPath/meatballs.png',
    displayName: '肉丸',
  );
  static const meatysalad = Ingredient(
    id: 'meatysalad',
    imageAsset: '$_crockPotPath/meatysalad.png',
    displayName: '牛肉绿叶菜',
  );
  static const monsterlasagna = Ingredient(
    id: 'monsterlasagna',
    imageAsset: '$_crockPotPath/monsterlasagna.png',
    displayName: '怪物千层饼',
  );
  static const pepperpopper = Ingredient(
    id: 'pepperpopper',
    imageAsset: '$_crockPotPath/pepperpopper.png',
    displayName: '爆炒填馅辣椒',
  );
  static const perogies = Ingredient(
    id: 'perogies',
    imageAsset: '$_crockPotPath/perogies.png',
    displayName: '波兰水饺',
  );
  static const potatotornado = Ingredient(
    id: 'potatotornado',
    imageAsset: '$_crockPotPath/potatotornado.png',
    displayName: '花式回旋块茎',
  );
  static const powcake = Ingredient(
    id: 'powcake',
    imageAsset: '$_crockPotPath/powcake.png',
    displayName: '芝士蛋糕',
  );
  static const pumpkincookie = Ingredient(
    id: 'pumpkincookie',
    imageAsset: '$_crockPotPath/pumpkincookie.png',
    displayName: '南瓜饼干',
  );
  static const ratatouille = Ingredient(
    id: 'ratatouille',
    imageAsset: '$_crockPotPath/ratatouille.png',
    displayName: '蔬菜杂烩',
  );
  static const salsa = Ingredient(
    id: 'salsa',
    imageAsset: '$_crockPotPath/salsa.png',
    displayName: '生鲜萨尔萨酱',
  );
  static const seafoodgumbo = Ingredient(
    id: 'seafoodgumbo',
    imageAsset: '$_crockPotPath/seafoodgumbo.png',
    displayName: '海鲜浓汤',
  );
  static const shroombait = Ingredient(
    id: 'shroombait',
    imageAsset: '$_crockPotPath/shroombait.png',
    displayName: '酿夜帽',
  );
  static const shroomcake = Ingredient(
    id: 'shroomcake',
    imageAsset: '$_crockPotPath/shroomcake.png',
    displayName: '蘑菇蛋糕',
  );
  static const stuffedeggplant = Ingredient(
    id: 'stuffedeggplant',
    imageAsset: '$_crockPotPath/stuffedeggplant.png',
    displayName: '酿茄子',
  );
  static const surfnturf = Ingredient(
    id: 'surfnturf',
    imageAsset: '$_crockPotPath/surfnturf.png',
    displayName: '海鲜牛排',
  );
  static const sweettea = Ingredient(
    id: 'sweettea',
    imageAsset: '$_crockPotPath/sweettea.png',
    displayName: '舒缓茶',
  );
  static const taffy = Ingredient(
    id: 'taffy',
    imageAsset: '$_crockPotPath/taffy.png',
    displayName: '太妃糖',
  );
  static const talleggs = Ingredient(
    id: 'talleggs',
    imageAsset: '$_crockPotPath/talleggs.png',
    displayName: '苏格兰高鸟蛋',
  );
  static const trailmix = Ingredient(
    id: 'trailmix',
    imageAsset: '$_crockPotPath/trailmix.png',
    displayName: '什锦干果',
  );
  static const turkeydinner = Ingredient(
    id: 'turkeydinner',
    imageAsset: '$_crockPotPath/turkeydinner.png',
    displayName: '火鸡正餐',
  );
  static const unagi = Ingredient(
    id: 'unagi',
    imageAsset: '$_crockPotPath/unagi.png',
    displayName: '鳗鱼料理',
  );
  static const veggieomlet = Ingredient(
    id: 'veggieomlet',
    imageAsset: '$_crockPotPath/veggieomlet.png',
    displayName: '早餐锅',
  );
  static const vegstinger = Ingredient(
    id: 'vegstinger',
    imageAsset: '$_crockPotPath/vegstinger.png',
    displayName: '蔬菜鸡尾酒',
  );
  static const waffles = Ingredient(
    id: 'waffles',
    imageAsset: '$_crockPotPath/waffles.png',
    displayName: '华夫饼',
  );
  static const watermelonicle = Ingredient(
    id: 'watermelonicle',
    imageAsset: '$_crockPotPath/watermelonicle.png',
    displayName: '西瓜冰棍',
  );
  static const wetgoop = Ingredient(
    id: 'wetgoop',
    imageAsset: '$_crockPotPath/wetgoop.png',
    displayName: '潮湿黏糊',
  );

  ///烹饪锅烹饪64分辨率
  static const asparagussoup64 = Ingredient(
    id: 'asparagussoup_64',
    imageAsset: '$_crockPot64Path/asparagussoup_64.png',
    displayName: '芦笋汤',
  );
  static const baconeggs64 = Ingredient(
    id: 'baconeggs_64',
    imageAsset: '$_crockPot64Path/baconeggs_64.png',
    displayName: '培根煎蛋',
  );
  static const bananajuice64 = Ingredient(
    id: 'bananajuice_64',
    imageAsset: '$_crockPot64Path/bananajuice_64.png',
    displayName: '香蕉奶昔',
  );
  static const bananapop64 = Ingredient(
    id: 'bananapop_64',
    imageAsset: '$_crockPot64Path/bananapop_64.png',
    displayName: '香蕉冻',
  );
  static const barnaclepita64 = Ingredient(
    id: 'barnaclepita_64',
    imageAsset: '$_crockPot64Path/barnaclepita_64.png',
    displayName: '藤壶皮塔饼',
  );
  static const barnaclestuffedfishhead64 = Ingredient(
    id: 'barnaclestuffedfishhead_64',
    imageAsset: '$_crockPot64Path/barnaclestuffedfishhead_64.png',
    displayName: '酿鱼头',
  );
  static const barnaclesushi64 = Ingredient(
    id: 'barnaclesushi_64',
    imageAsset: '$_crockPot64Path/barnaclesushi_64.png',
    displayName: '藤壶握寿司',
  );
  static const barnaclinguine64 = Ingredient(
    id: 'barnaclinguine_64',
    imageAsset: '$_crockPot64Path/barnaclinguine_64.png',
    displayName: '藤壶中细面',
  );
  static const batnosehat64 = Ingredient(
    id: 'batnosehat_64',
    imageAsset: '$_crockPot64Path/batnosehat_64.png',
    displayName: '牛奶帽',
  );
  static const beefalotreat64 = Ingredient(
    id: 'beefalotreat_64',
    imageAsset: '$_crockPot64Path/beefalotreat_64.png',
    displayName: '皮弗娄牛零食',
  );
  static const bonesoup64 = Ingredient(
    id: 'bonesoup_64',
    imageAsset: '$_crockPot64Path/bonesoup_64.png',
    displayName: '骨头汤',
  );
  static const butterflymuffin64 = Ingredient(
    id: 'butterflymuffin_64',
    imageAsset: '$_crockPot64Path/butterflymuffin_64.png',
    displayName: '蝴蝶松饼',
  );
  static const californiaroll64 = Ingredient(
    id: 'californiaroll_64',
    imageAsset: '$_crockPot64Path/californiaroll_64.png',
    displayName: '加州卷',
  );
  static const dragonchilisalad64 = Ingredient(
    id: 'dragonchilisalad_64',
    imageAsset: '$_crockPot64Path/dragonchilisalad_64.png',
    displayName: '辣龙椒沙拉',
  );
  static const dragonpie64 = Ingredient(
    id: 'dragonpie_64',
    imageAsset: '$_crockPot64Path/dragonpie_64.png',
    displayName: '火龙果派',
  );
  static const figatoni64 = Ingredient(
    id: 'figatoni_64',
    imageAsset: '$_crockPot64Path/figatoni_64.png',
    displayName: '无花果意面',
  );
  static const figkabab64 = Ingredient(
    id: 'figkabab_64',
    imageAsset: '$_crockPot64Path/figkabab_64.png',
    displayName: '无花果烤串',
  );
  static const fishsticks64 = Ingredient(
    id: 'fishsticks_64',
    imageAsset: '$_crockPot64Path/fishsticks_64.png',
    displayName: '炸鱼排',
  );
  static const fishtacos64 = Ingredient(
    id: 'fishtacos_64',
    imageAsset: '$_crockPot64Path/fishtacos_64.png',
    displayName: '鱼肉玉米卷',
  );
  static const frogfishbowl64 = Ingredient(
    id: 'frogfishbowl_64',
    imageAsset: '$_crockPot64Path/frogfishbowl_64.png',
    displayName: '蓝带鱼排',
  );
  static const frogglebunwich64 = Ingredient(
    id: 'frogglebunwich_64',
    imageAsset: '$_crockPot64Path/frogglebunwich_64.png',
    displayName: '蛙腿三明治',
  );
  static const frognewton64 = Ingredient(
    id: 'frognewton_64',
    imageAsset: '$_crockPot64Path/frognewton_64.png',
    displayName: '无花果蛙腿三明治',
  );
  static const frozenbananadaiquiri64 = Ingredient(
    id: 'frozenbananadaiquiri_64',
    imageAsset: '$_crockPot64Path/frozenbananadaiquiri_64.png',
    displayName: '冰香蕉冻唇蜜',
  );
  static const fruitmedley64 = Ingredient(
    id: 'fruitmedley_64',
    imageAsset: '$_crockPot64Path/fruitmedley_64.png',
    displayName: '水果圣代',
  );
  static const gazpacho64 = Ingredient(
    id: 'gazpacho_64',
    imageAsset: '$_crockPot64Path/gazpacho_64.png',
    displayName: '芦笋冷汤',
  );
  static const guacamole64 = Ingredient(
    id: 'guacamole_64',
    imageAsset: '$_crockPot64Path/guacamole_64.png',
    displayName: '鳄梨酱',
  );
  static const honeyham64 = Ingredient(
    id: 'honeyham_64',
    imageAsset: '$_crockPot64Path/honeyham_64.png',
    displayName: '蜜汁火腿',
  );
  static const jammypreserves64 = Ingredient(
    id: 'jammypreserves_64',
    imageAsset: '$_crockPot64Path/jammypreserves_64.png',
    displayName: '果酱',
  );
  static const jellybean64 = Ingredient(
    id: 'jellybean_64',
    imageAsset: '$_crockPot64Path/jellybean_64.png',
    displayName: '彩虹糖豆',
  );
  static const kabobs64 = Ingredient(
    id: 'kabobs_64',
    imageAsset: '$_crockPot64Path/kabobs_64.png',
    displayName: '肉串',
  );
  static const koalefig_trunk64 = Ingredient(
    id: 'koalefig_trunk_64',
    imageAsset: '$_crockPot64Path/koalefig_trunk_64.png',
    displayName: '无花果酿象鼻',
  );
  static const leafloaf64 = Ingredient(
    id: 'leafloaf_64',
    imageAsset: '$_crockPot64Path/leafloaf_64.png',
    displayName: '叶肉糕',
  );
  static const leafymeatburger64 = Ingredient(
    id: 'leafymeatburger_64',
    imageAsset: '$_crockPot64Path/leafymeatburger_64.png',
    displayName: '素食堡',
  );
  static const leafymeatsouffle64 = Ingredient(
    id: 'leafymeatsouffle_64',
    imageAsset: '$_crockPot64Path/leafymeatsouffle_64.png',
    displayName: '果冻沙拉',
  );
  static const mandrakesoup64 = Ingredient(
    id: 'mandrakesoup_64',
    imageAsset: '$_crockPot64Path/mandrakesoup_64.png',
    displayName: '曼德拉草汤',
  );
  static const mashedpotatoes64 = Ingredient(
    id: 'mashedpotatoes_64',
    imageAsset: '$_crockPot64Path/mashedpotatoes_64.png',
    displayName: '奶油土豆泥',
  );
  static const meatysalad64 = Ingredient(
    id: 'meatysalad_64',
    imageAsset: '$_crockPot64Path/meatysalad_64.png',
    displayName: '牛肉绿叶菜',
  );
  static const moqueca64 = Ingredient(
    id: 'moqueca_64',
    imageAsset: '$_crockPot64Path/moqueca_64.png',
    displayName: '海鲜杂烩',
  );
  static const monsterlasagna64 = Ingredient(
    id: 'monsterlasagna_64',
    imageAsset: '$_crockPot64Path/monsterlasagna_64.png',
    displayName: '怪物千层饼',
  );
  static const nightmarepie64 = Ingredient(
    id: 'nightmarepie_64',
    imageAsset: '$_crockPot64Path/nightmarepie_64.png',
    displayName: '恐怖国王饼',
  );
  static const pepperpopper64 = Ingredient(
    id: 'pepperpopper_64',
    imageAsset: '$_crockPot64Path/pepperpopper_64.png',
    displayName: '恐怖国王饼',
  );
  static const potatosouffle64 = Ingredient(
    id: 'potatosouffle_64',
    imageAsset: '$_crockPot64Path/potatosouffle_64.png',
    displayName: '蓬松土豆蛋奶酥',
  );
  static const potatotornado64 = Ingredient(
    id: 'potatotornado_64',
    imageAsset: '$_crockPot64Path/potatotornado_64.png',
    displayName: '花式回旋块茎',
  );
  static const powcake64 = Ingredient(
    id: 'powcake_64',
    imageAsset: '$_crockPot64Path/powcake_64.png',
    displayName: '芝士蛋糕',
  );
  static const pumpkincookie64 = Ingredient(
    id: 'pumpkincookie_64',
    imageAsset: '$_crockPot64Path/pumpkincookie_64.png',
    displayName: '南瓜饼干',
  );
  static const salsa64 = Ingredient(
    id: 'salsa_64',
    imageAsset: '$_crockPot64Path/salsa_64.png',
    displayName: '生鲜萨尔萨酱',
  );
  static const seafoodgumbo64 = Ingredient(
    id: 'seafoodgumbo_64',
    imageAsset: '$_crockPot64Path/seafoodgumbo_64.png',
    displayName: '海鲜浓汤',
  );
  static const stuffedeggplant64 = Ingredient(
    id: 'stuffedeggplant_64',
    imageAsset: '$_crockPot64Path/stuffedeggplant_64.png',
    displayName: '酿茄子',
  );
  static const talleggs64 = Ingredient(
    id: 'talleggs_64',
    imageAsset: '$_crockPot64Path/talleggs_64.png',
    displayName: '苏格兰高鸟蛋',
  );
  static const trailmix64 = Ingredient(
    id: 'trailmix_64',
    imageAsset: '$_crockPot64Path/trailmix_64.png',
    displayName: '什锦干果',
  );
  static const turkeydinner64 = Ingredient(
    id: 'turkeydinner_64',
    imageAsset: '$_crockPot64Path/turkeydinner_64.png',
    displayName: '火鸡正餐',
  );
  static const unagi64 = Ingredient(
    id: 'unagi_64',
    imageAsset: '$_crockPot64Path/unagi_64.png',
    displayName: '鳗鱼料理',
  );
  static const veggieomlet64 = Ingredient(
    id: 'veggieomlet_64',
    imageAsset: '$_crockPot64Path/veggieomlet_64.png',
    displayName: '早餐锅',
  );
  static const vegstinger64 = Ingredient(
    id: 'vegstinger_64',
    imageAsset: '$_crockPot64Path/vegstinger_64.png',
    displayName: '蔬菜鸡尾酒',
  );
  static const waffles64 = Ingredient(
    id: 'waffles_64',
    imageAsset: '$_crockPot64Path/waffles_64.png',
    displayName: '华夫饼',
  );
  static const watermelonicle64 = Ingredient(
    id: 'watermelonicle_64',
    imageAsset: '$_crockPot64Path/watermelonicle_64.png',
    displayName: '西瓜冰棍',
  );

  ///原始食材素材
  static const acorn = Ingredient(
    id: 'acorn',
    imageAsset: '$_ingredientsPath/acorn.png',
    displayName: '桦栗果',
  );
  static const ancientfruitNightvision = Ingredient(
    id: 'ancientfruit_nightvision',
    imageAsset: '$_ingredientsPath/ancientfruit_nightvision.png',
    displayName: '夜莓',
  );
  static const asparagus = Ingredient(
    id: 'asparagus',
    imageAsset: '$_ingredientsPath/asparagus.png',
    displayName: '芦笋',
  );
  static const bandage = Ingredient(
    id: 'bandage',
    imageAsset: '$_ingredientsPath/bandage.png',
    displayName: '蜂蜜药膏',
  );
  static const barnacle = Ingredient(
    id: 'barnacle',
    imageAsset: '$_ingredientsPath/barnacle.png',
    displayName: '藤壶',
  );
  static const batnose = Ingredient(
    id: 'batnose',
    imageAsset: '$_ingredientsPath/batnose.png',
    displayName: '裸露鼻孔',
  );
  static const batwing = Ingredient(
    id: 'batwing',
    imageAsset: '$_ingredientsPath/batwing.png',
    displayName: '洞穴蝙蝠翅膀',
  );
  static const berries = Ingredient(
    id: 'berries',
    imageAsset: '$_ingredientsPath/berries.png',
    displayName: '浆果',
  );
  static const berriesJuicy = Ingredient(
    id: 'berries_juicy',
    imageAsset: '$_ingredientsPath/berries_juicy.png',
    displayName: '多汁浆果',
  );
  static const birdEgg = Ingredient(
    id: 'bird_egg',
    imageAsset: '$_ingredientsPath/bird_egg.png',
    displayName: '鸟蛋',
  );
  static const blueCap = Ingredient(
    id: 'blue_cap',
    imageAsset: '$_ingredientsPath/blue_cap.png',
    displayName: '采摘的蓝蘑菇',
  );
  static const boneshard = Ingredient(
    id: 'boneshard',
    imageAsset: '$_ingredientsPath/boneshard.png',
    displayName: '骨头碎片',
  );
  static const bullkelpRoot = Ingredient(
    id: 'bullkelp_root',
    imageAsset: '$_ingredientsPath/bullkelp_root.png',
    displayName: '公牛海带茎',
  );
  static const butter = Ingredient(
    id: 'butter',
    imageAsset: '$_ingredientsPath/butter.png',
    displayName: '黄油',
  );
  static const butterflywings = Ingredient(
    id: 'butterflywings',
    imageAsset: '$_ingredientsPath/butterflywings.png',
    displayName: '蝴蝶翅膀',
  );
  static const cactusFlower = Ingredient(
    id: 'cactus_flower',
    imageAsset: '$_ingredientsPath/cactus_flower.png',
    displayName: '仙人掌花',
  );
  static const cactusMeat = Ingredient(
    id: 'cactus_meat',
    imageAsset: '$_ingredientsPath/cactus_meat.png',
    displayName: '仙人掌肉',
  );
  static const carnivalGametoken = Ingredient(
    id: 'carnival_gametoken',
    imageAsset: '$_ingredientsPath/carnival_gametoken.png',
    displayName: '鸦年华代币',
  );
  static const carnivalPrizeticket = Ingredient(
    id: 'carnival_prizeticket',
    imageAsset: '$_ingredientsPath/carnival_prizeticket.png',
    displayName: '奖票',
  );
  static const carrot = Ingredient(
    id: 'carrot',
    imageAsset: '$_ingredientsPath/carrot.png',
    displayName: '胡萝卜',
  );
  static const caveBanana = Ingredient(
    id: 'cave_banana',
    imageAsset: '$_ingredientsPath/cave_banana.png',
    displayName: '香蕉',
  );
  static const corn = Ingredient(
    id: 'corn',
    imageAsset: '$_ingredientsPath/corn.png',
    displayName: '玉米',
  );
  static const cutlichen = Ingredient(
    id: 'cutlichen',
    imageAsset: '$_ingredientsPath/cutlichen.png',
    displayName: '苔藓',
  );
  static const dragonfruit = Ingredient(
    id: 'dragonfruit',
    imageAsset: '$_ingredientsPath/dragonfruit.png',
    displayName: '火龙果',
  );
  static const drumstick = Ingredient(
    id: 'drumstick',
    imageAsset: '$_ingredientsPath/drumstick.png',
    displayName: '鸟腿',
  );
  static const durian = Ingredient(
    id: 'durian',
    imageAsset: '$_ingredientsPath/durian.png',
    displayName: '榴莲',
  );
  static const eel = Ingredient(
    id: 'eel',
    imageAsset: '$_ingredientsPath/eel.png',
    displayName: '鳗鱼',
  );
  static const eggplant = Ingredient(
    id: 'eggplant',
    imageAsset: '$_ingredientsPath/eggplant.png',
    displayName: '茄子',
  );
  static const fig = Ingredient(
    id: 'fig',
    imageAsset: '$_ingredientsPath/fig.png',
    displayName: '无花果',
  );
  static const fish = Ingredient(
    id: 'fish',
    imageAsset: '$_ingredientsPath/fish.png',
    displayName: '鱼',
  );
  static const fishmeat = Ingredient(
    id: 'fishmeat',
    imageAsset: '$_ingredientsPath/fishmeat.png',
    displayName: '生鱼肉',
  );
  static const fishmeatSmall = Ingredient(
    id: 'fishmeat_small',
    imageAsset: '$_ingredientsPath/fishmeat_small.png',
    displayName: '小鱼块',
  );
  static const forgetmelots = Ingredient(
    id: 'forgetmelots',
    imageAsset: '$_ingredientsPath/forgetmelots.png',
    displayName: '必忘我',
  );
  static const froglegs = Ingredient(
    id: 'froglegs',
    imageAsset: '$_ingredientsPath/froglegs.png',
    displayName: '蛙腿',
  );
  static const garlic = Ingredient(
    id: 'garlic',
    imageAsset: '$_ingredientsPath/garlic.png',
    displayName: '大蒜',
  );
  static const goatmilk = Ingredient(
    id: 'goatmilk',
    imageAsset: '$_ingredientsPath/goatmilk.png',
    displayName: '带电的羊奶',
  );
  static const greenCap = Ingredient(
    id: 'green_cap',
    imageAsset: '$_ingredientsPath/green_cap.png',
    displayName: '采摘的绿蘑菇',
  );
  static const halloweencandy = Ingredient(
    id: 'halloweencandy',
    imageAsset: '$_ingredientsPath/halloweencandy.png',
    displayName: '熔岩椒',
  );
  static const honey = Ingredient(
    id: 'honey',
    imageAsset: '$_ingredientsPath/honey.png',
    displayName: '蜂蜜',
  );
  static const honeycomb = Ingredient(
    id: 'honeycomb',
    imageAsset: '$_ingredientsPath/honeycomb.png',
    displayName: '蜜脾',
  );
  static const humanmeat = Ingredient(
    id: 'humanmeat',
    imageAsset: '$_ingredientsPath/humanmeat.png',
    displayName: '长猪',
  );
  static const ice = Ingredient(
    id: 'ice',
    imageAsset: '$_ingredientsPath/ice.png',
    displayName: '冰',
  );
  static const kelp = Ingredient(
    id: 'kelp',
    imageAsset: '$_ingredientsPath/kelp.png',
    displayName: '海带叶',
  );
  static const lightbulb = Ingredient(
    id: 'lightbulb',
    imageAsset: '$_ingredientsPath/lightbulb.png',
    displayName: '荧光果',
  );
  static const lightninggoathorn = Ingredient(
    id: 'lightninggoathorn',
    imageAsset: '$_ingredientsPath/lightninggoathorn.png',
    displayName: '伏特羊角',
  );
  static const lureplantbulb = Ingredient(
    id: 'lureplantbulb',
    imageAsset: '$_ingredientsPath/lureplantbulb.png',
    displayName: '食人花种子',
  );
  static const mandrake = Ingredient(
    id: 'mandrake',
    imageAsset: '$_ingredientsPath/mandrake.png',
    displayName: '曼德拉草',
  );
  static const meat = Ingredient(
    id: 'meat',
    imageAsset: '$_ingredientsPath/meat.png',
    displayName: '肉',
  );
  static const milkywhites = Ingredient(
    id: 'milkywhites',
    imageAsset: '$_ingredientsPath/milkywhites.png',
    displayName: '乳白物',
  );
  static const monstermeat = Ingredient(
    id: 'monstermeat',
    imageAsset: '$_ingredientsPath/monstermeat.png',
    displayName: '怪物肉',
  );
  static const moonCap = Ingredient(
    id: 'moon_cap',
    imageAsset: '$_ingredientsPath/moon_cap.png',
    displayName: '月亮蘑菇',
  );
  static const moonbutterflywings = Ingredient(
    id: 'moonbutterflywings',
    imageAsset: '$_ingredientsPath/moonbutterflywings.png',
    displayName: '月蛾翅膀',
  );
  static const nightmarefuel = Ingredient(
    id: 'nightmarefuel',
    imageAsset: '$_ingredientsPath/nightmarefuel.png',
    displayName: '噩梦燃料',
  );
  static const oceanfishMedium5Inv = Ingredient(
    id: 'oceanfish_medium_5_inv',
    imageAsset: '$_ingredientsPath/oceanfish_medium_5_inv.png',
    displayName: '玉米鳕鱼',
  );
  static const oceanfishMedium8Inv = Ingredient(
    id: 'oceanfish_medium_8_inv',
    imageAsset: '$_ingredientsPath/oceanfish_medium_8_inv.png',
    displayName: '冰鲷鱼',
  );
  static const oceanfishSmall5Inv = Ingredient(
    id: 'oceanfish_small_5_inv',
    imageAsset: '$_ingredientsPath/oceanfish_small_5_inv.png',
    displayName: '爆米花鱼',
  );
  static const onion = Ingredient(
    id: 'onion',
    imageAsset: '$_ingredientsPath/onion.png',
    displayName: '洋葱',
  );
  static const pepper = Ingredient(
    id: 'pepper',
    imageAsset: '$_ingredientsPath/pepper.png',
    displayName: '辣椒',
  );
  static const perdlingCrow = Ingredient(
    id: 'perdling_crow',
    imageAsset: '$_ingredientsPath/perdling_crow.png',
    displayName: '小乌鸦',
  );
  static const phlegm = Ingredient(
    id: 'phlegm',
    imageAsset: '$_ingredientsPath/phlegm.png',
    displayName: '脓鼻涕',
  );
  static const pinecone = Ingredient(
    id: 'pinecone',
    imageAsset: '$_ingredientsPath/pinecone.png',
    displayName: '松果',
  );
  static const plantmeat = Ingredient(
    id: 'plantmeat',
    imageAsset: '$_ingredientsPath/plantmeat.png',
    displayName: '叶肉',
  );
  static const pomegranate = Ingredient(
    id: 'pomegranate',
    imageAsset: '$_ingredientsPath/pomegranate.png',
    displayName: '石榴',
  );
  static const pondeel = Ingredient(
    id: 'pondeel',
    imageAsset: '$_ingredientsPath/pondeel.png',
    displayName: '活鳗鱼',
  );
  static const pondfish = Ingredient(
    id: 'pondfish',
    imageAsset: '$_ingredientsPath/pondfish.png',
    displayName: '淡水鱼',
  );
  static const potato = Ingredient(
    id: 'potato',
    imageAsset: '$_ingredientsPath/potato.png',
    displayName: '土豆',
  );
  static const pumpkin = Ingredient(
    id: 'pumpkin',
    imageAsset: '$_ingredientsPath/pumpkin.png',
    displayName: '南瓜',
  );
  static const redCap = Ingredient(
    id: 'red_cap',
    imageAsset: '$_ingredientsPath/red_cap.png',
    displayName: '采摘的红蘑菇',
  );
  static const refinedDust = Ingredient(
    id: 'refined_dust',
    imageAsset: '$_ingredientsPath/refined_dust.png',
    displayName: '尘土块',
  );
  static const rockAvocadoFruitRipe = Ingredient(
    id: 'rock_avocado_fruit_ripe',
    imageAsset: '$_ingredientsPath/rock_avocado_fruit_ripe.png',
    displayName: '成熟石果',
  );
  static const royalJelly = Ingredient(
    id: 'royal_jelly',
    imageAsset: '$_ingredientsPath/royal_jelly.png',
    displayName: '蜂王浆',
  );
  static const salmon = Ingredient(
    id: 'salmon',
    imageAsset: '$_ingredientsPath/salmon.png',
    displayName: '三文鱼',
  );
  static const saltrock = Ingredient(
    id: 'saltrock',
    imageAsset: '$_ingredientsPath/saltrock.png',
    displayName: '盐晶',
  );
  static const seeds = Ingredient(
    id: 'seeds',
    imageAsset: '$_ingredientsPath/seeds.png',
    displayName: '种子',
  );
  static const smallmeat = Ingredient(
    id: 'smallmeat',
    imageAsset: '$_ingredientsPath/smallmeat.png',
    displayName: '小肉',
  );
  static const spoiledFish = Ingredient(
    id: 'spoiled_fish',
    imageAsset: '$_ingredientsPath/spoiled_fish.png',
    displayName: '变质的鱼',
  );
  static const spoiledFishSmall = Ingredient(
    id: 'spoiled_fish_small',
    imageAsset: '$_ingredientsPath/spoiled_fish_small.png',
    displayName: '变质的小鱼块',
  );
  static const tallbirdegg = Ingredient(
    id: 'tallbirdegg',
    imageAsset: '$_ingredientsPath/tallbirdegg.png',
    displayName: '高脚鸟蛋',
  );
  static const tomato = Ingredient(
    id: 'tomato',
    imageAsset: '$_ingredientsPath/tomato.png',
    displayName: '番茄',
  );
  static const trunkSummer = Ingredient(
    id: 'trunk_summer',
    imageAsset: '$_ingredientsPath/trunk_summer.png',
    displayName: '象鼻',
  );
  static const trunkWinter = Ingredient(
    id: 'trunk_winter',
    imageAsset: '$_ingredientsPath/trunk_winter.png',
    displayName: '冬象鼻',
  );
  static const twigs = Ingredient(
    id: 'twigs',
    imageAsset: '$_ingredientsPath/twigs.png',
    displayName: '树枝',
  );
  static const watermelon = Ingredient(
    id: 'watermelon',
    imageAsset: '$_ingredientsPath/watermelon.png',
    displayName: '西瓜',
  );
  static const wobsterShellerDead = Ingredient(
    id: 'wobster_sheller_dead',
    imageAsset: '$_ingredientsPath/wobster_sheller_dead.png',
    displayName: '死龙虾',
  );
  static const wobsterShellerLand = Ingredient(
    id: 'wobster_sheller_land',
    imageAsset: '$_ingredientsPath/wobster_sheller_land.png',
    displayName: '龙虾',
  );
  static const wormlight = Ingredient(
    id: 'wormlight',
    imageAsset: '$_ingredientsPath/wormlight.png',
    displayName: '发光浆果',
  );
  static const wormlightLesser = Ingredient(
    id: 'wormlight_lesser',
    imageAsset: '$_ingredientsPath/wormlight_lesser.png',
    displayName: '小发光浆果',
  );

  ///便携锅烹饪
  static const bonesoup = Ingredient(
    id: 'bonesoup',
    imageAsset: '$_portableCookerPath/bonesoup.png',
    displayName: '骨头汤',
  );
  static const dragonchilisalad = Ingredient(
    id: 'dragonchilisalad',
    imageAsset: '$_portableCookerPath/dragonchilisalad.png',
    displayName: '辣龙椒沙拉',
  );
  static const freshfruitcrepes = Ingredient(
    id: 'freshfruitcrepes',
    imageAsset: '$_portableCookerPath/freshfruitcrepes.png',
    displayName: '鲜果可丽饼',
  );
  static const frogfishbowl = Ingredient(
    id: 'frogfishbowl',
    imageAsset: '$_portableCookerPath/frogfishbowl.png',
    displayName: '蓝带鱼排',
  );
  static const gazpacho = Ingredient(
    id: 'gazpacho',
    imageAsset: '$_portableCookerPath/gazpacho.png',
    displayName: '芦笋冷汤',
  );
  static const glowberrymousse = Ingredient(
    id: 'glowberrymousse',
    imageAsset: '$_portableCookerPath/glowberrymousse.png',
    displayName: '发光浆果慕斯',
  );
  static const monstertartare = Ingredient(
    id: 'monstertartare',
    imageAsset: '$_portableCookerPath/monstertartare.png',
    displayName: '怪物鞑靼',
  );
  static const moqueca = Ingredient(
    id: 'moqueca',
    imageAsset: '$_portableCookerPath/moqueca.png',
    displayName: '海鲜杂烩',
  );
  static const nightmarepie = Ingredient(
    id: 'nightmarepie',
    imageAsset: '$_portableCookerPath/nightmarepie.png',
    displayName: '恐怖国王饼',
  );
  static const potatosouffle = Ingredient(
    id: 'potatosouffle',
    imageAsset: '$_portableCookerPath/potatosouffle.png',
    displayName: '蓬松土豆蛋奶酥',
  );
  static const voltgoatjelly = Ingredient(
    id: 'voltgoatjelly',
    imageAsset: '$_portableCookerPath/voltgoatjelly.png',
    displayName: '伏特羊肉冻',
  );

  /// 便携锅烹饪64
  static const monstertartare64 = Ingredient(
    id: 'monstertartare_64',
    imageAsset: '$_portableCooker64Path/monstertartare_64.png',
    displayName: '怪物鞑靼',
  );

  ///其他
  static const mole = Ingredient(
      id: 'mole',
      imageAsset: '$_otherPath/mole.png',
      displayName: '鼹鼠',
  );
  static const dustmoth = Ingredient(
      id: 'dustmoth',
      imageAsset: '$_otherPath/dustmoth.png',
      displayName: '尘蛾',
  );
  static const primeMate = Ingredient(
      id: 'prime_mate',
      imageAsset: '$_otherPath/prime_mate.png',
      displayName: '大副',
  );
  static const beefalo = Ingredient(
      id: 'beefalo',
      imageAsset: '$_otherPath/beefalo.png',
      displayName: '皮弗娄牛',
  );
  static const cookiecutter = Ingredient(
      id: 'cookiecutter',
      imageAsset: '$_otherPath/cookiecutter.png',
      displayName: '饼干切割机',
  );

  //========== 分块数据整合 ==========//

  /// 火源烹饪食材分块
  static const List<Ingredient> campfireIngredients = [
    acornCooked,
    ancientfruitNightvisionCooked,
    ancientfruitNightvisionCooked64,
    asparagusCooked,
    barnacleCooked,
    batnoseCooked,
    batwingCooked,
    berriesCooked,
    berriesJuicyCooked,
    birdEggCooked,
    blueCapCooked,
    cactusMeatCooked,
    carrotCooked,
    caveBananaCooked,
    cookedmandrake,
    cookedmeat,
    cookedmonstermeat,
    cookedsmallmeat,
    cornCooked,
    dragonfruitCooked,
    drumstickCooked,
    durianCooked,
    eelCooked,
    eggplantCooked,
    figCooked,
    fishMeatCooked,
    fishMeatSmallCooked,
    froglegsCooked,
    garlicCooked,
    greenCapCooked,
    kelpCooked,
    moonCapCooked,
    onionCooked,
    pepperCooked,
    pomegranateCooked,
    potatoCooked,
    pumpkinCooked,
    redCapCooked,
    rockAvocadoFruitRipeCooked,
    seedsCooked,
    tallbirdeggCooked,
    tomatoCooked,
    trunkCooked,
    watermelonCooked,
    wobsterShellerDeadCooked,
  ];

  /// 火源烹饪64食材分块
  static const List<Ingredient> campfire64Ingredients = [
    acornCooked64,
    asparagusCooked64,
    barnacleCooked64,
    batnoseCooked64,
    batwingCooked64,
    berriesCooked64,
    berriesJuicyCooked64,
    birdEggCooked64,
    blueCapCooked64,
    cactusMeatCooked64,
    carrotCooked64,
    caveBananaCooked64,
    cookedmandrake64,
    cookedmeat64,
    cookedmonstermeat64,
    cookedsmallmeat64,
    cornCooked64,
    dragonfruitCooked64,
    drumstickCooked64,
    durianCooked64,
    eelCooked64,
    eggplantCooked64,
    figCooked64,
    fishMeatCooked64,
    fishMeatSmallCooked64,
    froglegsCooked64,
    garlicCooked64,
    greenCapCooked64,
    kelpCooked64,
    kelpDried64,
    meatDried64,
    monstermeatDried64,
    moonCapCooked64,
    onionCooked64,
    pepperCooked64,
    plantmeatCooked64,
    pomegranateCooked64,
    potatoCooked64,
    pumpkinCooked64,
    redCapCooked64,
    rockAvocadoFruitRipeCooked64,
    seedsCooked64,
    smallmeat_dried64,
    tallbirdeggCooked64,
    tomatoCooked64,
    trunkCooked64,
    watermelonCooked64,
    wobsterShellerDeadCooked64,
  ];

  /// 烹饪锅食材分块
  static const List<Ingredient> crockPotIngredients = [
    asparagussoup,
    baconeggs,
    bananajuice,
    bananapop,
    barnaclepita,
    barnaclestuffedfishhead,
    barnaclesushi,
    barnaclinguine,
    batnosehat,
    beefalofeed,
    beefalotreat,
    bonestew,
    bunnystew,
    butterflymuffin,
    californiaroll,
    ceviche,
    dragonpie,
    dustmeringue,
    figatoni,
    figkabab,
    fishsticks,
    fishtacos,
    flowersalad,
    frogglebunwich,
    frognewton,
    frozenbananadaiquiri,
    fruitmedley,
    guacamole,
    honeyham,
    honeynuggets,
    hotchili,
    icecream,
    jammypreserves,
    jellybean,
    justeggs,
    kabobs,
    koalefigTrunk,
    leafloaf,
    leafymeatburger,
    leafymeatsouffle,
    lobsterbisque,
    lobsterdinner,
    mandrakesoup,
    mashedpotatoes,
    meatballs,
    meatysalad,
    monsterlasagna,
    pepperpopper,
    perogies,
    potatotornado,
    powcake,
    pumpkincookie,
    ratatouille,
    salsa,
    seafoodgumbo,
    shroombait,
    shroomcake,
    stuffedeggplant,
    surfnturf,
    sweettea,
    taffy,
    talleggs,
    trailmix,
    turkeydinner,
    unagi,
    veggieomlet,
    vegstinger,
    waffles,
    watermelonicle,
    wetgoop,
  ];

  /// 烹饪锅64食材分块
  static const List<Ingredient> crockPot64Ingredients = [
    asparagussoup64,
    baconeggs64,
    bananajuice64,
    bananapop64,
    barnaclepita64,
    barnaclestuffedfishhead64,
    barnaclesushi64,
    barnaclinguine64,
    batnosehat64,
    beefalotreat64,
    bonesoup64,
    butterflymuffin64,
    californiaroll64,
    dragonchilisalad64,
    dragonpie64,
    figatoni64,
    figkabab64,
    fishsticks64,
    fishtacos64,
    frogfishbowl64,
    frogglebunwich64,
    frognewton64,
    frozenbananadaiquiri64,
    fruitmedley64,
    gazpacho64,
    guacamole64,
    honeyham64,
    jammypreserves64,
    jellybean64,
    kabobs64,
    koalefig_trunk64,
    leafloaf64,
    leafymeatburger64,
    leafymeatsouffle64,
    mandrakesoup64,
    mashedpotatoes64,
    meatysalad64,
    monsterlasagna64,
    moqueca64,
    nightmarepie64,
    pepperpopper64,
    potatosouffle64,
    potatotornado64,
    powcake64,
    pumpkincookie64,
    salsa64,
    seafoodgumbo64,
    stuffedeggplant64,
    talleggs64,
    trailmix64,
    turkeydinner64,
    unagi64,
    veggieomlet64,
    vegstinger64,
    waffles64,
    watermelonicle64,
  ];

  /// 便携锅食材分块
  static const List<Ingredient> portableCookerIngredients = [
    bonesoup,
    dragonchilisalad,
    freshfruitcrepes,
    frogfishbowl,
    gazpacho,
    glowberrymousse,
    monstertartare,
    moqueca,
    nightmarepie,
    potatosouffle,
    voltgoatjelly,
  ];

  /// 便携锅64食材分块
  static const List<Ingredient> portableCooker64Ingredients = [
    monstertartare64
  ];

  /// 原始食材分块
  static const List<Ingredient> defaultIngredients = [
    acorn,
    ancientfruitNightvision,
    asparagus,
    bandage,
    barnacle,
    batnose,
    batwing,
    berries,
    berriesJuicy,
    birdEgg,
    blueCap,
    boneshard,
    bullkelpRoot,
    butter,
    butterflywings,
    cactusFlower,
    cactusMeat,
    carnivalGametoken,
    carnivalPrizeticket,
    carrot,
    caveBanana,
    corn,
    cutlichen,
    dragonfruit,
    drumstick,
    durian,
    eel,
    eggplant,
    fig,
    fish,
    fishmeat,
    fishmeatSmall,
    forgetmelots,
    froglegs,
    garlic,
    goatmilk,
    greenCap,
    halloweencandy,
    honey,
    honeycomb,
    humanmeat,
    ice,
    kelp,
    lightbulb,
    lightninggoathorn,
    lureplantbulb,
    mandrake,
    meat,
    milkywhites,
    monstermeat,
    moonCap,
    moonbutterflywings,
    nightmarefuel,
    oceanfishMedium5Inv,
    oceanfishMedium8Inv,
    oceanfishSmall5Inv,
    onion,
    pepper,
    perdlingCrow,
    phlegm,
    pinecone,
    plantmeat,
    pomegranate,
    pondeel,
    pondfish,
    potato,
    pumpkin,
    redCap,
    refinedDust,
    rockAvocadoFruitRipe,
    royalJelly,
    salmon,
    saltrock,
    seeds,
    smallmeat,
    spoiledFish,
    spoiledFishSmall,
    tallbirdegg,
    tomato,
    trunkSummer,
    trunkWinter,
    twigs,
    watermelon,
    wobsterShellerDead,
    wobsterShellerLand,
    wormlight,
    wormlightLesser,
  ];

  /// 其他烹饪食材分块
  static const List<Ingredient> otherIngredients = [
    mole,
    dustmoth,
    primeMate,
    beefalo,
    cookiecutter
  ];

  //========== 映射表（按需添加） ==========//
  static const List<Ingredient> all = [
    ...campfireIngredients,
    ...campfire64Ingredients,
    ...crockPotIngredients,
    ...crockPot64Ingredients,
    ...portableCookerIngredients,
    ...portableCooker64Ingredients,
    ...defaultIngredients,
    ...otherIngredients
  ];

  /// 预生成全局索引（包含所有数据）
  static late final Map<String, Ingredient> _ingredientMap = _buildIngredientMap();

  /// 延迟加载的角色映射表（首次访问时初始化）
  static late final Map<String, Character> _characterMap = () {
    // 使用 LinkedHashMap 保证有序性（如果不需要有序可用普通 HashMap）
    final map = LinkedHashMap<String, Character>(
      equals: (a, b) => a == b,
      hashCode: (key) => key.hashCode,
    );

    // 批量添加角色数据
    for (final char in Character.values) {
      map[char.id] = char;
    }

    return UnmodifiableMapView(map); // 返回不可修改的视图
  }(); // 立即执行匿名函数

  //========== 索引构建方法 ==========//

  /// 构建食材哈希映射（时间复杂度 O(n) → 仅执行一次）
  static Map<String, Ingredient> _buildIngredientMap() {
    final map = HashMap<String, Ingredient>(
      equals: (a, b) => a == b,
      hashCode: (key) => key.hashCode,
      isValidKey: (key) => key is String,
    );

    // 分块填充提升CPU缓存命中率
    void addBlock(List<Ingredient> block) {
      for (var i = 0; i < block.length; i++) {
        final ing = block[i];
        map[ing.id] = ing;
      }
    }

    addBlock(campfireIngredients);
    addBlock(campfire64Ingredients);
    addBlock(crockPotIngredients);
    addBlock(crockPot64Ingredients);
    addBlock(portableCookerIngredients);
    addBlock(portableCooker64Ingredients);
    addBlock(defaultIngredients);
    addBlock(otherIngredients);
    // ... 其他分块

    return UnmodifiableMapView(map); // 防止外部修改
  }

  //========== 解析方法优化 ==========//

  /// 图像路径查询（时间复杂度 O(1)）
  static String getImagePath(String id) {
    // 1. 优先查询食材索引
    final ingredient = _ingredientMap[id];
    if (ingredient != null) return ingredient.imageAsset;

    // 2. 延迟加载角色数据
    final character = _characterMap[id];
    if (character != null) return character.imageAsset;

    // 3. 兜底逻辑
    return 'assets/other/$id.png';
  }

}
