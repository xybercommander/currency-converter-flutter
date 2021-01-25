import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {

  static String sharedPreferenceRedCurrencyValueKey = "REDCURRENCYVALUE";
  static String sharedPreferenceRedCurrency = "REDCURRENCY";
  static String sharedPreferenceRedCurrencyCountry = "REDCURRENCYCOUNTRY";


  static String sharedPreferenceWhiteCurrencyValueKey = "WHITECURRENCYVALUE";
  static String sharedPreferenceWhiteCurrency = "WHITECURRENCY";
  static String sharedPreferenceWhiteCurrencyCountry = "WHITECURRENCYCOUNTRY";

  static String sharedPreferenceCurrencyMapJsonDataKey = "CURRENCYMAP";

  // *******************
  /* SET FUNCTIONS */
  // *******************

  Future<void> saveRedCurrencyValue(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceRedCurrencyValueKey, value);
  }

  Future<void> saveWhiteCurrencyValue(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceWhiteCurrencyValueKey, value);
  }


  // This set function is for the currency Data Json
  Future<void> saveCurrencyMapJsonData(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceCurrencyMapJsonDataKey, value);
  }






  // *******************
  /* GET FUNCTIONS */
  // *******************

  Future<String> getRedCurrencyValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceRedCurrencyValueKey);
  }

  Future<String> getWhiteCurrencyValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceWhiteCurrencyValueKey);
  }


  // This get function is for the currency Data Json
  Future<String> getCurrencyMapJsonData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String value = '';
    value = preferences.getString(sharedPreferenceCurrencyMapJsonDataKey);
    if(value != '') {
      print("Got data!");
    } else {
      print("FAILED TO GET DATA");
    }
    return value;
  }




  // **********************
  // !!!!!!!!DANGER!!!!!!!!
  // **********************
  void deleteData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}