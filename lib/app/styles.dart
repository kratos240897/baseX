import 'dart:ui';

class Styles {
  Styles._();
  static Styles? _instance;
  factory Styles() {
    if (_instance == null) {
      _instance = Styles._();
    }
    return _instance!;
  }
  static const kPrimaryColor = Color(0xff93C572);
  final kPrimaryColorLight = kPrimaryColor.withAlpha(80);
}
