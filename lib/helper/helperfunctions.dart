import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {

  static String sharedPreferenceRedKey = "REDCURRENCY";
  static String sharedPreferenceWhiteKey = "WHITECURRENCY";
  static String sharedPreferenceCurrencyMapJsonDataKey = "CURRENCYMAP";

  // *******************
  /* SET FUNCTIONS */
  // *******************

  Future<void> saveRedCurrency(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceRedKey, value);
  }

  Future<void> saveWhiteCurrency(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceWhiteKey, value);
  }


  // This set function is for the currency Data Json
  Future<void> saveCurrencyMapJsonData(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceCurrencyMapJsonDataKey, value);
  }




  // *******************
  /* GET FUNCTIONS */
  // *******************

  Future<String> getRedCurrency() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceRedKey);
  }

  Future<String> getWhiteCurrency() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceWhiteKey);
  }


  // This get function is for the currency Data Json
  Future<String> getCurrencyMapJsonData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceCurrencyMapJsonDataKey);
  }




  // **********************
  // !!!!!!!!DANGER!!!!!!!!
  // **********************
  void deleteData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}