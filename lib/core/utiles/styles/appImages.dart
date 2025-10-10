class AppImages {
  factory AppImages() {
    return _instance;
  }
  AppImages._internal();
  static final AppImages _instance = AppImages._internal();
  static const String login = "assets/images/login/logIn.jpeg";
  static const List<String> authMethods = [
    "assets/images/login/google.svg",
    "assets/images/login/facebook.svg",
  ];
  static const String signUp = "assets/images/signUp/signUp.png";
  static const String forgetPass = "assets/images/forgetPass/forgetPass.png";
  static const String verify = "assets/images/forgetPass/verify.png";
  static const String resetPass = "assets/images/forgetPass/reset.png";
  static const String success = "assets/images/signUp/Success.json";
  static const List<String> bottomNavBar = [
    "assets/images/home/home.svg",
    "assets/images/home/market.svg",
    "assets/images/home/cart.svg",
    "assets/images/home/profile.svg",
  ];
  static const String freeCall = "assets/images/home/callCenter.png";

  static const List<String> servicesImages = [
    'https://casamiatours.com/wp-content/uploads/2021/03/Schermata-2021-03-19-alle-19.31.44-600x449.png',
    'https://cdn.mos.cms.futurecdn.net/JvzbiCvazp3sDdrGA6EzYV.jpg',
    'https://www.estesperformanceconcaves.com/wp-content/uploads/2020/05/manufacturing-of-farming-equipment.png',
    'https://explorerdubailtd.com/bahrain/wp-content/uploads/sites/13/2023/04/Hire-Ugandan-Farm-Workers-1024x683.jpg',
    'https://guyanachronicle.com/wp-content/uploads/elementor/thumbs/Shade-house-qv3o6xz94jx1thb6hvfkm0xp7551aldsyhhfe0ka26.jpg',
    'https://thumbs.dreamstime.com/b/farmer-using-precision-organic-pest-control-equipment-lush-farm-crops-use-natural-substances-avoiding-chemical-299984446.jpg',
  ];
}
