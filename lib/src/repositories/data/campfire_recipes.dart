import 'package:dst_wok/src/common/enums/character.dart';

import '../../models/campfire_recipe.dart';

/// 预定义的火堆配方数据
/// id: 食物ID
/// name: 食物名称
/// priority: 优先级（数值越大越优先匹配）
/// imageUrl: 配方图片资源路径
/// health: 生命值
/// hunger: 饥饿值
/// sanity: san值
/// cookTime: 烹饪所需时间
/// freshness: 保质期
/// desc: 补充说明
/// favorites: 偏好角色
/// sideEffect: 副作用(文字描述)
/// condition: 烹饪条件(文字描述)
/// notContain: 不能包含(文字描述)
/// cookbook: 菜谱示例
/// tips: 说明
const campfireRecipes = [
  // CampfireRecipe(
  //   id: 'berries',
  //   name: '烤浆果',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/berries_cooked.png',
  //   health: 3,
  //   hunger: 62.5,
  //   sanity: 5,
  //   cookTime: '',
  //   freshness: '10',
  //   desc: '',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'juiceberries',
  //   name: '烤多汁浆果',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/berries_juicy_cooked.png',
  //   health: 3,
  //   hunger: 62.5,
  //   sanity: 5,
  //   cookTime: '',
  //   freshness: '10',
  //   desc: '',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'cookedmeat',
  //   name: '熟肉',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/cookedmeat.png',
  //   health: 25,
  //   hunger: 3,
  //   sanity: 0,
  //   cookTime: '',
  //   freshness: '6',
  //   desc:
  //       '• 在火源[img:campfire]上烹饪肉[img:meat]，就会变成熟肉[img:cookedmeat]\n'
  //       '• 在晾肉架[img:assets/other/meatrack.png]上晾干肉[img:assets/ingredients/meat.png]，就会变成肉干[img:assets/campfire_64/meat_dried.png]\n'
  //       '• 肉[img:assets/ingredients/meat.png]、熟肉[img:assets/campfire_64/cookedmeat.png]、'
  //       '肉干[img:assets/campfire_64/meat_dried.png]可以喂食鸟笼[img:assets/other/birdcage.png]中的鸟来换取一个鸟蛋[img:assets/ingredients/bird_egg.png]，'
  //       '也可以给予猪王[img:assets/other/pigking.png]换取一个金块[img:assets/other/goldnugget.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'cookedsmallmeat',
  //   name: '熟小肉',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/cookedsmallmeat.png',
  //   health: 12.5,
  //   hunger: 0,
  //   sanity: -10,
  //   cookTime: '',
  //   freshness: '6',
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪小肉[img:assets/ingredients/smallmeat.png]，就会变成熟小肉[img:assets/campfire_64/cookedsmallmeat.png]\n'
  //       '• 在晾肉架[img:assets/other/meatrack.png]上晾干小肉[img:assets/ingredients/smallmeat.png]、'
  //       '蛙腿[img:assets/ingredients/froglegs]、鸟腿[img:assets/ingredients/drumstick.png]、小鱼块[img:assets/ingredients/fishmeat_small.png]、'
  //       '洞穴蝙蝠翅膀[img:assets/ingredients/batwing.png]或裸露鼻孔[img:assets/ingredients/batnose.png]，'
  //       '就会变成小肉干[img;assets/campfire_64/smallmeat_dried.png]\n'
  //       '• 小肉[img:assets/ingredients/smallmeat.png]、熟小肉[img:assets/campfire_64/cookedsmallmeat.png]、'
  //       '小肉干[img:assets/campfire_64/smallmeat_dried.png]可以喂食鸟笼[img:assets/other/birdcage.png]中的鸟来换取一个鸟蛋[img:assets/ingredients/bird_egg.png]，'
  //       '也可以给予猪王[img:assets/other/pigking.png]换取一个金块[img:assets/other/goldnugget.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'cookedmonstermeat',
  //   name: '熟怪物肉',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/cookedmonstermeat.png',
  //   health: 18.75,
  //   hunger: -3,
  //   sanity: -10,
  //   cookTime: '',
  //   freshness: '15',
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪怪物肉[img:assets/ingredients/monstermeat.png]，就会变成熟怪物肉[img:assets/campfire_64/cookedmonstermeat.png]\n'
  //       '• 在晾肉架[img:assets/other/meatrack.png]上晾干怪物肉[img:assets/ingredients/monstermeat.png]就会变成怪物肉干[img:assets/campfire_64/monstermeat_dried.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'drumstick_cooked',
  //   name: '炸鸟腿',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/drumstick_cooked.png',
  //   health: 12.5,
  //   hunger: 1,
  //   sanity: 0,
  //   cookTime: '',
  //   freshness: '10',
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪鸟腿[img:assets/ingredients/drumstick.png]，就会变成炸鸟腿[img:assets/campfire_64/drumstick_cooked.png]\n'
  //       '• 在晾肉架[img:assets/other/meatrack.png]上晾干鸟腿[img:assets/ingredients/drumstick.png]就会变成肉干[img:assets/campfire_64/meat_dried.png]\n'
  //       '• 烹饪火鸡正餐[img:assets/crockPot_64/turkeydinner.png]需要至少 2 个鸟腿[img:assets/ingredients/drumstick.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'fishmeat_small_cooked',
  //   name: '熟小鱼块',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/fish_meat_small_cooked.png',
  //   health: 12.5,
  //   hunger: 1,
  //   sanity: 0,
  //   cookTime: '',
  //   freshness: '6',
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪小鱼块[img:assets/ingredients/fishmeat_small.png]，就会变成熟小鱼块[img:assets/campfire_64/fishmeat_small_cooked.png]\n'
  //       '• 在晾肉架[img:assets/other/meatrack.png]上晾干小鱼块[img:assets/ingredients/fishmeat_small.png]就会变成小肉干[img:assets/campfire_64/smallmeat_dried.png]\n'
  //       '• 小鱼块和熟小鱼块腐烂后会转变为变质的小鱼块[img:assets/ingredients/spoiled_fish_small.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'fishmeat_cooked',
  //   name: '鱼排',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/fish_meat_cooked.png',
  //   health: 25,
  //   hunger: 8,
  //   sanity: 0,
  //   cookTime: '',
  //   freshness: '3',
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪生鱼肉[img:assets/ingredients/fishmeat.png]，就会变成鱼排[img:assets/campfire_64/fishmeat_cooked.png]\n'
  //       '• 在晾肉架[img:assets/other/meatrack.png]上晾干生鱼肉[img:assets/ingredients/fishmeat.png]就会变成肉干[img:assets/campfire_64/meat_dried.png]\n'
  //       '• 生鱼肉和鱼排腐烂后会转变为变质的变质的鱼[img:assets/ingredients/spoiled_fish.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'batwing_cooked',
  //   name: '熟蝙蝠翅膀',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/batwing_cooked.png',
  //   health: 18.75,
  //   hunger: 8,
  //   sanity: 0,
  //   cookTime: '',
  //   freshness: '10',
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪洞穴蝙蝠翅膀[img:assets/ingredients/batwing.png]，就会变成熟蝙蝠翅膀[img:assets/campfire_64/batwing_cooked.png]\n'
  //       '• 在晾肉架[img:assets/other/meatrack.png]上晾干洞穴蝙蝠翅膀[img:assets/ingredients/batwing.png]就会变成肉干[img:assets/campfire_64/smallmeat_dried.png]\n'
  //       '• 洞穴蝙蝠翅膀[img:assets/ingredients/batwing.png]和熟蝙蝠翅膀[img:assets/campfire_64/batwing_cooked.png]可以喂食鸟笼[img:assets/other/birdcage.png]中的鸟来换取一个鸟蛋[img:assets/ingredients/bird_egg.png]，'
  //       '也可以给予猪王[img:assets/other/pigking.png]换取一个金块[img:assets/other/goldnugget.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'plantmeat_cooked',
  //   name: '熟叶肉',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/pumpkin_cooked.png',
  //   health: 18.75,
  //   hunger: 1,
  //   sanity: 0,
  //   cookTime: '',
  //   freshness: '10',
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪叶肉[img:assets/ingredients/plantmeat.png]，就会变成熟叶肉[img:assets/campfire_64/pumpkin_cooked.png]\n'
  //       '• 烹饪牛肉绿叶菜[img:assets/crockPot_64/meatysalad.png]需要至少1个叶肉[img:assets/ingredients/plantmeat.png]/熟叶肉[img:assets/campfire_64/pumpkin_cooked.png]\n'
  //       '• 烹饪素食堡[img:assets/crockPot_64/leafymeatburger.png]需要至少1个叶肉[img:assets/ingredients/plantmeat.png]/熟叶肉[img:assets/campfire_64/pumpkin_cooked.png]\n'
  //       '• 烹饪果冻沙拉[img:assets/crockPot_64/leafymeatsouffle.png]需要至少2个叶肉[img:assets/ingredients/plantmeat.png]/熟叶肉[img:assets/campfire_64/pumpkin_cooked.png]\n'
  //       '• 烹饪叶肉糕[img:assets/crockPot_64/leafloaf.png]需要至少2个叶肉[img:assets/ingredients/plantmeat.png]/熟叶肉[img:assets/campfire_64/pumpkin_cooked.png]\n',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'barnacle_cooked',
  //   name: '熟藤壶',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/barnacle_cooked.png',
  //   health: 12.5,
  //   hunger: 1,
  //   sanity: 0,
  //   cookTime: '',
  //   freshness: '15',
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪藤壶[img:assets/ingredients/barnacle.png]，就会变成熟藤壶[img:assets/campfire_64/barnacle_cooked.png]\n'
  //       '• 烹饪藤壶皮塔饼[img:assets/crockPot_64/barnaclepita.png]需要至少1个藤壶[img:assets/ingredients/barnacle.png]/熟藤壶[img:assets/campfire_64/barnacle_cooked.png]\n'
  //       '• 烹饪藤壶握寿司[img:assets/crockPot_64/barnaclesushi.png]需要至少1个藤壶[img:assets/ingredients/barnacle.png]/熟藤壶[img:assets/campfire_64/barnacle_cooked.png]\n'
  //       '• 烹饪酿鱼头[img:assets/crockPot_64/barnaclestuffedfishhead.png]需要至少1个藤壶[img:assets/ingredients/barnacle.png]/熟藤壶[img:assets/campfire_64/barnacle_cooked.png]\n'
  //       '• 烹饪藤壶中细面[img:assets/crockPot_64/barnaclinguine.png]需要至少2个藤壶[img:assets/ingredients/barnacle.png]/熟藤壶[img:assets/campfire_64/barnacle_cooked.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'batnose_cooked',
  //   name: '炭烤鼻孔',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/batnose_cooked.png',
  //   health: 18.75,
  //   hunger: 8,
  //   sanity: 0,
  //   cookTime: '',
  //   freshness: '10',
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪裸露鼻孔[img:assets/ingredients/batnose.png]，就会变成炭烤鼻孔[img:assets/campfire_64/batnose_cooked.png]\n'
  //       '• 在晾肉架[img:assets/other/meatrack.png]上晾干裸露鼻孔[img:assets/ingredients/batnose.png]就会变成小肉干[img:assets/campfire_64/smallmeat_dried.png]\n'
  //       '• 烹饪牛奶帽[img:assets/crockPot_64/batnosehat.png]需要至少1个裸露鼻孔[img:assets/ingredients/batnose.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'carrot_cooked',
  //   name: '烤胡萝卜',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/carrot_cooked.png',
  //   health: 12.5,
  //   hunger: 3,
  //   sanity: 0,
  //   cookTime: '',
  //   freshness: '6',
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪胡萝卜[img:assets/ingredients/carrot.png]，就会变成烤胡萝卜[img:assets/campfire_64/carrot_cooked.png]\n'
  //       '• 胡萝卜和烤胡萝卜可作为食材放入锅[img:assets/setting/cookpot.png]/[img:assets/setting/portablecookpot.png]中烹饪，提供 1 蔬菜度\n',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'carrot_cooked',
  //   name: '爆米花',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/corn_cooked.png',
  //   health: 12.5,
  //   hunger: 3,
  //   sanity: 0,
  //   cookTime: '',
  //   freshness: '15',
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪玉米[img:assets/ingredients/corn.png]，就会变成爆米花[img:assets/campfire_64/carrot_cooked.png]\n'
  //       '• 爆米花可以给予小乌鸦[img:assets/ingredients/perdling_crow.png]来换取 1 个鸦年华代币[img:assets/ingredients/carnival_gametoken.png]'
  //       '和 4-8 个奖票[img:assets/ingredients/carnival_prizeticket.png]\n'
  //       '• 烹饪鱼肉玉米卷[img:assets/crockPot_64/fishtacos.png]需要至少 1 个玉米[img:assets/ingredients/corn.png]爆米花[img:assets/campfire_64/carrot_cooked.png]'
  //       '玉米鳕鱼[img:assets/ingredients/oceanfish_medium_5_inv.png]/爆米花鱼[img:assets/ingredients/oceanfish_small_5_inv.png]\n'
  //       '• 烹饪芝士蛋糕[img:assets/crockPot_64/powcake.png]需要至少 1 个玉米[img:assets/ingredients/corn.png]爆米花[img:assets/campfire_64/carrot_cooked.png]'
  //       '玉米鳕鱼[img:assets/ingredients/oceanfish_medium_5_inv.png]/爆米花鱼[img:assets/ingredients/oceanfish_small_5_inv.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'pumpkin_cooked',
  //   name: '烤南瓜',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/pumpkin_cooked.png',
  //   health: 37.5,
  //   hunger: 8,
  //   sanity: 0,
  //   cookTime: '',
  //   freshness: '6',
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪南瓜[img:assets/ingredients/pumpkin.png]，就会变成烤南瓜[img:assets/campfire_64/pumpkin_cooked.png]\n'
  //       '• 烹饪南瓜饼干[img:assets/crockPot_64/pumpkincookie.png]需要至少1个南瓜[img:assets/ingredients/pumpkin.png]/烤南瓜[img:assets/campfire_64/pumpkin_cooked.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'eggplant_cooked',
  //   name: '烤茄子',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/eggplant_cooked.png',
  //   health: 25,
  //   hunger: 20,
  //   sanity: 0,
  //   cookTime: '',
  //   freshness: '6',
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪茄子[img:assets/ingredients/eggplant.png]，就会变成烤茄子[img:assets/campfire_64/eggplant_cooked.png]\n'
  //       '• 烹饪酿茄子[img:assets/crockPot_64/stuffedeggplant.png]需要至少1个茄子[img:assets/ingredients/eggplant.png]/烤茄子[img:assets/campfire_64/eggplant_cooked.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'durian_cooked',
  //   name: '超臭榴莲',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/durian_cooked.png',
  //   health: 25,
  //   hunger: 0,
  //   sanity: -5,
  //   cookTime: '',
  //   freshness: '6',
  //   favorites: {Character.Wurt},
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪榴莲[img:assets/ingredients/durian.png]，就会变成超臭榴莲[img:assets/campfire_64/durian_cooked.png]\n'
  //       '• 会为沃特额外恢复15点饥饿，且不扣除生命值和理智值\n'
  //       '• 榴莲和超臭榴莲具有怪物度，因此在放入烹饪锅制作料理时应当注意放入的榴莲数量不能超过 2 个，否则将做出怪物千层饼[img:assets/crockPot_64/monsterlasagna.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'pomegranate_cooked',
  //   name: '切片熟石榴',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/pomegranate_cooked.png',
  //   health: 12.5,
  //   hunger: 20,
  //   sanity: 0,
  //   cookTime: '',
  //   freshness: '3',
  //   favorites: {Character.Wortox},
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪石榴[img:assets/ingredients/pomegranate.png]，就会变成切片熟石榴[img:assets/campfire_64/pomegranate_cooked.png]\n'
  //       '• 会为沃拓克斯额外恢复 15 点饥饿',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips:
  //       '石榴和切片熟石榴是沃拓克斯最喜欢的食物，但由于沃拓克斯只能从普通食物中回复一半的饱食度，'
  //       '所以石榴只能回复约 12.2 饱食度 [(9.375 + 15) × 0.5 = 12.1875]；'
  //       '切片熟石榴只能回复 13.75 饱食度 [(12.5 + 15) × 0.5 = 13.75]',
  // ),
  // CampfireRecipe(
  //   id: 'dragonfruit_cooked',
  //   name: '熟火龙果',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/dragonfruit_cooked.png',
  //   health: 12.5,
  //   hunger: 20,
  //   sanity: 0,
  //   cookTime: '',
  //   freshness: '3',
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪火龙果[img:assets/ingredients/dragonfruit.png]，就会变成切片熟火龙果[img:assets/campfire_64/dragonfruit_cooked.png]\n'
  //       '• 烹饪火龙果派[img:assets/crockPot_64/dragonpie.png]需要至少1个火龙果[img:assets/ingredients/dragonfruit.png]/熟火龙果[img:assets/campfire_64/dragonfruit_cooked.png]\n'
  //       '• 烹饪辣龙椒沙拉[img:assets/crockPot_64/dragonchilisalad.png]需要至少1个火龙果[img:assets/ingredients/dragonfruit.png]/熟火龙果[img:assets/campfire_64/dragonfruit_cooked.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'watermelon_cooked',
  //   name: '烤西瓜',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/watermelon_cooked.png',
  //   health: 12.5,
  //   hunger: 1,
  //   sanity: 7.5,
  //   cookTime: '',
  //   freshness: '3',
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪西瓜[img:assets/ingredients/watermelon.png]，就会变成烤西瓜[img:assets/campfire_64/watermelon_cooked.png]\n'
  //       '• 烹饪西瓜冰棍[img:assets/crockPot_64/watermelonicle.png]需要至少1个西瓜[img:assets/ingredients/watermelon.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'potato_cooked',
  //   name: '烤土豆',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/potato_cooked.png',
  //   health: 25,
  //   hunger: 20,
  //   sanity: 0,
  //   cookTime: '',
  //   freshness: '6',
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪土豆[img:assets/ingredients/potato.png]，就会变成烤土豆[img:assets/campfire_64/potato_cooked.png]\n'
  //       '• 烹饪花式回旋块茎[img:assets/crockPot_64/potatotornado.png]需要至少1个土豆[img:assets/ingredients/potato.png]/烤土豆[img:assets/campfire_64/potato_cooked.png]\n'
  //       '• 烹饪恐怖国王饼[img:assets/crockPot_64/nightmarepie.png]需要至少1个土豆[img:assets/ingredients/potato.png]/烤土豆[img:assets/campfire_64/potato_cooked.png]\n'
  //       '• 烹饪奶油土豆泥[img:assets/crockPot_64/mashedpotatoes.png]需要至少1个土豆[img:assets/ingredients/potato.png]/烤土豆[img:assets/campfire_64/potato_cooked.png]\n'
  //       '• 烹饪蓬松土豆蛋奶酥[img:assets/crockPot_64/potatosouffle.png]需要至少1个土豆[img:assets/ingredients/potato.png]/烤土豆[img:assets/campfire_64/potato_cooked.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'potato_cooked',
  //   name: '烤土豆',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/potato_cooked.png',
  //   health: 25,
  //   hunger: 20,
  //   sanity: 0,
  //   cookTime: '',
  //   freshness: '6',
  //   favorites: {Character.Wolfgang},
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪土豆[img:assets/ingredients/potato.png]，就会变成烤土豆[img:assets/campfire_64/potato_cooked.png]\n'
  //       '• 会为沃尔夫冈额外恢复15点饥饿\n'
  //       '• 烹饪花式回旋块茎[img:assets/crockPot_64/potatotornado.png]需要至少1个土豆[img:assets/ingredients/potato.png]/烤土豆[img:assets/campfire_64/potato_cooked.png]\n'
  //       '• 烹饪恐怖国王饼[img:assets/crockPot_64/nightmarepie.png]需要至少1个土豆[img:assets/ingredients/potato.png]/烤土豆[img:assets/campfire_64/potato_cooked.png]\n'
  //       '• 烹饪奶油土豆泥[img:assets/crockPot_64/mashedpotatoes.png]需要至少1个土豆[img:assets/ingredients/potato.png]/烤土豆[img:assets/campfire_64/potato_cooked.png]\n'
  //       '• 烹饪蓬松土豆蛋奶酥[img:assets/crockPot_64/potatosouffle.png]需要至少1个土豆[img:assets/ingredients/potato.png]/烤土豆[img:assets/campfire_64/potato_cooked.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
  // CampfireRecipe(
  //   id: 'asparagus_cooked',
  //   name: '烤芦笋',
  //   priority: 1,
  //   imageUrl: 'assets/campfire/asparagus_cooked.png',
  //   health: 25,
  //   hunger: 3,
  //   sanity: 0,
  //   cookTime: '',
  //   freshness: '3',
  //   desc:
  //       '• 在火源[img:assets/other/campfire.png]上烹饪芦笋[img:assets/ingredients/asparagus.png]，就会变成烤芦笋[img:assets/campfire_64/asparagus_cooked.png]\n'
  //       '• 烹饪芦笋汤[img:assets/crockPot_64/asparagussoup.png]需要至少1个芦笋[img:assets/ingredients/asparagus.png]/烤芦笋[img:assets/campfire_64/asparagus_cooked.png]\n'
  //       '• 烹饪蔬菜鸡尾酒[img:assets/crockPot_64/vegstinger.png]需要至少1个芦笋[img:assets/ingredients/asparagus.png]/烤芦笋[img:assets/campfire_64/asparagus_cooked.png]\n'
  //       '• 烹饪芦笋冷汤[img:assets/crockPot_64/gazpacho.png]需要至少2个芦笋[img:assets/ingredients/asparagus.png]/烤芦笋[img:assets/campfire_64/asparagus_cooked.png]',
  //   sideEffect: '',
  //   condition: '',
  //   notContain: '',
  //   cookbook: [],
  //   tips: '',
  // ),
];
