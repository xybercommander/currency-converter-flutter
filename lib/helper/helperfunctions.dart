import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {

  static String sharedPreferenceRedKey = "REDCURRENCY";
  static String sharedPreferenceWhiteKey = "WHITECURRENCY";

  /* SET FUNCTIONS */
  Future<void> saveRedCurrency(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceRedKey, value);
  }

  Future<void> saveWhiteCurrency(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceWhiteKey, value);
  }

  /* GET FUNCTIONS */
  Future<String> getRedCurrency() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceRedKey);
  }

  Future<String> getWhiteCurrency() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceWhiteKey);
  }

}