/// 人物数据枚举类
enum Character {
  Walter(
    id: 'Walter',
    displayName: '沃尔特',
    imageAsset: 'assets/characters/Walter.png',
  ),
  Wanda(
    id: 'Wanda',
    displayName: '旺达',
    imageAsset: 'assets/characters/Wanda.png',
  ),
  Warly(
    id: 'Warly',
    displayName: '沃利',
    imageAsset: 'assets/characters/Warly.png',
  ),
  Waxwell(
    id: 'Waxwell',
    displayName: '麦斯威尔',
    imageAsset: 'assets/characters/Waxwell.png',
  ),
  Webber(
    id: 'Webber',
    displayName: '韦伯',
    imageAsset: 'assets/characters/Webber.png',
  ),
  Wendy(
    id: 'Wendy',
    displayName: '温蒂',
    imageAsset: 'assets/characters/Wendy.png',
  ),
  Wes(
    id: 'Wes',
    displayName: '韦斯',
    imageAsset: 'assets/characters/Wes.png',
  ),
  Wickerbottom(
    id: 'Wickerbottom',
    displayName: '薇克巴顿',
    imageAsset: 'assets/characters/Wickerbottom.png',
  ),
  Wigfrid(
    id: 'Wigfrid',
    displayName: '薇格弗德',
    imageAsset: 'assets/characters/Wigfrid.png',
  ),
  Willow(
    id: 'Willow',
    displayName: '薇洛',
    imageAsset: 'assets/characters/Willow.png',
  ),
  Wilson(
    id: 'Wilson',
    displayName: '威尔逊',
    imageAsset: 'assets/characters/Wilson.png',
  ),
  Winona(
    id: 'Winona',
    displayName: '薇诺娜',
    imageAsset: 'assets/characters/Winona.png',
  ),
  Wolfgang(
    id: 'Wolfgang',
    displayName: '沃尔夫冈',
    imageAsset: 'assets/characters/Wolfgang.png',
  ),
  Wonkey(
    id: 'Wonkey',
    displayName: '芜猴',
    imageAsset: 'assets/characters/Wonkey.png',
  ),
  Woodie(
    id: 'Woodie',
    displayName: '伍迪',
    imageAsset: 'assets/characters/Woodie.png',
  ),
  Wormwood(
    id: 'Wormwood',
    displayName: '沃姆伍德',
    imageAsset: 'assets/characters/Wormwood.png',
  ),
  Wortox(
    id: 'Wortox',
    displayName: '沃拓克斯',
    imageAsset: 'assets/characters/Wortox.png',
  ),
  Wurt(
    id: 'Wurt',
    displayName: '沃特',
    imageAsset: 'assets/characters/Wurt.png',
  ),
  WX_78(
    id: 'WX_78',
    displayName: 'WX-78',
    imageAsset: 'assets/characters/WX-78.png',
  ),
  // 其他人物按相同格式添加...
  ;

  // 枚举值构造函数
  const Character({
    required this.id,
    required this.displayName,
    required this.imageAsset,
  });

  // id
  final String id;

  // 显示用名称
  final String displayName;

  // 图片资源路径
  final String imageAsset;

  // 通过字符串名称获取枚举值
  static Character? fromString(String name) {
    try {
      return values.firstWhere(
            (e) => e.name == name.toLowerCase(),
      );
    } catch (_) {
      return null; // 找不到时返回null
    }
  }
}