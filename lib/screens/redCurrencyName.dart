import 'package:currency_converter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RedCurrency extends StatefulWidget {

  final bool up;
  const RedCurrency ({Key key, this.up}): super(key: key);

  @override  
  _RedCurrencyState createState() => _RedCurrencyState();
}

class _RedCurrencyState extends State<RedCurrency> {
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
        color: Colors.red,
        padding: EdgeInsets.only(top: 40, left: 20),
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,          
          children: [        
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.keyboard_backspace, color: Colors.white, size: 35,),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
            currencyList(context, Colors.white, Colors.red[200], true, widget.up)
          ],
        ),
      ),
    );
  }
}