// import 'package:currency_converter/main.dart';
import 'package:currency_converter/services/currencyAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:currency_converter/screens/mainPage.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Currency _currency = new Currency();

  void initialPlayer() async {
    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currency.saveData();
    initialPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 200),
          SpinKitFadingCube(
            color: Colors.white,
            size: 80,
          ),
          Padding(              
            padding: EdgeInsets.only(top: 200),
            child: Text(
              'Developed by Xyber',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontSize: 20
              ),
            ),
          )
        ],
      )
    );
  }
}