import 'dart:convert';
import 'package:http/http.dart';

class Currency {

  Map<String, Map<String, dynamic>> currencyData = new Map();

  List<String> currencyAbbreviations = [
    "CAD", "HKD", "ISK", "PHP", "DKK", "HUF", "CZK", "GBP", "RON", "SEK", "IDR", "INR", "BRL",
    "RUB", "HRK", "JPY", "THB", "CHF", "EUR", "MYR", "BGN", "TRY", "CNY", "NOK", "NZD", "ZAR",
     "USD", "MXN", "SGD", "AUD", "ILS", "KRW", "PLN"
  ];


  Future<void> getData() async {
    try {


      /* *************
      Example of API call
      ************* */

      // Response response = await get("https://api.exchangeratesapi.io/latest?base=$curr");
      // Map data = jsonDecode(response.body);
      
      // print(data['rates'].keys);


      for(int i = 0; i < currencyAbbreviations.length; i++) {

        Response response = await get("https://api.exchangeratesapi.io/latest?base=${currencyAbbreviations[i]}"); 
        Map data = jsonDecode(response.body);

        // print(data['rates']);
        // print(' ');

        currencyData[currencyAbbreviations[i]] = data['rates'];

      }

      
    } catch (e){
      print(e.toString());
    }
  }

  Future<void> getlen() async {
    await getData();

    var jsonData = json.encode(currencyData);
    print(jsonData);

    // print(currencyData['INR']);
  }
}