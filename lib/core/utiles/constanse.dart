class Constanse {
  factory Constanse() {
    return _instance;
  }
  Constanse._internal();
  static final Constanse _instance = Constanse._internal();
  static const kCartBox = 'CartBox';
  static const kSavedBox = 'SavedBox';
}
