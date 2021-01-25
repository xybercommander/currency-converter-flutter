import 'package:flutter/material.dart';

currencyList(context, Color color1, Color color2) {
  return Container(
    height: MediaQuery.of(context).size.height / 1.135,
    
    child: ListView(
      scrollDirection: Axis.vertical,
      children: [
        nameWidget("Canadian Dollar", "CAD", color1, color2),
        nameWidget("Hong Kong Dollar", "HKD", color1, color2),
        nameWidget("Icelandic Króna", "ISK", color1, color2),
        nameWidget("Philippine Peso", "PHP", color1, color2),
        nameWidget("Danish Krone", "DKK", color1, color2),
        nameWidget("Hungarian Forint", "HUF", color1, color2),
        nameWidget("Czech Koruna", "CZK", color1, color2),
        nameWidget("British Pound", "GBP", color1, color2),
        nameWidget("Romanian Leu", "RON", color1, color2),
        nameWidget("Swedish Krona", "SEK", color1, color2),
        nameWidget("Indonesian Rupiah", "IDR", color1, color2),
        nameWidget("Indian Rupee", "INR", color1, color2),
        nameWidget("Brazilian Reais", "BRL", color1, color2),
        nameWidget("Russian Ruble", "RUB", color1, color2),
        nameWidget("Croatian Kuna", "HRK", color1, color2),
        nameWidget("Japanese yen", "JPY", color1, color2),
        nameWidget("Thai Baht", "THB", color1, color2),
        nameWidget("Swiss Franc", "CHF", color1, color2),
        nameWidget("Euro", "EUR", color1, color2),
        nameWidget("Malaysian Ringgit", "MYR", color1, color2),
        nameWidget("Bulgarian Lev", "BGN", color1, color2),
        nameWidget("Turkish Lira", "TRY", color1, color2),
        nameWidget("Chinese Renminbi", "CNY", color1, color2),
        nameWidget("Norwegian Krone", "NOK", color1, color2),
        nameWidget("New Zealand Dollar", "NZD", color1, color2),
        nameWidget("South African Rand", "ZAR", color1, color2),
        nameWidget("United States Dollar", "USD", color1, color2),
        nameWidget("Mexican Peso", "MXN", color1, color2),
        nameWidget("Singapore Dollar", "SGD", color1, color2),
        nameWidget("Australian Dollar", "AUD", color1, color2),
        nameWidget("Israeli New Shekel", "ILS", color1, color2),
        nameWidget("South Korean Won", "KRW", color1, color2),
        nameWidget("Polish Zloty", "PLN", color1, color2),
      ],
    ),
  );
}


nameWidget(String countryName, String currency, Color color1, Color color2) {
  return Container(
    padding: EdgeInsets.only(top: 12, bottom: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,    
      children: [
        Text(countryName, style: TextStyle(
          color: color1,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          fontFamily: 'Quicksand'
        ),),
        SizedBox(width: 8),
        Text(currency, style: TextStyle(
          color: color2,
          fontSize: 12,
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.w700
        ),),
      ],
    ),
  );

  
}