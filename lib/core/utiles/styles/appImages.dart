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
}
