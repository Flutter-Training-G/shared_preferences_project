import 'package:shared_preferences/shared_preferences.dart';

const _keyCounter = 'counter';

class CounterStore {
  static late final SharedPreferences _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static void storeCounter(int counter) async {
    await _pref.setInt(_keyCounter, counter);
  }

  static int retrieveCounter() {
    return _pref.getInt(_keyCounter) ?? 0;
  }
}
