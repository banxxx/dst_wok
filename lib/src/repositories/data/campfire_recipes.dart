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
  CampfireRecipe(
    id: 'cookedmeat',
    name: '熟肉',
    priority: 1,
    imageUrl: 'assets/campfire/cookedmeat.png',
    health: 25,
    hunger: 3,
    sanity: 0,
    freshness: '6',
    desc:
        '• 在火源[img:campfire]上烹饪肉[img:meat]，就会变成熟肉[img:cookedmeat_64]\n'
        '• 在晾肉架[img:meatrack]上晾干肉[img:meat]，就会变成肉干[img:meat_dried_64]\n'
        '• 肉[img:meat]、熟肉[img:cookedmeat_64]、肉干[img:meat_dried_64]可以喂食鸟笼[img:birdcage]中的鸟来换取一个鸟蛋[img:bird_egg]，也可以给予猪王[img:pigking]换取一个金块[img:goldnugget]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'cookedsmallmeat',
    name: '熟小肉',
    priority: 1,
    imageUrl: 'assets/campfire/cookedsmallmeat.png',
    health: 12.5,
    hunger: 0,
    sanity: -10,
    freshness: '6',
    desc:
        '• 在火源[img:campfire]上烹饪小肉[img:smallmeat]，就会变成熟小肉[img:cookedsmallmeat_64]\n'
        '• 在晾肉架[img:meatrack]上晾干小肉[img:smallmeat]、蛙腿[img:froglegs]、鸟腿[img:drumstick]、小鱼块[img:fishmeat_small]、洞穴蝙蝠翅膀[img:batwing]或裸露鼻孔[img:batnose]，就会变成小肉干[img:smallmeat_dried_64]\n'
        '• 小肉[img:smallmeat]、熟小肉[img:cookedsmallmeat_64]、小肉干[img:smallmeat_dried_64]可以喂食鸟笼[img:birdcage]中的鸟来换取一个鸟蛋[img:bird_egg]，也可以给予猪王[img:pigking]换取一个金块[img:goldnugget]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'cookedmonstermeat',
    name: '熟怪物肉',
    priority: 1,
    imageUrl: 'assets/campfire/cookedmonstermeat.png',
    health: 18.75,
    hunger: -3,
    sanity: -10,
    freshness: '15',
    desc:
        '• 在火源[img:campfire]上烹饪怪物肉[img:monstermeat]，就会变成熟怪物肉[img:cookedmonstermeat_64]\n'
        '• 在晾肉架[img:meatrack]上晾干怪物肉[img:monstermeat]就会变成怪物肉干[img:monstermeat_dried_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'drumstick_cooked',
    name: '炸鸟腿',
    priority: 1,
    imageUrl: 'assets/campfire/drumstick_cooked.png',
    health: 12.5,
    hunger: 1,
    sanity: 0,
    freshness: '10',
    desc:
        '• 在火源[img:campfire]上烹饪鸟腿[img:drumstick]，就会变成炸鸟腿[img:drumstick_cooked_64]\n'
        '• 在晾肉架[img:meatrack]上晾干鸟腿[img:drumstick]就会变成肉干[img:meat_dried]\n'
        '• 烹饪火鸡正餐[img:turkeydinner_64]需要至少 2 个鸟腿[img:drumstick]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'fishmeat_small_cooked',
    name: '熟小鱼块',
    priority: 1,
    imageUrl: 'assets/campfire/fish_meat_small_cooked.png',
    health: 12.5,
    hunger: 1,
    sanity: 0,
    freshness: '6',
    desc:
        '• 在火源[img:campfire]上烹饪小鱼块[img:fishmeat_small]，就会变成熟小鱼块[img:fish_meat_small_cooked_64]\n'
        '• 在晾肉架[img:meatrack]上晾干小鱼块[img:fishmeat_small]就会变成小肉干[img:smallmeat_dried_64]\n'
        '• 小鱼块和熟小鱼块腐烂后会转变为变质的小鱼块[img:spoiled_fish_small]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'fishmeat_cooked',
    name: '鱼排',
    priority: 1,
    imageUrl: 'assets/campfire/fish_meat_cooked.png',
    health: 25,
    hunger: 8,
    sanity: 0,
    freshness: '3',
    desc:
        '• 在火源[img:campfire]上烹饪生鱼肉[img:fishmeat]，就会变成鱼排[img:fishmeat_cooked_64]\n'
        '• 在晾肉架[img:meatrack]上晾干生鱼肉[img:fishmeat]就会变成肉干[img:meat_dried]\n'
        '• 生鱼肉和鱼排腐烂后会转变为变质的变质的鱼[img:spoiled_fish]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'batwing_cooked',
    name: '熟蝙蝠翅膀',
    priority: 1,
    imageUrl: 'assets/campfire/batwing_cooked.png',
    health: 18.75,
    hunger: 8,
    sanity: 0,
    freshness: '10',
    desc:
        '• 在火源[img:campfire]上烹饪洞穴蝙蝠翅膀[img:batwing]，就会变成熟蝙蝠翅膀[img:batwing_cooked_64.png]\n'
        '• 在晾肉架[img:meatrack]上晾干洞穴蝙蝠翅膀[img:batwing]就会变成肉干[img:smallmeat_dried_64]\n'
        '• 洞穴蝙蝠翅膀[img:batwing]和熟蝙蝠翅膀[img:batwing_cooked_64]可以喂食鸟笼[img:birdcage]中的鸟来换取一个鸟蛋[img:bird_egg]，也可以给予猪王[img:pigking]换取一个金块[img:goldnugget]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'plantmeat_cooked',
    name: '熟叶肉',
    priority: 1,
    imageUrl: 'assets/campfire/pumpkin_cooked.png',
    health: 18.75,
    hunger: 1,
    sanity: 0,
    freshness: '10',
    desc:
        '• 在火源[img:campfire]上烹饪叶肉[img:plantmeat]，就会变成熟叶肉[img:pumpkin_cooked_64]\n'
        '• 烹饪牛肉绿叶菜[img:meatysalad_64]需要至少1个叶肉[img:plantmeat]/熟叶肉[img:pumpkin_cooked_64]\n'
        '• 烹饪素食堡[img:leafymeatburger_64]需要至少1个叶肉[img:plantmeat]/熟叶肉[img:pumpkin_cooked_64]\n'
        '• 烹饪果冻沙拉[img:leafymeatsouffle_64]需要至少2个叶肉[img:plantmeat]/熟叶肉[img:pumpkin_cooked_64]\n'
        '• 烹饪叶肉糕[img:leafloaf_64]需要至少2个叶肉[img:plantmeat]/熟叶肉[img:pumpkin_cooked_64]\n',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'barnacle_cooked',
    name: '熟藤壶',
    priority: 1,
    imageUrl: 'assets/campfire/barnacle_cooked.png',
    health: 12.5,
    hunger: 1,
    sanity: 0,
    freshness: '15',
    desc:
        '• 在火源[img:campfire]上烹饪藤壶[img:barnacle]，就会变成熟藤壶[img:barnacle_cooked_64]\n'
        '• 烹饪藤壶皮塔饼[img:barnaclepita_64]需要至少1个藤壶[img:barnacle]/熟藤壶[img:barnacle_cooked_64]\n'
        '• 烹饪藤壶握寿司[img:barnaclesushi_64]需要至少1个藤壶[img:barnacle]/熟藤壶[img:barnacle_cooked_64]\n'
        '• 烹饪酿鱼头[img:barnaclestuffedfishhead_64]需要至少1个藤壶[img:barnacle]/熟藤壶[img:barnacle_cooked_64]\n'
        '• 烹饪藤壶中细面[img:barnaclinguine_64]需要至少2个藤壶[img:barnacle]/熟藤壶[img:barnacle_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'batnose_cooked',
    name: '炭烤鼻孔',
    priority: 1,
    imageUrl: 'assets/campfire/batnose_cooked.png',
    health: 18.75,
    hunger: 8,
    sanity: 0,
    freshness: '10',
    desc:
        '• 在火源[img:campfire]上烹饪裸露鼻孔[img:batnose]，就会变成炭烤鼻孔[img:batnose_cooked_64]\n'
        '• 在晾肉架[img:meatrack]上晾干裸露鼻孔[img:batnose]就会变成小肉干[img:smallmeat_dried_64]\n'
        '• 烹饪牛奶帽[img:batnosehat_64]需要至少1个裸露鼻孔[img:batnose]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'carrot_cooked',
    name: '烤胡萝卜',
    priority: 1,
    imageUrl: 'assets/campfire/carrot_cooked.png',
    health: 12.5,
    hunger: 3,
    sanity: 0,
    freshness: '6',
    desc:
        '• 在火源[img:campfire]上烹饪胡萝卜[img:carrot.png]，就会变成烤胡萝卜[img:carrot_cooked_64]\n'
        '• 胡萝卜和烤胡萝卜可作为食材放入锅[img:cookpot]/[img:portablecookpot_64]中烹饪，提供 1 蔬菜度\n',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'carrot_cooked',
    name: '爆米花',
    priority: 1,
    imageUrl: 'assets/campfire/corn_cooked.png',
    health: 12.5,
    hunger: 3,
    sanity: 0,
    freshness: '15',
    desc:
        '• 在火源[img:campfire]上烹饪玉米[img:corn]，就会变成爆米花[img:carrot_cooked_64]\n'
        '• 爆米花可以给予小乌鸦[img:perdling_crow]来换取 1 个鸦年华代币[img:carnival_gametoken]和 4-8 个奖票[img:carnival_prizeticket]\n'
        '• 烹饪鱼肉玉米卷[img:fishtacos_64]需要至少 1 个玉米[img:corn.png]爆米花[img:carrot_cooked_64]玉米鳕鱼[img:oceanfish_medium_5_inv]/爆米花鱼[img:oceanfish_small_5_inv]\n'
        '• 烹饪芝士蛋糕[img:powcake_64]需要至少 1 个玉米[img:corn.png]爆米花[img:carrot_cooked_64]玉米鳕鱼[img:oceanfish_medium_5_inv]/爆米花鱼[img:oceanfish_small_5_inv]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'pumpkin_cooked',
    name: '烤南瓜',
    priority: 1,
    imageUrl: 'assets/campfire/pumpkin_cooked.png',
    health: 37.5,
    hunger: 8,
    sanity: 0,
    freshness: '6',
    desc:
        '• 在火源[img:campfire]上烹饪南瓜[img:pumpkin]，就会变成烤南瓜[img:pumpkin_cooked_64]\n'
        '• 烹饪南瓜饼干[img:pumpkincookie_64]需要至少1个南瓜[img:pumpkin]/烤南瓜[img:pumpkin_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'eggplant_cooked',
    name: '烤茄子',
    priority: 1,
    imageUrl: 'assets/campfire/eggplant_cooked.png',
    health: 25,
    hunger: 20,
    sanity: 0,
    freshness: '6',
    desc:
        '• 在火源[img:campfire]上烹饪茄子[img:eggplant]，就会变成烤茄子[img:eggplant_cooked_64]\n'
        '• 烹饪酿茄子[img:stuffedeggplant_64]需要至少1个茄子[img:eggplant]/烤茄子[img:eggplant_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'durian_cooked',
    name: '超臭榴莲',
    priority: 1,
    imageUrl: 'assets/campfire/durian_cooked.png',
    health: 25,
    hunger: 0,
    sanity: -5,
    freshness: '6',
    favorites: {Character.Wurt},
    desc:
        '• 在火源[img:campfire]上烹饪榴莲[img:durian]，就会变成超臭榴莲[img:durian_cooked_64]\n'
        '• 会为沃特额外恢复15点饥饿，且不扣除生命值和理智值\n'
        '• 榴莲和超臭榴莲具有怪物度，因此在放入烹饪锅制作料理时应当注意放入的榴莲数量不能超过 2 个，否则将做出怪物千层饼[img:monsterlasagna]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'pomegranate_cooked',
    name: '切片熟石榴',
    priority: 1,
    imageUrl: 'assets/campfire/pomegranate_cooked.png',
    health: 12.5,
    hunger: 20,
    sanity: 0,
    freshness: '3',
    favorites: {Character.Wortox},
    desc:
        '• 在火源[img:campfire]上烹饪石榴[img:pomegranate]，就会变成切片熟石榴[img:pomegranate_cooked_64]\n'
        '• 会为沃拓克斯额外恢复 15 点饥饿',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips:
        '石榴和切片熟石榴是沃拓克斯最喜欢的食物，但由于沃拓克斯只能从普通食物中回复一半的饱食度，'
        '所以石榴只能回复约 12.2 饱食度 [(9.375 + 15) × 0.5 = 12.1875]；'
        '切片熟石榴只能回复 13.75 饱食度 [(12.5 + 15) × 0.5 = 13.75]',
  ),
  CampfireRecipe(
    id: 'dragonfruit_cooked',
    name: '熟火龙果',
    priority: 1,
    imageUrl: 'assets/campfire/dragonfruit_cooked.png',
    health: 12.5,
    hunger: 20,
    sanity: 0,
    freshness: '3',
    desc:
        '• 在火源[img:campfire]上烹饪火龙果[img:dragonfruit]，就会变成切片熟火龙果[img:dragonfruit_cooked_64]\n'
        '• 烹饪火龙果派[img:dragonpie_64]需要至少1个火龙果[img:dragonfruit]/熟火龙果[img:dragonfruit_cooked_64]\n'
        '• 烹饪辣龙椒沙拉[img:dragonchilisalad_64]需要至少1个火龙果[img:dragonfruit]/熟火龙果[img:dragonfruit_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'watermelon_cooked',
    name: '烤西瓜',
    priority: 1,
    imageUrl: 'assets/campfire/watermelon_cooked.png',
    health: 12.5,
    hunger: 1,
    sanity: 7.5,
    freshness: '3',
    desc:
        '• 在火源[img:campfire]上烹饪西瓜[img:watermelon]，就会变成烤西瓜[img:watermelon_cooked_64]\n'
        '• 烹饪西瓜冰棍[img:watermelonicle_64]需要至少1个西瓜[img:watermelon]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'tomato_cooked',
    name: '烤番茄',
    priority: 1,
    imageUrl: 'assets/campfire/tomato_cooked.png',
    health: 12.5,
    hunger: 20,
    sanity: 0,
    freshness: '10',
    desc:
        '• 在火源[img:campfire]上烹饪番茄[img:tomato]，就会变成烤番茄[img:tomato_cooked_64]\n'
        '• 烹饪生鲜萨尔萨酱[img:salsa_64]需要至少 1 个番茄[img:tomato]/烤番茄[img:tomato_cooked_64]和1个洋葱[img:onion]/烤洋葱[img:onion_cooked_64]\n'
        '• 烹饪蔬菜鸡尾酒[img:vegstinger_64]需要至少 1 个番茄[img:tomato]/烤番茄[img:tomato_cooked_64]和 1 个芦笋[img:asparagus]/烤芦笋[img:asparagus_cooked_64]\n'
        '• 烹饪海鲜杂烩[img:moqueca_64]需要至少 1 个番茄[img:tomato]/烤番茄[img:tomato_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'potato_cooked',
    name: '烤土豆',
    priority: 1,
    imageUrl: 'assets/campfire/potato_cooked.png',
    health: 25,
    hunger: 20,
    sanity: 0,
    freshness: '6',
    favorites: {Character.Wolfgang},
    desc:
        '• 在火源[img:campfire]上烹饪土豆[img:potato.png]，就会变成烤土豆[img:potato_cooked_64]\n'
        '• 会为沃尔夫冈额外恢复15点饥饿\n'
        '• 烹饪花式回旋块茎[img:potatotornado_64]需要至少1个土豆[img:potato]/烤土豆[img:potato_cooked_64]\n'
        '• 烹饪恐怖国王饼[img:nightmarepie_64]需要至少1个土豆[img:potato]/烤土豆[img:potato_cooked_64]\n'
        '• 烹饪奶油土豆泥[img:mashedpotatoes_64]需要至少1个土豆[img:potato]/烤土豆[img:potato_cooked_64]\n'
        '• 烹饪蓬松土豆蛋奶酥[img:potatosouffle_64]需要至少1个土豆[img:potato]/烤土豆[img:potato_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'asparagus_cooked',
    name: '烤芦笋',
    priority: 1,
    imageUrl: 'assets/campfire/asparagus_cooked.png',
    health: 25,
    hunger: 3,
    sanity: 0,
    freshness: '3',
    desc:
        '• 在火源[img:campfire]上烹饪芦笋[img:asparagus]，就会变成烤芦笋[img:asparagus_cooked_64]\n'
        '• 烹饪芦笋汤[img:asparagussoup_64]需要至少1个芦笋[img:asparagus]/烤芦笋[img:asparagus_cooked_64]\n'
        '• 烹饪蔬菜鸡尾酒[img:vegstinger_64]需要至少1个芦笋[img:asparagus]/烤芦笋[img:asparagus_cooked_64]\n'
        '• 烹饪芦笋冷汤[img:gazpacho_64]需要至少2个芦笋[img:asparagus]/烤芦笋[img:asparagus_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'onion_cooked',
    name: '烤洋葱',
    priority: 1,
    imageUrl: 'assets/campfire/onion_cooked.png',
    health: 9.375,
    hunger: 1,
    sanity: -5,
    freshness: '10',
    desc:
        '• 在火源[img:campfire]上烹饪洋葱[img:onion]，就会变成烤洋葱[img:onion_cooked_64]\n'
        '• 烹饪海鲜杂烩[img:moqueca_64]需要至少1个洋葱[img:onion]/烤洋葱[img:onion_cooked_64]\n'
        '• 烹饪素食堡[img:leafymeatburger_64]需要至少1个洋葱[img:onion]/烤洋葱[img:onion_cooked_64]\n'
        '• 烹饪恐怖国王饼[img:nightmarepie_64]需要至少1个洋葱[img:onion]/烤洋葱[img:onion_cooked_64]\n'
        '• 烹饪骨头汤[img:bonesoup_64]需要至少1个洋葱[img:onion]/烤洋葱[img:onion_cooked_64]\n'
        '• 烹饪生鲜萨尔萨酱[img:salsa_64]需要至少1个洋葱[img:onion]/烤洋葱[img:onion_cooked_64]和1个番茄[img:tomato]/烤番茄[img:tomato_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'garlic_cooked',
    name: '烤大蒜',
    priority: 1,
    imageUrl: 'assets/campfire/garlic_cooked.png',
    health: 9.375,
    hunger: 0,
    sanity: -10,
    freshness: '15',
    desc:
        '• 在火源[img:campfire]上烹饪大蒜[img:garlic]，就会变成烤大蒜[img:garlic_cooked_64]\n'
        '• 烹饪奶油土豆泥[img:mashedpotatoes_64]需要至少1个大蒜[img:garlic]/烤大蒜[img:garlic_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips:
        '大蒜[img:garlic]/烤大蒜[img:garlic_cooked_64]可搭配土豆[img:potato]/烤土豆[img:potato_cooked_64]制作出奶油土豆泥料理[img:mashedpotatoes_64]',
  ),
  CampfireRecipe(
    id: 'pepper_cooked',
    name: '烤辣椒',
    priority: 1,
    imageUrl: 'assets/campfire/pepper_cooked.png',
    health: 9.375,
    hunger: -3,
    sanity: -10,
    freshness: '15',
    desc:
        '• 在火源[img:campfire]上烹饪辣椒[img:pepper]，就会变成烤辣椒[img:pepper_cooked_64]\n'
        '• 烹饪爆炒填馅辣椒[img:pepperpopper_64]需要至少1个辣椒[img:pepper]/烤辣椒[img:pepper_cooked_64]\n'
        '• 烹饪辣龙椒沙拉[img:dragonchilisalad_64]需要至少2个辣椒[img:pepper]/烤辣椒[img:pepper_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'berries_cooked',
    name: '烤浆果',
    priority: 1,
    imageUrl: 'assets/campfire/berries_cooked.png',
    health: 12.5,
    hunger: 1,
    sanity: 0,
    freshness: '3',
    desc:
        '• 在火源[img:campfire]上烹饪浆果[img:berries]，就会变成烤浆果[img:berries_cooked_64]\n'
        '• 烹饪什锦干果[img:trailmix_64]需要至少1个浆果[img:berries]/烤浆果[img:berries_cooked_64]/多汁浆果[img:berries_juicy]/烤多汁浆果[img:berries_juicy_cooked_64]\n'
        '• 烹饪华夫饼[img:waffles_64]需要至少1个浆果[img:berries]/烤浆果[img:berries_cooked_64]/多汁浆果[img:berries_juicy]/烤多汁浆果[img:berries_juicy_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'berries_juicy_cooked',
    name: '烤多汁浆果',
    priority: 1,
    imageUrl: 'assets/campfire/berries_juicy_cooked.png',
    health: 18.75,
    hunger: 3,
    sanity: 0,
    freshness: '1',
    desc:
        '• 在火源[img:campfire]上烹饪多汁浆果[img:berries_juicy]，就会变成烤多汁浆果[img:berries_juicy_cooked_64]\n'
        '• 烹饪什锦干果[img:trailmix_64]需要至少1个浆果[img:berries]/烤浆果[img:berries_cooked_64]/多汁浆果[img:berries_juicy]/烤多汁浆果[img:berries_juicy_cooked_64]\n'
        '• 烹饪华夫饼[img:waffles_64]需要至少1个浆果[img:berries]/烤浆果[img:berries_cooked_64]/多汁浆果[img:berries_juicy]/烤多汁浆果[img:berries_juicy_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'cave_banana_cooked',
    name: '熟香蕉',
    priority: 1,
    imageUrl: 'assets/campfire/cave_banana_cooked.png',
    health: 12.5,
    hunger: 3,
    sanity: 0,
    freshness: '6',
    favorites: {Character.Wormwood},
    desc:
        '• 在火源[img:campfire]上烹饪香蕉[img:cave_banana]，就会变成熟香蕉[img:cave_banana_cooked_64]\n'
        '• 会为沃姆伍德额外恢复15点饥饿\n'
        '• 烹饪香蕉冻[img:bananapop_64]需要至少 1 个香蕉[img:cave_banana]/熟香蕉[img:cave_banana_cooked_64]\n'
        '• 烹饪冰香蕉冻唇蜜[img:frozenbananadaiquiri_64]需要至少 1 个香蕉[img:cave_banana]/熟香蕉[img:cave_banana_cooked_64]\n'
        '• 烹饪香蕉奶昔[img:bananajuice_64]需要至少 2 个香蕉[img:cave_banana]/熟香蕉[img:cave_banana_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'cactus_meat_cooked',
    name: '熟仙人掌肉',
    priority: 1,
    imageUrl: 'assets/campfire/cactus_meat_cooked.png',
    health: 12.5,
    hunger: 1,
    sanity: 15,
    freshness: '10',
    desc:
        '• 在火源[img:campfire]上烹饪仙人掌肉[img:cactus_meat]，就会变成熟仙人掌肉[img:cactus_meat_cooked_64]\n'
        '• 熟仙人掌肉是很好的恢复理智值的食物\n'
        '• 烹饪鳄梨酱[img:guacamole_64]需要至少 1 个仙人掌肉[img:cactus_meat]/熟仙人掌肉[img:cactus_meat_cooked_64]/成熟石果/熟石果',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'fig_cooked',
    name: '熟无花果',
    priority: 1,
    imageUrl: 'assets/campfire/fig_cooked.png',
    health: 18.75,
    hunger: 1,
    sanity: 0,
    freshness: '3',
    desc:
        '• 在火源[img:campfire]上烹饪无花果[img:fig]，就会变成熟无花果[img:fig_cooked_64]\n'
        '• 烹饪无花果烤串[img:figkabab_64]需要至少 1 个无花果[img:fig]/熟无花果[img:fig_cooked_64]\n'
        '• 烹饪无花果蛙腿三明治[img:frognewton_64]需要至少 1 个无花果[img:fig]/熟无花果[img:fig_cooked_64]\n'
        '• 烹饪无花果意面[img:figatoni_64]需要至少 1 个无花果[img:fig]/熟无花果[img:fig_cooked_64]\n'
        '• 烹饪无花果酿象鼻[img:koalefig_trunk_64]需要至少 1 个无花果[img:fig]/熟无花果[img:fig_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'kelp_cooked',
    name: '熟海带叶',
    priority: 1,
    imageUrl: 'assets/campfire/kelp_cooked.png',
    health: 9.375,
    hunger: 0,
    sanity: -5,
    freshness: '10',
    desc:
        '• 在火源[img:campfire]上烹饪海带叶[img:kelp]，就会变成熟海带叶[img:kelp_cooked_64]\n'
        '• 烹饪藤壶握寿司[img:barnaclesushi_64]需要至少 1 个海带叶[img:kelp]/熟海带叶[img:kelp_cooked_64]\n'
        '• 烹饪加州卷[img:californiaroll_64]需要恰好 2 个海带叶[img:kelp]/熟海带叶[img:kelp_cooked_64]/干海带叶[img:kelp_dried_64]\n'
        '• 烹饪鳗鱼料理[img:unagi_64]需要至少 1 个苔藓[img:cutlichen]/海带叶[img:kelp]/熟海带叶[img:kelp_cooked_64]/干海带叶[img:kelp_dried_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'seeds_cooked',
    name: '烤种子',
    priority: 1,
    imageUrl: 'assets/campfire/seeds_cooked.png',
    health: 4.6875,
    hunger: 1,
    sanity: 0,
    freshness: '10',
    desc: '• 在火源[img:campfire]上烹饪种子[img:seeds]，就会变成烤种子[img:seeds_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'acorn_cooked',
    name: '烤桦栗果',
    priority: 1,
    imageUrl: 'assets/campfire/acorn_cooked.png',
    health: 9.375,
    hunger: 1,
    sanity: 0,
    freshness: '6',
    desc:
        '• 在火源[img:campfire]上烹饪桦栗果[img:acorn]，就会变成烤桦栗果[img:acorn_cooked_64]\n'
        '• 烹饪什锦干果[img:trailmix_64]需要至少1个桦栗果[img:acorn]/烤桦栗果[img:acorn_cooked_64]\n'
        '• 烹饪皮弗娄牛零食[img:beefalotreat_64]需要种子度大于0，而目前游戏中只有桦栗果和烤桦栗果有种子度',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'red_cap_cooked',
    name: '熟红蘑菇',
    priority: 1,
    imageUrl: 'assets/campfire/red_cap_cooked.png',
    health: 0,
    hunger: 1,
    sanity: -10,
    freshness: '10',
    desc:
        '• 在火源[img:campfire]上烹饪红蘑菇[img:red_cap]，就会变成熟红蘑菇[img:red_cap_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'green_cap_cooked',
    name: '熟绿蘑菇',
    priority: 1,
    imageUrl: 'assets/campfire/green_cap_cooked.png',
    health: 0,
    hunger: -1,
    sanity: 15,
    freshness: '10',
    desc:
        '• 在火源[img:campfire]上烹饪红蘑菇[img:green_cap]，就会变成熟红蘑菇[img:green_cap_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'blue_cap_cooked',
    name: '熟红蘑菇',
    priority: 1,
    imageUrl: 'assets/campfire/blue_cap_cooked.png',
    health: 0,
    hunger: -3,
    sanity: 10,
    freshness: '10',
    desc:
        '• 在火源[img:campfire]上烹饪红蘑菇[img:blue_cap]，就会变成熟红蘑菇[img:blue_cap_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'moon_cap_cooked',
    name: '熟月亮蘑菇',
    priority: 1,
    imageUrl: 'assets/campfire/moon_cap_cooked.png',
    health: -12,
    hunger: 0,
    sanity: -10,
    freshness: '10',
    desc:
        '• 在火源[img:campfire]上烹饪红蘑菇[img:moon_cap]，就会变成熟红蘑菇[img:moon_cap_cooked_64]\n'
        '• 食用熟月亮蘑菇会清零催眠值',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'rock_avocado_fruit_ripe_cooked',
    name: '熟石果',
    priority: 1,
    imageUrl: 'assets/campfire/rock_avocado_fruit_ripe_cooked.png',
    health: 12.5,
    hunger: 3,
    sanity: -0,
    freshness: '2',
    desc:
        '• 在火源[img:campfire]上烹饪石果[img:rock_avocado_fruit_ripe]，就会变成熟石果[img:rock_avocado_fruit_ripe_cooked_64]\n'
        '• 烹饪鳄梨酱[img:guacamole_64]需要至少 1 个仙人掌肉[img:cactus_meat]/熟仙人掌肉[img:cactus_meat_cooked_64]/成熟石果[img:rock_avocado_fruit_ripe_64]/熟石果[img:rock_avocado_fruit_ripe_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'froglegs_cooked',
    name: '熟蛙腿',
    priority: 1,
    imageUrl: 'assets/campfire/froglegs_cooked.png',
    health: 12.5,
    hunger: 1,
    sanity: 0,
    freshness: '10',
    desc:
        '• 在火源[img:campfire]上烹饪蛙腿[img:froglegs]，就会变成熟蛙腿[img:froglegs_cooked_64]\n'
        '• 烹饪蛙腿三明治[img:frogglebunwich64]需要至少1个蛙腿[img:froglegs]/熟蛙腿[img:froglegs_cooked_64]\n'
        '• 烹饪无花果蛙腿三明治[img:frognewton_64]需要至少1个蛙腿[img:froglegs]/熟蛙腿[img:froglegs_cooked_64]\n'
        '• 烹饪蓝带鱼排[img:frogfishbowl_64]需要至少2个蛙腿[img:froglegs]/熟蛙腿[img:froglegs_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'bird_egg_cooked',
    name: '熟鸟蛋',
    priority: 1,
    imageUrl: 'assets/campfire/bird_egg_cooked.png',
    health: 12.5,
    hunger: 0,
    sanity: 0,
    freshness: '6',
    desc:
        '• 在火源[img:campfire]上烹饪鸟蛋[img:bird_egg]，就会变成熟鸟蛋[img:bird_egg_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'tallbirdegg_cooked',
    name: '煎高脚鸟蛋',
    priority: 1,
    imageUrl: 'assets/campfire/tallbirdegg_cooked.png',
    health: 37.5,
    hunger: 0,
    sanity: 0,
    freshness: '6',
    desc:
        '• 在火源[img:campfire]上烹饪鸟蛋[img:tallbirdegg]，就会变成熟鸟蛋[img:tallbirdegg_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'eel_cooked',
    name: '熟鳗鱼',
    priority: 1,
    imageUrl: 'assets/campfire/eel_cooked.png',
    health: 12.5,
    hunger: 8,
    sanity: 0,
    freshness: '6',
    desc:
        '• 在火源[img:campfire]上烹饪活鳗鱼[img:pondeel]/鳗鱼[img:eel]，就会变成熟鳗鱼[img:eel_cooked_64]\n'
        '鳗鱼[img:eel]和熟鳗鱼[img:pondeel]腐烂后会转变为变质的鱼[img:spoiled_fish]\n'
        '• 烹饪鳗鱼料理[img:unagi_64]需要至少 1 个活鳗鱼[img:pondeel]/鳗鱼[img:eel]/熟鳗鱼[img:eel_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'wobster_sheller_dead_cooked',
    name: '美味的龙虾',
    priority: 1,
    imageUrl: 'assets/campfire/wobster_sheller_dead_cooked.png',
    health: 12.5,
    hunger: 1,
    sanity: 0,
    freshness: '6',
    desc:
        '• 在火源[img:campfire]上烹饪龙虾[img:wobster_sheller_land]/死龙虾[img:wobster_sheller_dead]，就会变成美味的龙虾[img:wobster_sheller_dead_cooked_64]\n'
        '• 死龙虾[img:wobster_sheller_dead]和美味的龙虾[img:wobster_sheller_dead_cooked_64]不能入锅[img:cookpot]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'trunk_cooked',
    name: '象鼻排',
    priority: 1,
    imageUrl: 'assets/campfire/trunk_cooked.png',
    health: 75,
    hunger: 40,
    sanity: 0,
    freshness: '15',
    desc:
        '• 在火源[img:campfire]上烹饪象鼻[img:trunk_summer]/冬象鼻[img:trunk_winter]，就会变成象鼻排[img:trunk_cooked_64]\n'
        '• 烹饪无花果酿象鼻[img:koalefig_trunk_64]需要至少1个象鼻[img:trunk_summer]/冬象鼻[img:trunk_winter]/象鼻排[img:trunk_cooked_64]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'cookedmandrake',
    name: '熟曼德拉草',
    priority: 1,
    imageUrl: 'assets/campfire/cookedmandrake.png',
    health: 150,
    hunger: 100,
    sanity: 0,
    freshness: '\u221E',
    desc:
        '• 在火源[img:campfire]上烹饪曼德拉草[img:mandrake]，就会变成熟曼德拉草[img:cookedmandrake_64]\n'
        '吃曼德拉草或熟曼德拉草，会对 15 距离单位内的所有生物施加7层睡眠，使睡眠 10~11 秒\n'
        '• 烹饪曼德拉草汤[img:mandrakesoup_64]需要至少1个曼德拉草[img:mandrake]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
  CampfireRecipe(
    id: 'ancientfruit_nightvision_cooked',
    name: '熟夜莓',
    priority: 1,
    imageUrl: 'assets/campfire/ancientfruit_nightvision_cooked.png',
    health: 18.75,
    hunger: -3,
    sanity: -5,
    freshness: '3',
    desc:
        '• 在火源[img:campfire]上烹饪夜莓[img:ancientfruit_nightvision]，就会变成熟夜莓[img:ancientfruit_nightvision_cooked_64]\n'
        '吃曼德拉草或熟曼德拉草，会对 15 距离单位内的所有生物施加7层睡眠，使睡眠 10~11 秒\n'
        '• 烹饪曼德拉草汤[img:mandrakesoup_64]需要至少1个曼德拉草[img:mandrake]',
    sideEffect: '',
    condition: '',
    notContain: '',
    cookbook: [],
    tips: '',
  ),
];
