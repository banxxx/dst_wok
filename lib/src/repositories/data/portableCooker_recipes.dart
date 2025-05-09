import '../../models/recipe_example.dart';
import '../../common/enums/character.dart';
import '../../common/enums/ingredient_tag.dart';
import '../../models/portableCooker_recipe.dart';
import '../constants/game_assets.dart';

/// 预定义的烹饪锅配方数据
/// id: 食物ID
/// name: 食物名称
/// requiredTags: 必须满足的标签条件
/// fillerSlots: 填充位数量
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
var portableCookerRecipe = [
  PortableCookerRecipe(
      id: 'meatballs',
      name: '鲜果可丽饼',
      requiredTags: const {IngredientTag.meat: 0.5},
      fillerSlots: 4,
      priority: 30,
      imageUrl: 'assets/portableCooker/freshfruitcrepes.png',
      health: 60,
      hunger: 150,
      sanity: 15,
      cookTime: '32',
      freshness: '10',
      desc: '只能由沃利[img:Warly]使用[img:portablecookpot]制作',
      favorites: const {Character.Wes},
      sideEffect: '为韦斯[img:Wes]额外恢复 15 饱食度',
      condition: '水果度≥1.5；至少一个黄油[img:butter]，至少一个蜂蜜[img:honey]',
      notContain: '无',
      cookbook: [
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.butter),
          slot2: PositionalIngredient(
              ingredient: GameAssets.honey),
          slot3: PositionalIngredient(
              ingredient: GameAssets.pomegranate),
          slot4: PositionalIngredient(
              ingredient: GameAssets.berries),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.butter),
          slot2: PositionalIngredient(
              ingredient: GameAssets.honey),
          slot3: PositionalIngredient(
              ingredient: GameAssets.wormlight),
          slot4: PositionalIngredient(
              ingredient: GameAssets.berries),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.butter),
          slot2: PositionalIngredient(
              ingredient: GameAssets.honey),
          slot3: PositionalIngredient(
              ingredient: GameAssets.watermelon),
          slot4: PositionalIngredient(
              ingredient: GameAssets.durian),
        )
        // 更多菜谱示例...
      ]
  ),
  PortableCookerRecipe(
      id: 'gazpacho',
      name: '芦笋冷汤',
      requiredTags: const {IngredientTag.meat: 0.5},
      fillerSlots: 4,
      priority: 30,
      imageUrl: 'assets/portableCooker/gazpacho.png',
      health: 25,
      hunger: 3,
      sanity: 10,
      cookTime: '8',
      freshness: '15',
      desc: '只能由沃利[img:Warly]使用[img:portablecookpot]制作',
      favorites: const {Character.Wes},
      sideEffect: '快速降低玩家体温至低于世界温度 40 度，效果持续 5 分钟',
      condition: '至少 2 个芦笋[img:asparagus]/烤芦笋[img:asparagus_cooked_64]，冰度大于等于 2 ',
      notContain: '无',
      cookbook: [
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.asparagus),
          slot2: PositionalIngredient(
              ingredient: GameAssets.asparagusCooked64),
          slot3: PositionalIngredient(
              ingredient: GameAssets.ice),
          slot4: PositionalIngredient(
              ingredient: GameAssets.ice),
        ),
         RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.asparagus),
          slot2: PositionalIngredient(
              ingredient: GameAssets.asparagus),
          slot3: PositionalIngredient(
              ingredient: GameAssets.oceanfishMedium8Inv),
          slot4: PositionalIngredient(
              ingredient: GameAssets.oceanfishMedium8Inv),
        ),
      ]
  ),
  PortableCookerRecipe(
      id: 'bonesoup',
      name: '骨头汤',
      requiredTags: const {IngredientTag.meat: 0.5},
      fillerSlots: 4,
      priority: 30,
      imageUrl: 'assets/portableCooker/bonesoup.png',
      health: 150,
      hunger: 32,
      sanity: 5,
      cookTime: '32',
      freshness: '10',
      desc: '只能由沃利[img:Warly]使用[img:portablecookpot]制作',
      favorites: const {},
      sideEffect: '无',
      condition: '恰好 2 个骨头碎片[img:boneshard]、至少 1 个洋葱[img:onion]/烤洋葱[img:onion_cooked_64]',
      notContain: '不可食用度小于 3 ',
      cookbook: [
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.boneshard),
          slot2: PositionalIngredient(
              ingredient: GameAssets.boneshard),
          slot3: PositionalIngredient(
              ingredient: GameAssets.onion),
          slot4: PositionalIngredient(
              ingredient: GameAssets.berries),
        ),
         RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.boneshard),
          slot2: PositionalIngredient(
              ingredient: GameAssets.boneshard),
          slot3: PositionalIngredient(
              ingredient: GameAssets.onion),
          slot4: PositionalIngredient(
              ingredient: GameAssets.monstermeat),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.boneshard),
          slot2: PositionalIngredient(
              ingredient: GameAssets.boneshard),
          slot3: PositionalIngredient(
              ingredient: GameAssets.onionCooked64),
          slot4: PositionalIngredient(
              ingredient: GameAssets.ice),
        )
        // 更多菜谱示例...
      ]
  ),
  PortableCookerRecipe(
      id: 'frogfishbowl',
      name: '蓝带鱼排',
      requiredTags: {IngredientTag.fish: 1},
      fillerSlots: 4,
      priority: 30,
      imageUrl: 'assets/portableCooker/frogfishbowl.png',
      health: 37.5,
      hunger: 20,
      sanity: -10,
      cookTime: '32',
      freshness: '8',
      desc: '只能由沃利[img:Warly]使用[img:portablecookpot]制作',
      favorites: {},
      sideEffect: '立刻清空玩家的潮湿度，并且维持干燥效果以及免疫酸雨对玩家的扣除血量的效果持续 5 分钟',
      condition: '至少 2 个蛙腿[img:fishmeat]/熟蛙腿[img:froglegs_cooked_64]、鱼度大于等于 1 ；没有不可食用度',
      notContain: '无',
      cookbook: [
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.pondfish),
          slot2: PositionalIngredient(
              ingredient: GameAssets.pondfish),
          slot3: PositionalIngredient(
              ingredient: GameAssets.froglegs),
          slot4: PositionalIngredient(
              ingredient: GameAssets.froglegsCooked64),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.fishmeat),
          slot2: PositionalIngredient(
              ingredient: GameAssets.froglegs),
          slot3: PositionalIngredient(
              ingredient: GameAssets.froglegs),
          slot4: PositionalIngredient(
              ingredient: GameAssets.monstermeat),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.barnacle),
          slot2: PositionalIngredient(
              ingredient: GameAssets.wobsterShellerLand),
          slot3: PositionalIngredient(
              ingredient: GameAssets.froglegs),
          slot4: PositionalIngredient(
              ingredient: GameAssets.froglegs),
        )
        // 更多菜谱示例...
      ]
  ),
  PortableCookerRecipe(
      id: 'monstertartare',
      name: '怪物鞑靼',
      requiredTags: {IngredientTag.monster: 2},
      fillerSlots: 4,
      priority: 30,
      imageUrl: 'assets/portableCooker/monstertartare.png',
      health: 62.5,
      hunger: -20,
      sanity: -20,
      cookTime: '8',
      freshness: '10',
      desc: '只能由沃利[img:Warly]使用[img:portablecookpot]制作',
      favorites: {},
      sideEffect: '',
      condition: '怪物度大于等于 2 ；没有不可食用度',
      notContain: '无',
      cookbook: [
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.monstermeat),
          slot2: PositionalIngredient(
              ingredient: GameAssets.monstermeat),
          slot3: PositionalIngredient(
              ingredient: GameAssets.monstermeat),
          slot4: PositionalIngredient(
              ingredient: GameAssets.monstermeat),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.monstermeat),
          slot2: PositionalIngredient(
              ingredient: GameAssets.monstermeat),
          slot3: PositionalIngredient(
              ingredient: GameAssets.berries),
          slot4: PositionalIngredient(
              ingredient: GameAssets.berries),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.monstermeat),
          slot2: PositionalIngredient(
              ingredient: GameAssets.monstermeat),
          slot3: PositionalIngredient(
              ingredient: GameAssets.royalJelly),
          slot4: PositionalIngredient(
              ingredient: GameAssets.mandrake),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.monstermeat),
          slot2: PositionalIngredient(
              ingredient: GameAssets.monstermeat),
          slot3: PositionalIngredient(
              ingredient: GameAssets.goatmilk),
          slot4: PositionalIngredient(
              ingredient: GameAssets.butter),
        ),
      ]
  ),
  PortableCookerRecipe(
      id: 'glowberrymousse',
      name: '发光浆果慕斯',
      requiredTags: {IngredientTag.fruit: 2},
      fillerSlots: 4,
      priority: 30,
      imageUrl: 'assets/portableCooker/glowberrymousse.png',
      health: 37.5,
      hunger: 3,
      sanity: 10,
      cookTime: '16',
      freshness: '8',
      desc: '只能由沃利[img:Warly]使用[img:portablecookpot]制作',
      favorites: {},
      sideEffect: '食用发光浆果慕斯的角色自身会成为光源提供照明，效果持续 2 天。随着游戏时间进行，照明范围会逐渐缩小',
      condition: '至少 2 个小发光浆果[img:wormlight_lesser]或至少一个发光浆果[img:wormlight]、水果度大于等于 2',
      notContain: '不能有不可食用度和肉度',
      cookbook: [
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.wormlight),
          slot2: PositionalIngredient(
              ingredient: GameAssets.caveBanana),
          slot3: PositionalIngredient(
              ingredient: GameAssets.cutlichen),
          slot4: PositionalIngredient(
              ingredient: GameAssets.cutlichen),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.wormlightLesser),
          slot2: PositionalIngredient(
              ingredient: GameAssets.wormlightLesser),
          slot3: PositionalIngredient(
              ingredient: GameAssets.caveBanana),
          slot4: PositionalIngredient(
              ingredient: GameAssets.cutlichen),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.wormlightLesser),
          slot2: PositionalIngredient(
              ingredient: GameAssets.wormlightLesser),
          slot3: PositionalIngredient(
              ingredient: GameAssets.berries),
          slot4: PositionalIngredient(
              ingredient: GameAssets.berriesJuicy),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.wormlight),
          slot2: PositionalIngredient(
              ingredient: GameAssets.honey),
          slot3: PositionalIngredient(
              ingredient: GameAssets.ice),
          slot4: PositionalIngredient(
              ingredient: GameAssets.durian),
        ),
      ]
  ),
  PortableCookerRecipe(
      id: 'nightmarepie',
      name: '恐怖国王饼',
      requiredTags: {IngredientTag.meat: 0.5},
      fillerSlots: 4,
      priority: 30,
      imageUrl: 'assets/portableCooker/nightmarepie.png',
      health: 25,
      hunger: 1,
      sanity: 5,
      cookTime: '32',
      freshness: '10',
      desc: '只能由沃利[img:Warly]使用[img:portablecookpot]制作\n'
          '装备梦魇护符或骨头头盔后食用恐怖国王饼会导致玩家死亡，旺达[img:Wanda]除外',
      favorites: {Character.Wilson},
      sideEffect: '按比例对调角色的生命值和理智值',
      condition: '恰好 2 个噩梦燃料[img:nightmarefuel]、'
          '1 个洋葱[img:onion]/烤洋葱[img:onion_cooked_64]和 '
          '1 个土豆[img:potato]/烤土豆[img:potato_cooked_64]',
      notContain: '其他食材',
      cookbook: [
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.nightmarefuel),
          slot2: PositionalIngredient(
              ingredient: GameAssets.nightmarefuel),
          slot3: PositionalIngredient(
              ingredient: GameAssets.onion),
          slot4: PositionalIngredient(
              ingredient: GameAssets.potato),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.nightmarefuel),
          slot2: PositionalIngredient(
              ingredient: GameAssets.nightmarefuel),
          slot3: PositionalIngredient(
              ingredient: GameAssets.onionCooked64),
          slot4: PositionalIngredient(
              ingredient: GameAssets.potatoCooked64),
        ),
      ]
  ),
  PortableCookerRecipe(
      id: 'dragonchilisalad',
      name: '辣龙椒沙拉',
      requiredTags: {},
      fillerSlots: 4,
      priority: 30,
      imageUrl: 'assets/portableCooker/dragonchilisalad.png',
      health: 20,
      hunger: -3,
      sanity: 10,
      cookTime: '12',
      freshness: '15',
      desc: '只能由沃利[img:Warly]使用[img:portablecookpot]制作\n'
          '在制作辣龙椒沙拉的原料中放入树枝会产出火龙果派[img:dragonpie_64]而不是辣龙椒沙拉',
      favorites: {},
      sideEffect: '会快速升高玩家体温至高于世界温度 40 度，效果持续 5 分钟',
      condition: '至少有一个火龙果[img:dragonfruit]/熟火龙果[img:dragonfruit_cooked_64]、'
          '至少有一个辣椒[img:pepper]/烤辣椒[img:pepper_cooked_64]',
      notContain: '不能有肉度、不可食用度、蛋度',
      cookbook: [
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.dragonfruit),
          slot2: PositionalIngredient(
              ingredient: GameAssets.pepper),
          slot3: PositionalIngredient(
              ingredient: GameAssets.potato),
          slot4: PositionalIngredient(
              ingredient: GameAssets.watermelon),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.dragonfruitCooked64),
          slot2: PositionalIngredient(
              ingredient: GameAssets.pepperCooked64),
          slot3: PositionalIngredient(
              ingredient: GameAssets.butterflywings),
          slot4: PositionalIngredient(
              ingredient: GameAssets.honey),
        ),
      ]
  ),
  PortableCookerRecipe(
      id: 'moqueca',
      name: '海鲜杂烩',
      requiredTags: {},
      fillerSlots: 4,
      priority: 30,
      imageUrl: 'assets/portableCooker/moqueca.png',
      health: 112.5,
      hunger: 60,
      sanity: 33,
      cookTime: '32',
      freshness: '8',
      desc: '只能由沃利[img:Warly]使用[img:portablecookpot]制作',
      favorites: {},
      sideEffect: '无',
      condition: '鱼度大于 0 ，至少有 1 个洋葱[img:onion]/烤洋葱[img:onion_cooked_64]，'
          '至少有 1 个番茄[img:tomato]/烤番茄[img:tomato_cooked_64]',
      notContain: '不能有不可食用度',
      cookbook: [
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.pondfish),
          slot2: PositionalIngredient(
              ingredient: GameAssets.onion),
          slot3: PositionalIngredient(
              ingredient: GameAssets.tomato),
          slot4: PositionalIngredient(
              ingredient: GameAssets.honey),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.barnacle),
          slot2: PositionalIngredient(
              ingredient: GameAssets.onion),
          slot3: PositionalIngredient(
              ingredient: GameAssets.tomato),
          slot4: PositionalIngredient(
              ingredient: GameAssets.monstermeat),
        ),
      ]
  ),
  PortableCookerRecipe(
      id: 'voltgoatjelly',
      name: '伏特羊肉冻',
      requiredTags: {},
      fillerSlots: 4,
      priority: 30,
      imageUrl: 'assets/portableCooker/voltgoatjelly.png',
      health: 37.5,
      hunger: 3,
      sanity: 10,
      cookTime: '32',
      freshness: '10',
      desc: '只能由沃利[img:Warly]使用[img:portablecookpot]制作',
      favorites: {},
      sideEffect: '食用伏特羊肉冻后，玩家的所有攻击都将具有“带电”标签，持续 5 分钟',
      condition: '甜味剂度大于等于 2 、至少 1 个伏特羊角[img:lightninggoathorn]',
      notContain: '无',
      cookbook: [
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.lightninggoathorn),
          slot2: PositionalIngredient(
              ingredient: GameAssets.honey),
          slot3: PositionalIngredient(
              ingredient: GameAssets.honey),
          slot4: PositionalIngredient(
              ingredient: GameAssets.honey),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.lightninggoathorn),
          slot2: PositionalIngredient(
              ingredient: GameAssets.honey),
          slot3: PositionalIngredient(
              ingredient: GameAssets.honey),
          slot4: PositionalIngredient(
              ingredient: GameAssets.twigs),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.lightninggoathorn),
          slot2: PositionalIngredient(
              ingredient: GameAssets.honey),
          slot3: PositionalIngredient(
              ingredient: GameAssets.honey),
          slot4: PositionalIngredient(
              ingredient: GameAssets.ice),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.lightninggoathorn),
          slot2: PositionalIngredient(
              ingredient: GameAssets.honey),
          slot3: PositionalIngredient(
              ingredient: GameAssets.honey),
          slot4: PositionalIngredient(
              ingredient: GameAssets.nightmarefuel),
        ),
      ]
  ),
  PortableCookerRecipe(
      id: 'potatosouffle',
      name: '蓬松土豆蛋奶酥',
      requiredTags: {},
      fillerSlots: 4,
      priority: 30,
      imageUrl: 'assets/portableCooker/potatosouffle.png',
      health: 37.5,
      hunger: 20,
      sanity: 15,
      cookTime: '32',
      freshness: '10',
      desc: '只能由沃利[img:Warly]使用[img:portablecookpot]制作',
      favorites: {},
      sideEffect: '无',
      condition: '至少有 2 个土豆[img:potato]/烤土豆[img:potato_cooked_64]、蛋度大于 0 ',
      notContain: '不能有肉度、不可食用度',
      cookbook: [
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.potato),
          slot2: PositionalIngredient(
              ingredient: GameAssets.potato),
          slot3: PositionalIngredient(
              ingredient: GameAssets.birdEgg),
          slot4: PositionalIngredient(
              ingredient: GameAssets.ice),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.potato),
          slot2: PositionalIngredient(
              ingredient: GameAssets.potato),
          slot3: PositionalIngredient(
              ingredient: GameAssets.birdEgg),
          slot4: PositionalIngredient(
              ingredient: GameAssets.butterflywings),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.potato),
          slot2: PositionalIngredient(
              ingredient: GameAssets.potatoCooked64),
          slot3: PositionalIngredient(
              ingredient: GameAssets.birdEgg),
          slot4: PositionalIngredient(
              ingredient: GameAssets.berries),
        ),
      ]
  ),
];