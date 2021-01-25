import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {

  static String sharedPreferenceRedCurrencyValueKey = "REDCURRENCYVALUE";
  static String sharedPreferenceRedCurrencyKey = "REDCURRENCY";
  static String sharedPreferenceRedCurrencyCountryKey = "REDCURRENCYCOUNTRY";


  static String sharedPreferenceWhiteCurrencyValueKey = "WHITECURRENCYVALUE";
  static String sharedPreferenceWhiteCurrencyKey = "WHITECURRENCY";
  static String sharedPreferenceWhiteCurrencyCountryKey = "WHITECURRENCYCOUNTRY";

  static String sharedPreferenceCurrencyMapJsonDataKey = "CURRENCYMAP";

  static String sharedPreferenceOpenKey = "OPENKEY";

  // *******************
  /* SET FUNCTIONS */
  // *******************

  // This is for saving the currency value
  Future<void> saveRedCurrencyValue(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceRedCurrencyValueKey, value);
  }

  Future<void> saveWhiteCurrencyValue(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceWhiteCurrencyValueKey, value);
  }


  // This is for saving the currency according to abbreviation
  Future<void> saveRedCurrency(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceRedCurrencyKey, value);
  }

  Future<void> saveWhiteCurrency(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceWhiteCurrencyKey, value);
  }

  // This is for saving the currency according to nation
  Future<void> saveRedCurrencyCountry(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceRedCurrencyCountryKey, value);
  }

  Future<void> saveWhiteCurrencyCountry(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceWhiteCurrencyCountryKey, value);
  }

  // This set function is for the intro page bool
  Future<void> saveOpened(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(sharedPreferenceOpenKey, value);
  }


  // This set function is for the currency Data Json
  Future<void> saveCurrencyMapJsonData(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceCurrencyMapJsonDataKey, value);
  }






  // *******************
  /* GET FUNCTIONS */
  // *******************

  // This get function is for the currency values
  Future<String> getRedCurrencyValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceRedCurrencyValueKey);
  }

  Future<String> getWhiteCurrencyValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceWhiteCurrencyValueKey);
  }


  // This get function is for the currency abbreviations
  Future<String> getRedCurrency() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceRedCurrencyKey);
  }

  Future<String> getWhiteCurrency() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceWhiteCurrencyKey);
  }


  // This get function is for the currency according to nations
  Future<String> getRedCurrencyCountry() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceRedCurrencyCountryKey);
  }

  Future<String> getWhiteCurrencyCountry() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceWhiteCurrencyCountryKey);
  }


  // This get function is for the  intro bool
  Future<bool> getOpened() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(sharedPreferenceOpenKey);
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