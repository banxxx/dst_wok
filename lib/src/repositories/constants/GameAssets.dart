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
  static const _campfirePath = 'assets/campfire';                   // 火源烹饪
  static const _campfire64Path = 'assets/campfire_64';              // 火源烹饪64分辨率
  static const _crockPotPath = 'assets/crockPot';                   // 烹饪锅烹饪
  static const _crockPot64Path = 'assets/crockPot_64';              // 烹饪锅烹饪64分辨率
  static const _ingredientsPath = 'assets/ingredients';             // 原始食材素材
  static const _portableCookerPath = 'assets/portableCooker';       // 便携锅烹饪

  //========== 食材分类 ==========//

  /// 火源烹饪
  static const asparagusCooked = Ingredient(
      id: 'asparagus_cooked',
      imageAsset: '$_campfirePath/asparagus_cooked.png',
      displayName: '烤芦笋'
  );
  static const barnacleCooked = Ingredient(
      id: 'barnacle_cooked',
      imageAsset: '$_campfirePath/barnacle_cooked.png',
      displayName: '熟藤壶'
  );
  static const batnoseCooked = Ingredient(
      id: 'batnose_cooked',
      imageAsset: '$_campfirePath/batnose_cooked.png',
      displayName: '炭烤鼻孔'
  );
  static const batwingCooked = Ingredient(
    id: 'batwing_cooked',
      imageAsset: '$_campfirePath/batwing_cooked.png',
      displayName: '熟蝙蝠翅膀'
  );
  static const berriesCooked = Ingredient(
    id: 'berries_cooked',
      imageAsset: '$_campfirePath/berries_cooked.png',
      displayName: '烤浆果'
  );
  static const berriesJuicyCooked = Ingredient(
    id: 'berries_juicy_cooked',
      imageAsset: '$_campfirePath/berries_juicy_cooked.png',
      displayName: '烤多汁浆果'
  );
  static const carrotCooked = Ingredient(
    id: 'carrot_cooked',
      imageAsset: '$_campfirePath/carrot_cooked.png',
      displayName: '烤胡萝卜'
  );
  static const cookedmeat = Ingredient(
    id: 'cookedmeat',
      imageAsset: '$_campfirePath/cookedmeat.png',
      displayName: '熟肉'
  );
  static const cookedmonstermeat = Ingredient(
    id: 'cookedmonstermeat',
      imageAsset: '$_campfirePath/cookedmonstermeat.png',
      displayName: '熟怪物肉'
  );
  static const cookedsmallmeat = Ingredient(
    id: 'cookedsmallmeat',
      imageAsset: '$_campfirePath/cookedsmallmeat.png',
      displayName: '熟小肉'
  );
  static const cornCooked = Ingredient(
    id: 'corn_cooked',
      imageAsset: '$_campfirePath/corn_cooked.png',
      displayName: '爆米花'
  );
  static const dragonfruitCooked = Ingredient(
    id: 'dragonfruit_cooked',
      imageAsset: '$_campfirePath/dragonfruit_cooked.png',
      displayName: '熟火龙果'
  );
  static const drumstickCooked = Ingredient(
    id: 'drumstick_cooked',
      imageAsset: '$_campfirePath/drumstick_cooked.png',
      displayName: '炸鸟腿'
  );
  static const durianCooked = Ingredient(
    id: 'durian_cooked',
      imageAsset: '$_campfirePath/durian_cooked.png',
      displayName: '超臭榴莲'
  );
  static const eggplantCooked = Ingredient(
    id: 'eggplant_cooked',
      imageAsset: '$_campfirePath/eggplant_cooked.png',
      displayName: '烤茄子'
  );
  static const fishMeatCooked = Ingredient(
    id: 'fish_meat_cooked',
      imageAsset: '$_campfirePath/fish_meat_cooked.png',
      displayName: '鱼排'
  );
  static const fishMeatSmallCooked = Ingredient(
    id: 'fish_meat_small_cooked',
      imageAsset: '$_campfirePath/fish_meat_small_cooked.png',
      displayName: '熟小鱼块'
  );
  static const pomegranateCooked = Ingredient(
    id: 'pomegranate_cooked',
      imageAsset: '$_campfirePath/pomegranate_cooked.png',
      displayName: '切片熟石榴'
  );
  static const potatoCooked = Ingredient(
    id: 'potato_cooked',
      imageAsset: '$_campfirePath/potato_cooked.png',
      displayName: '烤土豆'
  );
  static const pumpkinCooked = Ingredient(
    id: 'pumpkin_cooked',
      imageAsset: '$_campfirePath/pumpkin_cooked.png',
      displayName: '烤南瓜'
  );
  static const watermelonCooked = Ingredient(
    id: 'watermelon_cooked',
      imageAsset: '$_campfirePath/watermelon_cooked.png',
      displayName: '烤西瓜'
  );

  /// 火源烹饪64分辨率
  static const asparagusCooked64 = Ingredient(
      id: 'asparagus_cooked_64',
      imageAsset: '$_campfire64Path/asparagus_cooked_64.png',
      displayName: '烤芦笋'
  );
  static const barnacleCooked64 = Ingredient(
      id: 'barnacle_cooked_64',
      imageAsset: '$_campfire64Path/barnacle_cooked_64.png',
      displayName: '熟藤壶'
  );
  static const batnoseCooked64 = Ingredient(
      id: 'batnose_cooked_64',
      imageAsset: '$_campfire64Path/batnose_cooked_64.png',
      displayName: '炭烤鼻孔'
  );
  static const batwingCooked64 = Ingredient(
      id: 'batwing_cooked_64',
      imageAsset: '$_campfire64Path/batwing_cooked_64.png',
      displayName: '熟蝙蝠翅膀'
  );
  static const berriesCooked64 = Ingredient(
      id: 'berries_cooked_64',
      imageAsset: '$_campfire64Path/berries_cooked_64.png',
      displayName: '烤浆果'
  );
  static const berriesJuicyCooked64 = Ingredient(
      id: 'berries_juicy_cooked_64',
      imageAsset: '$_campfire64Path/berries_juicy_cooked_64.png',
      displayName: '烤多汁浆果'
  );
  static const carrotCooked64 = Ingredient(
      id: 'carrot_cooked_64',
      imageAsset: '$_campfire64Path/carrot_cooked_64.png',
      displayName: '烤胡萝卜'
  );
  static const cookedmeat64 = Ingredient(
      id: 'cookedmeat_64',
      imageAsset: '$_campfire64Path/cookedmeat_64.png',
      displayName: '熟肉'
  );
  static const cookedmonstermeat64 = Ingredient(
      id: 'cookedmonstermeat_64',
      imageAsset: '$_campfire64Path/cookedmonstermeat_64.png',
      displayName: '熟怪物肉'
  );
  static const cookedsmallmeat64 = Ingredient(
      id: 'cookedsmallmeat_64',
      imageAsset: '$_campfire64Path/cookedsmallmeat_64.png',
      displayName: '熟小肉'
  );
  static const cornCooked64 = Ingredient(
      id: 'corn_cooked_64',
      imageAsset: '$_campfire64Path/corn_cooked_64.png',
      displayName: '爆米花'
  );
  static const dragonfruitCooked64 = Ingredient(
      id: 'dragonfruit_cooked_64',
      imageAsset: '$_campfire64Path/dragonfruit_cooked_64.png',
      displayName: '熟火龙果'
  );
  static const drumstickCooked64 = Ingredient(
      id: 'drumstick_cooked_64',
      imageAsset: '$_campfire64Path/drumstick_cooked_64.png',
      displayName: '炸鸟腿'
  );
  static const durianCooked64 = Ingredient(
      id: 'durian_cooked_64',
      imageAsset: '$_campfire64Path/durian_cooked_64.png',
      displayName: '超臭榴莲'
  );
  static const eggplantCooked64 = Ingredient(
      id: 'eggplant_cooked_64',
      imageAsset: '$_campfire64Path/eggplant_cooked_64.png',
      displayName: '烤茄子'
  );
  static const fishMeatCooked64 = Ingredient(
      id: 'fish_meat_cooked_64',
      imageAsset: '$_campfire64Path/fish_meat_cooked_64.png',
      displayName: '鱼排'
  );
  static const fishMeatSmallCooked64 = Ingredient(
      id: 'fish_meat_small_cooked_64',
      imageAsset: '$_campfire64Path/fish_meat_small_cooked_64.png',
      displayName: '熟小鱼块'
  );
  static const froglegsCooked64 = Ingredient(
      id: 'froglegs_cooked_64',
      imageAsset: '$_campfire64Path/froglegs_cooked_64.png',
      displayName: '熟蛙腿'
  );
  static const meatDried64 = Ingredient(
      id: 'meat_dried_64',
      imageAsset: '$_campfire64Path/meat_dried_64.png',
      displayName: '肉干'
  );
  static const monstermeatDried64 = Ingredient(
      id: 'monstermeat_dried_64',
      imageAsset: '$_campfire64Path/monstermeat_dried_64.png',
      displayName: '怪物肉干'
  );
  static const onionCooked64 = Ingredient(
      id: 'onion_cooked_64',
      imageAsset: '$_campfire64Path/onion_cooked_64.png',
      displayName: '烤洋葱'
  );
  static const pepperCooked64 = Ingredient(
      id: 'pepper_cooked_64',
      imageAsset: '$_campfire64Path/pepper_cooked_64.png',
      displayName: '烤辣椒'
  );
  static const plantmeatCooked64 = Ingredient(
      id: 'plantmeat_cooked_64',
      imageAsset: '$_campfire64Path/plantmeat_cooked_64.png',
      displayName: '熟叶肉'
  );
  static const pomegranateCooked64 = Ingredient(
      id: 'pomegranate_cooked_64',
      imageAsset: '$_campfire64Path/pomegranate_cooked_64.png',
      displayName: '切片熟石榴'
  );
  static const potatoCooked64 = Ingredient(
      id: 'potato_cooked_64',
      imageAsset: '$_campfire64Path/potato_cooked_64.png',
      displayName: '烤土豆'
  );
  static const pumpkinCooked64 = Ingredient(
      id: 'pumpkin_cooked_64',
      imageAsset: '$_campfire64Path/pumpkin_cooked_64.png',
      displayName: '烤南瓜'
  );
  static const smallmeat_dried64 = Ingredient(
      id: 'smallmeat_dried_64',
      imageAsset: '$_campfire64Path/smallmeat_dried_64.png',
      displayName: '小风干肉'
  );
  static const tomato_cooked64 = Ingredient(
      id: 'tomato_cooked_64',
      imageAsset: '$_campfire64Path/tomato_cooked_64.png',
      displayName: '烤番茄'
  );
  static const watermelonCooked64 = Ingredient(
      id: 'watermelon_cooked_64',
      imageAsset: '$_campfire64Path/watermelon_cooked_64.png',
      displayName: '烤西瓜'
  );

  ///烹饪锅烹饪
  static const meatballs = Ingredient(
      id: 'meatballs',
      imageAsset: '$_crockPotPath/meatballs.png',
      displayName: '肉丸'
  );
  static const turkeydinner = Ingredient(
      id: 'turkeydinner',
      imageAsset: '$_crockPotPath/turkeydinner.png',
      displayName: '火鸡正餐'
  );

  ///烹饪锅烹饪64分辨率
  static const asparagussoup64 = Ingredient(
      id: 'asparagussoup_64',
      imageAsset: '$_crockPot64Path/asparagussoup_64.png',
      displayName: '芦笋汤'
  );
  static const barnaclepita64 = Ingredient(
      id: 'barnaclepita_64',
      imageAsset: '$_crockPot64Path/barnaclepita_64.png',
      displayName: '藤壶皮塔饼'
  );
  static const barnaclestuffedfishhead64 = Ingredient(
      id: 'barnaclestuffedfishhead_64',
      imageAsset: '$_crockPot64Path/barnaclestuffedfishhead_64.png',
      displayName: '酿鱼头'
  );
  static const barnaclesushi64 = Ingredient(
      id: 'barnaclesushi_64',
      imageAsset: '$_crockPot64Path/barnaclesushi_64.png',
      displayName: '藤壶握寿司'
  );
  static const barnaclinguine64 = Ingredient(
      id: 'barnaclinguine_64',
      imageAsset: '$_crockPot64Path/barnaclinguine_64.png',
      displayName: '藤壶中细面'
  );
  static const batnosehat64 = Ingredient(
      id: 'batnosehat_64',
      imageAsset: '$_crockPot64Path/batnosehat_64.png',
      displayName: '牛奶帽'
  );
  static const dragonchilisalad64 = Ingredient(
      id: 'dragonchilisalad_64',
      imageAsset: '$_crockPot64Path/dragonchilisalad_64.png',
      displayName: '辣龙椒沙拉'
  );
  static const dragonpie64 = Ingredient(
      id: 'dragonpie_64',
      imageAsset: '$_crockPot64Path/dragonpie_64.png',
      displayName: '火龙果派'
  );
  static const fishtacos64 = Ingredient(
      id: 'fishtacos_64',
      imageAsset: '$_crockPot64Path/fishtacos_64.png',
      displayName: '鱼肉玉米卷'
  );
  static const gazpacho64 = Ingredient(
      id: 'gazpacho_64',
      imageAsset: '$_crockPot64Path/gazpacho_64.png',
      displayName: '芦笋冷汤'
  );
  static const leafloaf64 = Ingredient(
      id: 'leafloaf_64',
      imageAsset: '$_crockPot64Path/leafloaf_64.png',
      displayName: '叶肉糕'
  );
  static const leafymeatburger64 = Ingredient(
      id: 'leafymeatburger_64',
      imageAsset: '$_crockPot64Path/leafymeatburger_64.png',
      displayName: '素食堡'
  );
  static const leafymeatsouffle64 = Ingredient(
      id: 'leafymeatsouffle_64',
      imageAsset: '$_crockPot64Path/leafymeatsouffle_64.png',
      displayName: '果冻沙拉'
  );
  static const mashedpotatoes64 = Ingredient(
      id: 'mashedpotatoes_64',
      imageAsset: '$_crockPot64Path/mashedpotatoes_64.png',
      displayName: '奶油土豆泥'
  );
  static const meatysalad64 = Ingredient(
      id: 'meatysalad_64',
      imageAsset: '$_crockPot64Path/meatysalad_64.png',
      displayName: '牛肉绿叶菜'
  );
  static const monsterlasagna64 = Ingredient(
      id: 'monsterlasagna_64',
      imageAsset: '$_crockPot64Path/monsterlasagna_64.png',
      displayName: '怪物千层饼'
  );
  static const nightmarepie64 = Ingredient(
      id: 'nightmarepie_64',
      imageAsset: '$_crockPot64Path/nightmarepie_64.png',
      displayName: '恐怖国王饼'
  );
  static const potatosouffle64 = Ingredient(
      id: 'potatosouffle_64',
      imageAsset: '$_crockPot64Path/potatosouffle_64.png',
      displayName: '蓬松土豆蛋奶酥'
  );
  static const potatotornado64 = Ingredient(
      id: 'potatotornado_64',
      imageAsset: '$_crockPot64Path/potatotornado_64.png',
      displayName: '花式回旋块茎'
  );
  static const powcake64 = Ingredient(
      id: 'powcake_64',
      imageAsset: '$_crockPot64Path/powcake_64.png',
      displayName: '芝士蛋糕'
  );
  static const pumpkincookie64 = Ingredient(
      id: 'pumpkincookie_64',
      imageAsset: '$_crockPot64Path/pumpkincookie_64.png',
      displayName: '南瓜饼干'
  );
  static const stuffedeggplant64 = Ingredient(
      id: 'stuffedeggplant_64',
      imageAsset: '$_crockPot64Path/stuffedeggplant_64.png',
      displayName: '酿茄子'
  );
  static const turkeydinner64 = Ingredient(
      id: 'turkeydinner_64',
      imageAsset: '$_crockPot64Path/turkeydinner_64.png',
      displayName: '火鸡正餐'
  );
  static const vegstinger64 = Ingredient(
      id: 'vegstinger_64',
      imageAsset: '$_crockPot64Path/vegstinger_64.png',
      displayName: '蔬菜鸡尾酒'
  );
  static const watermelonicle64 = Ingredient(
      id: 'watermelonicle_64',
      imageAsset: '$_crockPot64Path/watermelonicle_64.png',
      displayName: '西瓜冰棍'
  );

  ///原始食材素材
  static const acorn = Ingredient(
      id: 'acorn',
      imageAsset: '$_ingredientsPath/acorn.png',
      displayName: '桦栗果'
  );
  static const ancientfruitNightvision = Ingredient(
      id: 'ancientfruit_nightvision',
      imageAsset: '$_ingredientsPath/ancientfruit_nightvision.png',
      displayName: '夜莓'
  );
  static const asparagus = Ingredient(
      id: 'asparagus',
      imageAsset: '$_ingredientsPath/asparagus.png',
      displayName: '芦笋'
  );
  static const barnacle = Ingredient(
      id: 'barnacle',
      imageAsset: '$_ingredientsPath/barnacle.png',
      displayName: '藤壶'
  );
  static const batnose = Ingredient(
      id: 'batnose',
      imageAsset: '$_ingredientsPath/batnose.png',
      displayName: '裸露鼻孔'
  );
  static const batwing = Ingredient(
      id: 'batwing',
      imageAsset: '$_ingredientsPath/batwing.png',
      displayName: '洞穴蝙蝠翅膀'
  );
  static const berries = Ingredient(
      id: 'berries',
      imageAsset: '$_ingredientsPath/berries.png',
      displayName: '浆果'
  );
  static const berriesJuicy = Ingredient(
      id: 'berries_juicy',
      imageAsset: '$_ingredientsPath/berries_juicy.png',
      displayName: '多汁浆果'
  );
  static const birdEgg = Ingredient(
      id: 'bird_egg',
      imageAsset: '$_ingredientsPath/bird_egg.png',
      displayName: '鸟蛋'
  );
  static const blueCap = Ingredient(
      id: 'blue_cap',
      imageAsset: '$_ingredientsPath/blue_cap.png',
      displayName: '采摘的蓝蘑菇'
  );
  static const boneshard = Ingredient(
      id: 'boneshard',
      imageAsset: '$_ingredientsPath/boneshard.png',
      displayName: '骨头碎片'
  );
  static const bullkelpRoot = Ingredient(
      id: 'bullkelp_root',
      imageAsset: '$_ingredientsPath/bullkelp_root.png',
      displayName: '公牛海带茎'
  );
  static const butter = Ingredient(
      id: 'butter',
      imageAsset: '$_ingredientsPath/butter.png',
      displayName: '黄油'
  );
  static const butterflywings = Ingredient(
      id: 'butterflywings',
      imageAsset: '$_ingredientsPath/butterflywings.png',
      displayName: '蝴蝶翅膀'
  );
  static const cactusFlower = Ingredient(
      id: 'cactus_flower',
      imageAsset: '$_ingredientsPath/cactus_flower.png',
      displayName: '仙人掌花'
  );
  static const cactusMeat = Ingredient(
      id: 'cactus_meat',
      imageAsset: '$_ingredientsPath/cactus_meat.png',
      displayName: '仙人掌肉'
  );
  static const carnivalGametoken = Ingredient(
      id: 'carnival_gametoken',
      imageAsset: '$_ingredientsPath/carnival_gametoken.png',
      displayName: '鸦年华代币'
  );
  static const carnivalPrizeticket = Ingredient(
      id: 'carnival_prizeticket',
      imageAsset: '$_ingredientsPath/carnival_prizeticket.png',
      displayName: '奖票'
  );
  static const carrot = Ingredient(
      id: 'carrot',
      imageAsset: '$_ingredientsPath/carrot.png',
      displayName: '胡萝卜'
  );
  static const caveBanana = Ingredient(
      id: 'cave_banana',
      imageAsset: '$_ingredientsPath/cave_banana.png',
      displayName: '香蕉'
  );
  static const corn = Ingredient(
      id: 'corn',
      imageAsset: '$_ingredientsPath/corn.png',
      displayName: '玉米'
  );
  static const cutlichen = Ingredient(
      id: 'cutlichen',
      imageAsset: '$_ingredientsPath/cutlichen.png',
      displayName: '苔藓'
  );
  static const dragonfruit = Ingredient(
      id: 'dragonfruit',
      imageAsset: '$_ingredientsPath/dragonfruit.png',
      displayName: '火龙果'
  );
  static const drumstick = Ingredient(
      id: 'drumstick',
      imageAsset: '$_ingredientsPath/drumstick.png',
      displayName: '鸟腿'
  );
  static const durian = Ingredient(
      id: 'durian',
      imageAsset: '$_ingredientsPath/durian.png',
      displayName: '榴莲'
  );
  static const eel = Ingredient(
      id: 'eel',
      imageAsset: '$_ingredientsPath/eel.png',
      displayName: '鳗鱼'
  );
  static const eggplant = Ingredient(
      id: 'eggplant',
      imageAsset: '$_ingredientsPath/eggplant.png',
      displayName: '茄子'
  );
  static const fishmeat = Ingredient(
      id: 'fishmeat',
      imageAsset: '$_ingredientsPath/fishmeat.png',
      displayName: '生鱼肉'
  );
  static const fishmeatSmall = Ingredient(
      id: 'fishmeat_small',
      imageAsset: '$_ingredientsPath/fishmeat_small.png',
      displayName: '小鱼块'
  );
  static const froglegs = Ingredient(
      id: 'froglegs',
      imageAsset: '$_ingredientsPath/froglegs.png',
      displayName: '蛙腿'
  );
  static const garlic = Ingredient(
      id: 'garlic',
      imageAsset: '$_ingredientsPath/garlic.png',
      displayName: '大蒜'
  );
  static const goatmilk = Ingredient(
      id: 'goatmilk',
      imageAsset: '$_ingredientsPath/goatmilk.png',
      displayName: '带电的羊奶'
  );
  static const greenCap = Ingredient(
      id: 'green_cap',
      imageAsset: '$_ingredientsPath/green_cap.png',
      displayName: '采摘的绿蘑菇'
  );
  static const halloweencandy = Ingredient(
      id: 'halloweencandy',
      imageAsset: '$_ingredientsPath/halloweencandy.png',
      displayName: '熔岩椒'
  );
  static const honey = Ingredient(
      id: 'honey',
      imageAsset: '$_ingredientsPath/honey.png',
      displayName: '蜂蜜'
  );
  static const honeycomb = Ingredient(
      id: 'honeycomb',
      imageAsset: '$_ingredientsPath/honeycomb.png',
      displayName: '蜜脾'
  );
  static const humanmeat = Ingredient(
      id: 'humanmeat',
      imageAsset: '$_ingredientsPath/humanmeat.png',
      displayName: '长猪'
  );
  static const ice = Ingredient(
      id: 'ice',
      imageAsset: '$_ingredientsPath/ice.png',
      displayName: '冰'
  );
  static const kelp = Ingredient(
      id: 'kelp',
      imageAsset: '$_ingredientsPath/kelp.png',
      displayName: '海带叶'
  );
  static const lightbulb = Ingredient(
      id: 'lightbulb',
      imageAsset: '$_ingredientsPath/lightbulb.png',
      displayName: '荧光果'
  );
  static const lightninggoathorn = Ingredient(
      id: 'lightninggoathorn',
      imageAsset: '$_ingredientsPath/lightninggoathorn.png',
      displayName: '伏特羊角'
  );
  static const lureplantbulb = Ingredient(
      id: 'lureplantbulb',
      imageAsset: '$_ingredientsPath/lureplantbulb.png',
      displayName: '食人花种子'
  );
  static const mandrake = Ingredient(
      id: 'mandrake',
      imageAsset: '$_ingredientsPath/mandrake.png',
      displayName: '曼德拉草'
  );
  static const meat = Ingredient(
      id: 'meat',
      imageAsset: '$_ingredientsPath/meat.png',
      displayName: '肉'
  );
  static const monstermeat = Ingredient(
      id: 'monstermeat',
      imageAsset: '$_ingredientsPath/monstermeat.png',
      displayName: '怪物肉'
  );
  static const nightmarefuel = Ingredient(
      id: 'nightmarefuel',
      imageAsset: '$_ingredientsPath/nightmarefuel.png',
      displayName: '噩梦燃料'
  );
  static const oceanfishMedium5Inv = Ingredient(
      id: 'oceanfish_medium_5_inv',
      imageAsset: '$_ingredientsPath/oceanfish_medium_5_inv.png',
      displayName: '玉米鳕鱼'
  );
  static const oceanfishMedium8Inv = Ingredient(
      id: 'oceanfish_medium_8_inv',
      imageAsset: '$_ingredientsPath/oceanfish_medium_8_inv.png',
      displayName: '冰鲷鱼'
  );
  static const oceanfishSmall5Inv = Ingredient(
      id: 'oceanfish_small_5_inv',
      imageAsset: '$_ingredientsPath/oceanfish_small_5_inv.png',
      displayName: '爆米花鱼'
  );
  static const onion = Ingredient(
      id: 'onion',
      imageAsset: '$_ingredientsPath/onion.png',
      displayName: '洋葱'
  );
  static const pepper = Ingredient(
      id: 'pepper',
      imageAsset: '$_ingredientsPath/pepper.png',
      displayName: '辣椒'
  );
  static const perdlingCrow = Ingredient(
      id: 'perdling_crow',
      imageAsset: '$_ingredientsPath/perdling_crow.png',
      displayName: '小乌鸦'
  );
  static const phlegm = Ingredient(
      id: 'phlegm',
      imageAsset: '$_ingredientsPath/phlegm.png',
      displayName: '脓鼻涕'
  );
  static const pinecone = Ingredient(
      id: 'pinecone',
      imageAsset: '$_ingredientsPath/pinecone.png',
      displayName: '松果'
  );
  static const plantmeat = Ingredient(
      id: 'plantmeat',
      imageAsset: '$_ingredientsPath/plantmeat.png',
      displayName: '叶肉'
  );
  static const pomegranate = Ingredient(
      id: 'pomegranate',
      imageAsset: '$_ingredientsPath/pomegranate.png',
      displayName: '石榴'
  );
  static const pondeel = Ingredient(
      id: 'pondeel',
      imageAsset: '$_ingredientsPath/pondeel.png',
      displayName: '活鳗鱼'
  );
  static const pondfish = Ingredient(
      id: 'pondfish',
      imageAsset: '$_ingredientsPath/pondfish.png',
      displayName: '淡水鱼'
  );
  static const potato = Ingredient(
      id: 'potato',
      imageAsset: '$_ingredientsPath/potato.png',
      displayName: '土豆'
  );
  static const pumpkin = Ingredient(
      id: 'pumpkin',
      imageAsset: '$_ingredientsPath/pumpkin.png',
      displayName: '南瓜'
  );
  static const redCap = Ingredient(
      id: 'red_cap',
      imageAsset: '$_ingredientsPath/red_cap.png',
      displayName: '采摘的红蘑菇'
  );
  static const royalJelly = Ingredient(
      id: 'royal_jelly',
      imageAsset: '$_ingredientsPath/royal_jelly.png',
      displayName: '蜂王浆'
  );
  static const salmon = Ingredient(
      id: 'salmon',
      imageAsset: '$_ingredientsPath/salmon.png',
      displayName: '三文鱼'
  );
  static const saltrock = Ingredient(
      id: 'saltrock',
      imageAsset: '$_ingredientsPath/saltrock.png',
      displayName: '盐晶'
  );
  static const smallmeat = Ingredient(
      id: 'smallmeat',
      imageAsset: '$_ingredientsPath/smallmeat.png',
      displayName: '小肉'
  );
  static const spoiledFish = Ingredient(
      id: 'spoiled_fish',
      imageAsset: '$_ingredientsPath/spoiled_fish.png',
      displayName: '变质的鱼'
  );
  static const spoiledFishSmall = Ingredient(
      id: 'spoiled_fish_small',
      imageAsset: '$_ingredientsPath/spoiled_fish_small.png',
      displayName: '变质的小鱼块'
  );
  static const tallbirdegg = Ingredient(
      id: 'tallbirdegg',
      imageAsset: '$_ingredientsPath/tallbirdegg.png',
      displayName: '高脚鸟蛋'
  );
  static const tomato = Ingredient(
      id: 'tomato',
      imageAsset: '$_ingredientsPath/tomato.png',
      displayName: '番茄'
  );
  static const twigs = Ingredient(
      id: 'twigs',
      imageAsset: '$_ingredientsPath/twigs.png',
      displayName: '树枝'
  );
  static const watermelon = Ingredient(
      id: 'watermelon',
      imageAsset: '$_ingredientsPath/watermelon.png',
      displayName: '西瓜'
  );
  static const wobsterShellerLand = Ingredient(
      id: 'wobster_sheller_land',
      imageAsset: '$_ingredientsPath/wobster_sheller_land.png',
      displayName: '龙虾'
  );
  static const wormlight = Ingredient(
      id: 'wormlight',
      imageAsset: '$_ingredientsPath/wormlight.png',
      displayName: '发光浆果'
  );
  static const wormlightLesser = Ingredient(
      id: 'wormlight_lesser',
      imageAsset: '$_ingredientsPath/wormlight_lesser.png',
      displayName: '小发光浆果'
  );

  ///便携锅烹饪
  static const bonesoup = Ingredient(
      id: 'bonesoup',
      imageAsset: '$_portableCookerPath/bonesoup.png',
      displayName: '骨头汤'
  );
  static const dragonchilisalad = Ingredient(
      id: 'dragonchilisalad',
      imageAsset: '$_portableCookerPath/dragonchilisalad.png',
      displayName: '辣龙椒沙拉'
  );
  static const freshfruitcrepes = Ingredient(
      id: 'freshfruitcrepes',
      imageAsset: '$_portableCookerPath/freshfruitcrepes.png',
      displayName: '鲜果可丽饼'
  );
  static const frogfishbowl = Ingredient(
      id: 'frogfishbowl',
      imageAsset: '$_portableCookerPath/frogfishbowl.png',
      displayName: '蓝带鱼排'
  );
  static const gazpacho = Ingredient(
      id: 'gazpacho',
      imageAsset: '$_portableCookerPath/gazpacho.png',
      displayName: '芦笋冷汤'
  );
  static const glowberrymousse = Ingredient(
      id: 'glowberrymousse',
      imageAsset: '$_portableCookerPath/glowberrymousse.png',
      displayName: '发光浆果慕斯'
  );
  static const monstertartare = Ingredient(
      id: 'monstertartare',
      imageAsset: '$_portableCookerPath/monstertartare.png',
      displayName: '怪物鞑靼'
  );
  static const moqueca = Ingredient(
      id: 'moqueca',
      imageAsset: '$_portableCookerPath/moqueca.png',
      displayName: '海鲜杂烩'
  );
  static const nightmarepie = Ingredient(
      id: 'nightmarepie',
      imageAsset: '$_portableCookerPath/nightmarepie.png',
      displayName: '恐怖国王饼'
  );
  static const potatosouffle = Ingredient(
      id: 'potatosouffle',
      imageAsset: '$_portableCookerPath/potatosouffle.png',
      displayName: '蓬松土豆蛋奶酥'
  );
  static const voltgoatjelly = Ingredient(
      id: 'voltgoatjelly',
      imageAsset: '$_portableCookerPath/voltgoatjelly.png',
      displayName: '伏特羊肉冻'
  );

  //========== 映射表（按需添加） ==========//
  static const List<Ingredient> all = [
  asparagusCooked,
  barnacleCooked,
  batnoseCooked,
  batwingCooked,
  berriesCooked,
  berriesJuicyCooked,
  carrotCooked,
  cookedmeat,
  cookedmonstermeat,
  cookedsmallmeat,
  cornCooked,
  dragonfruitCooked,
  drumstickCooked,
  durianCooked,
  eggplantCooked,
  fishMeatCooked,
  fishMeatSmallCooked,
  pomegranateCooked,
  potatoCooked,
  pumpkinCooked,
  watermelonCooked,
  asparagusCooked64,
  barnacleCooked64,
  batnoseCooked64,
  batwingCooked64,
  berriesCooked64,
  berriesJuicyCooked64,
  carrotCooked64,
  cookedmeat64,
  cookedmonstermeat64,
  cookedsmallmeat64,
  cornCooked64,
  dragonfruitCooked64,
  drumstickCooked64,
  durianCooked64,
  eggplantCooked64,
  fishMeatCooked64,
  fishMeatSmallCooked64,
  froglegsCooked64,
  meatDried64,
  monstermeatDried64,
  onionCooked64,
  pepperCooked64,
  plantmeatCooked64,
  pomegranateCooked64,
  potatoCooked64,
  pumpkinCooked64,
  smallmeat_dried64,
  tomato_cooked64,
  watermelonCooked64,
  meatballs,
  turkeydinner,
  asparagussoup64,
  barnaclepita64,
  barnaclestuffedfishhead64,
  barnaclesushi64,
  barnaclinguine64,
  batnosehat64,
  dragonchilisalad64,
  dragonpie64,
  fishtacos64,
  gazpacho64,
  leafloaf64,
  leafymeatburger64,
  leafymeatsouffle64,
  mashedpotatoes64,
  meatysalad64,
  monsterlasagna64,
  nightmarepie64,
  potatosouffle64,
  potatotornado64,
  powcake64,
  pumpkincookie64,
  stuffedeggplant64,
  turkeydinner64,
  vegstinger64,
  watermelonicle64,
  acorn,
  ancientfruitNightvision,
  asparagus,
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
  fishmeat,
  fishmeatSmall,
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
  monstermeat,
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
  royalJelly,
  salmon,
  saltrock,
  smallmeat,
  spoiledFish,
  spoiledFishSmall,
  tallbirdegg,
  tomato,
  twigs,
  watermelon,
  wobsterShellerLand,
  wormlight,
  wormlightLesser,
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

  // 食材映射表 (id -> Ingredient)
  static late final Map<String, Ingredient> ingredients = {
    for (final ing in all) ing.id: ing,
  };

  // 角色映射表 (id -> Character)
  static late final Map<String, Character> characters = {
    for (final char in Character.values) char.id: char,
  };

  //========== 解析方法 ==========//
  /// 根据 id 查找图片路径（优先食材，再角色，最后尝试通用路径）
  static String getImagePath(String id) {
    // 1. 查找食材
    if (ingredients.containsKey(id)) {
      return ingredients[id]!.imageAsset;
    }
    // 2. 查找角色
    if (characters.containsKey(id)) {
      return characters[id]!.imageAsset;
    }
    // 3. 通用图片（如道具、UI元素）
    return 'assets/other/$id.png'; // 自定义兜底规则
  }

}

