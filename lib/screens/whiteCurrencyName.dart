import 'package:currency_converter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WhiteCurrency extends StatefulWidget {

  final bool up;
  const WhiteCurrency ({Key key, this.up}): super(key: key);

  @override
  _WhiteCurrencyState createState() => _WhiteCurrencyState();
}

class _WhiteCurrencyState extends State<WhiteCurrency> {
  @override
  Widget build(BuildContext context) {

    // Fixing the apps orientaion in Potrait Mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

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
            currencyList(context, Colors.red, Colors.red[200], false, widget.up)
          ],
        ),
      ),

    );
  }
}