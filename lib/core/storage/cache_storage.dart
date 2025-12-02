import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences _sharedPrefs;

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  void clearAll() {
    _sharedPrefs.clear();
  }

  bool get firstTime => _sharedPrefs.getBool('firstTime') ?? true;

  set firstTime(bool value) {
    _sharedPrefs.setBool('firstTime', value);
  }

  bool get offlineMode => _sharedPrefs.getBool('offlineMode') ?? true;

  set offlineMode(bool value) {
    _sharedPrefs.setBool('offlineMode', value);
  }

  bool get isUserInLagos => _sharedPrefs.getBool('isUserInLagos') ?? true;

  set isUserInLagos(bool value) {
    _sharedPrefs.setBool('isUserInLagos', value);
  }

  String get accessToken => _sharedPrefs.getString('accessToken') ?? '';

  set accessToken(String value) {
    _sharedPrefs.setString('accessToken', value);
  }

  String get offlineTickets =>
      _sharedPrefs.getString('offlineTickets') ?? '';

  set offlineTickets(String value) {
    _sharedPrefs.setString('offlineTickets', value);
  }

  void clearStorage(String key) {
    _sharedPrefs.remove(key);
  }

  void clearCart() {
    _sharedPrefs.remove('cartItem');
  }
}
