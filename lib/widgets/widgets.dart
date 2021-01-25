import 'package:currency_converter/helper/constants.dart';
import 'package:flutter/material.dart';

currencyList(context, Color color1, Color color2, bool isRed, bool up) {
  return Container(
    height: MediaQuery.of(context).size.height / 1.135,
    
    child: ShaderMask(
      shaderCallback: (Rect rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.purple, Colors.transparent, Colors.transparent, Colors.purple],
          stops: [0.0, 0.04, 0.98, 1.0], // 10% purple, 80% transparent, 10% purple
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        
        children: [
          nameWidget("Canadian Dollar", "CAD", color1, color2, isRed, context, up),
          nameWidget("Hong Kong Dollar", "HKD", color1, color2, isRed, context, up),
          nameWidget("Icelandic Króna", "ISK", color1, color2, isRed, context, up),
          nameWidget("Philippine Peso", "PHP", color1, color2, isRed, context, up),
          nameWidget("Danish Krone", "DKK", color1, color2, isRed, context, up),
          nameWidget("Hungarian Forint", "HUF", color1, color2, isRed, context, up),
          nameWidget("Czech Koruna", "CZK", color1, color2, isRed, context, up),
          nameWidget("British Pound", "GBP", color1, color2, isRed, context, up),
          nameWidget("Romanian Leu", "RON", color1, color2, isRed, context, up),
          nameWidget("Swedish Krona", "SEK", color1, color2, isRed, context, up),
          nameWidget("Indonesian Rupiah", "IDR", color1, color2, isRed, context, up),
          nameWidget("Indian Rupee", "INR", color1, color2, isRed, context, up),
          nameWidget("Brazilian Reais", "BRL", color1, color2, isRed, context, up),
          nameWidget("Russian Ruble", "RUB", color1, color2, isRed, context, up),
          nameWidget("Croatian Kuna", "HRK", color1, color2, isRed, context, up),
          nameWidget("Japanese yen", "JPY", color1, color2, isRed, context, up),
          nameWidget("Thai Baht", "THB", color1, color2, isRed, context, up),
          nameWidget("Swiss Franc", "CHF", color1, color2, isRed, context, up),
          nameWidget("Euro", "EUR", color1, color2, isRed, context, up),
          nameWidget("Malaysian Ringgit", "MYR", color1, color2, isRed, context, up),
          nameWidget("Bulgarian Lev", "BGN", color1, color2, isRed, context, up),
          nameWidget("Turkish Lira", "TRY", color1, color2, isRed, context, up),
          nameWidget("Chinese Renminbi", "CNY", color1, color2, isRed, context, up),
          nameWidget("Norwegian Krone", "NOK", color1, color2, isRed, context, up),
          nameWidget("New Zealand Dollar", "NZD", color1, color2, isRed, context, up),
          nameWidget("South African Rand", "ZAR", color1, color2, isRed, context, up),
          nameWidget("United States Dollar", "USD", color1, color2, isRed, context, up),
          nameWidget("Mexican Peso", "MXN", color1, color2, isRed, context, up),
          nameWidget("Singapore Dollar", "SGD", color1, color2, isRed, context, up),
          nameWidget("Australian Dollar", "AUD", color1, color2, isRed, context, up),
          nameWidget("Israeli New Shekel", "ILS", color1, color2, isRed, context, up),
          nameWidget("South Korean Won", "KRW", color1, color2, isRed, context, up),
          nameWidget("Polish Zloty", "PLN", color1, color2, isRed, context, up),
        ],
      ),
    ),
  );
}


nameWidget(String countryName, String currency, Color color1, Color color2, bool isRed, context, bool up) {
  return Container(
    padding: EdgeInsets.only(top: 12, bottom: 12),
    child: GestureDetector(
      onTap: () {
        if(isRed) {
          Constants.redCurr = currency;
          Constants.redCountry = countryName;

          // print(up);
          calculate(isRed, up);

          Navigator.pop(context); 
        } else {
          Constants.whiteCurr = currency;
          Constants.whiteCountry = countryName;

          // print(up);
          calculate(isRed, up);

          Navigator.pop(context); 
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,    
        children: [
          Text(
            countryName, 
            overflow: TextOverflow.fade,
            maxLines: 1,
            style: TextStyle(
              color: color1,
              fontSize: 28,
              fontWeight: FontWeight.w700,
              fontFamily: 'Quicksand',),),
          SizedBox(width: 8),
          Text(currency, style: TextStyle(
            color: color2,
            fontSize: 12,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w700
          ),),
        ],
      ),
    ),
  );

  
}


void calculate(bool isRed, bool up) {
  double redFactor = Constants.currencyJson[Constants.redCurr][Constants.whiteCurr];
  double whiteFactor = Constants.currencyJson[Constants.whiteCurr][Constants.redCurr];
  var redCurrencyValue = double.parse(Constants.redCurrency);
  var whiteCurrencyValue = double.parse(Constants.whiteCurrency);

  if(isRed) {
    if(!up) {
      whiteCurrencyValue = redCurrencyValue * redFactor;
      Constants.whiteCurrency = whiteCurrencyValue.toStringAsFixed(2);
    } else {
      redCurrencyValue = whiteCurrencyValue / redFactor;
      Constants.redCurrency = redCurrencyValue.toStringAsFixed(2);
    }
  } else {
    if(up) {
      redCurrencyValue = whiteCurrencyValue * whiteFactor;
      Constants.redCurrency = redCurrencyValue.toStringAsFixed(2);
    } else {
      whiteCurrencyValue = redCurrencyValue / whiteFactor;
      Constants.whiteCurrency = whiteCurrencyValue.toStringAsFixed(2);
    }
  }
}