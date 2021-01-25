import 'package:currency_converter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WhiteCurrency extends StatefulWidget {
  @override
  _WhiteCurrencyState createState() => _WhiteCurrencyState();
}

class _WhiteCurrencyState extends State<WhiteCurrency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        padding: EdgeInsets.only(top: 40, left: 20),
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,          
          children: [        
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.keyboard_backspace, color: Colors.red, size: 35,),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
            currencyList(context, Colors.red, Colors.red[200])
          ],
        ),
      ),

    );
  }
}