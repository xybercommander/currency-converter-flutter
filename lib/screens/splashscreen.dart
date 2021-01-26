// import 'package:currency_converter/main.dart';
import 'package:currency_converter/helper/helperfunctions.dart';
import 'package:currency_converter/services/currencyAPI.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/screens/mainPage.dart';
import 'package:flare_dart/actor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:currency_converter/helper/constants.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Currency _currency = new Currency();
  bool opened = true;

  void initialPlayer(bool opened) async {
    Future.delayed(Duration(seconds: opened ? 4 : 12), () {
      Navigator.pushReplacement(
        context, 
        PageTransition(
          child: MainPage(),
          type: PageTransitionType.rightToLeftWithFade,
          duration: Duration(milliseconds: 500)
        )
      );
    });
  }

  void saveInitOpen() async {
    print(opened);
    bool value = await HelperFunctions().getOpened();
    if(value == false || value == null) {
      HelperFunctions().saveOpened(opened);
      opened = false;
      // initialPlayer(opened);
    } else {
      opened = true;
      // initialPlayer(opened);
    }

    print(opened);
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currency.saveData();
    saveInitOpen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,        
        children: <Widget>[          
          Center(
            child: Container(
              height: 350,
              width: 350,            
              child: FlareActor('assets/animation/intro-xyber.flr', animation: 'intro',),
            ),
          ),
          Padding(              
            padding: EdgeInsets.only(top: 50),
            child: Text(
              'Developed by Xyber',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontSize: 30,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w700
              ),
            ),
          )
        ],
      )
    );
  }
}