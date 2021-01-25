import 'dart:convert';
import 'package:currency_converter/helper/constants.dart';
import 'package:currency_converter/helper/helperfunctions.dart';
import 'package:currency_converter/screens/redCurrencyName.dart';
import 'package:currency_converter/screens/redTyper.dart';
import 'package:currency_converter/screens/whiteCurrencyName.dart';
import 'package:currency_converter/screens/whiteTyper.dart';
import 'package:currency_converter/services/currencyAPI.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  bool up = true;
  bool usdToInr = true;
  bool save = false;

  Currency _currency = new Currency();




  // Helper Functions (Shared Preference)
  getRedCurrency() async {
    String redCurrencyValue = await HelperFunctions().getRedCurrencyValue();
    String redCurr = await HelperFunctions().getRedCurrency();
    String redCountry = await HelperFunctions().getRedCurrencyCountry();

    // print("Red currency : $redCurrencyValue");
    // print("Red curr : $redCurr");
    // print("Red currencyCountry : $redCountry");

    if(redCurrencyValue == null || redCurr == null || redCountry == null) {
      redCurrencyValue = "0.00";
      redCurr = "USD";
      redCountry = "United States Dollar";
    }

    setState(() {
      Constants.redCurrency = redCurrencyValue;
      Constants.redCurr = redCurr;
      Constants.redCountry = redCountry;
    });
  }

  getWhiteCurrency() async {
    String whiteCurrencyValue = await HelperFunctions().getWhiteCurrencyValue();
    String whiteCurr = await HelperFunctions().getWhiteCurrency();
    String whiteCountry = await HelperFunctions().getWhiteCurrencyCountry();

    // print("White currency : $whiteCurrencyValue");
    // print("White curr : $whiteCurr");
    // print("White currencyCountry : $whiteCountry");

    if(whiteCurrencyValue == null || whiteCurr == null || whiteCountry == null) {
      whiteCurrencyValue = "0.00";
      whiteCurr = "INR";
      whiteCountry = "Indian Rupee";
    }

    setState(() {
      Constants.whiteCurrency = whiteCurrencyValue;
      Constants.whiteCurr = whiteCurr;
      Constants.whiteCountry = whiteCountry;
    });
  }



  Future<bool> getCurrencyData(Map data) async {
    dynamic jsonData = await HelperFunctions().getCurrencyMapJsonData();
    Map response;
    bool flag = true;


    if(jsonData != null) {
      response = json.decode(jsonData);
      flag = false;
    }
    Constants.currencyJson = response;


    // Calling the data once again just to update the currencies
    _currency.saveData();

    return flag;
  }

  checkCurrencyData() async {
    bool dataFlag = await getCurrencyData(Constants.currencyJson);
    if(dataFlag == false) {
      _currency.saveData();
      getCurrencyData(Constants.currencyJson);
    } else {
      getCurrencyData(Constants.currencyJson);
    }
  }




  // Animation Tween
  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 1.5
  );
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150)
    );

    checkCurrencyData();
    getRedCurrency();
    getWhiteCurrency();

    super.initState();
  }



  // UI of the main page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [

                // The Red Container
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  color: Colors.red,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            print(Constants.redCurr);
                            print(Constants.redCountry);                          
                            print(Constants.currencyJson[Constants.redCurr][Constants.whiteCurr]);

                            Navigator.push(
                              context,
                              PageTransition(
                                child: RedCurrency(up: up,),
                                type: PageTransitionType.upToDown,
                                duration: Duration(milliseconds: 200)
                              )
                            );                        
                          },
                          child: Text(
                            "${Constants.redCountry}",
                            style: TextStyle(
                                color: Colors.white70,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w700,
                                fontSize: 25),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${Constants.currencySymbols[Constants.redCurr]}",
                                style: TextStyle(
                                    color: Colors.red[200],
                                    fontSize: 30,
                                    fontWeight: FontWeight.w300)),
                            GestureDetector(
                              onTap: !usdToInr ? () => Navigator.push(
                                  context,
                                  PageTransition(
                                    child: RedBackGround(),
                                    type: PageTransitionType.upToDown,
                                    duration: Duration(milliseconds: 200)
                                  )) :
                                  () {
                                    up = !up;
                                    usdToInr = !usdToInr;
                                    _animationController.forward();
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: RedBackGround(),
                                        type: PageTransitionType.upToDown,
                                        duration: Duration(milliseconds: 200)
                                    ));
                                  },
                              child: Text(
                                  Constants.redCurrency == null ? "0.00" : Constants.redCurrency,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Quicksand',
                                      fontSize: 70,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        GestureDetector( 
                          onTap: () => Navigator.push(
                            context,
                            PageTransition(
                              child: RedCurrency(up: up,),
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: Duration(milliseconds: 200)
                            )
                          ),                                             
                          child: Text(
                            "${Constants.redCurr}",
                            style: TextStyle(
                                  color: Colors.red[200],
                                  fontFamily: 'Quicksand',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),

                // The White Container
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector( 
                          onTap: () => Navigator.push(
                            context,
                            PageTransition(
                              child: WhiteCurrency(up: up,),
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: Duration(milliseconds: 200)
                            )
                          ),                                             
                          child: Text(
                            "${Constants.whiteCurr}",
                            style: TextStyle(
                                  color: Colors.red[200],
                                  fontFamily: 'Quicksand',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${Constants.currencySymbols[Constants.whiteCurr]}",
                                style: TextStyle(
                                    color: Colors.red[200],
                                    fontSize: 30,
                                    fontWeight: FontWeight.w300)),                           
                            GestureDetector(
                              onTap: usdToInr ? () => Navigator.push(
                                  context,
                                  PageTransition(
                                    child: WhiteBackGround(),
                                    type: PageTransitionType.downToUp,
                                    duration: Duration(milliseconds: 200)
                                  )) :
                                  () {
                                    up = !up;
                                    usdToInr = !usdToInr;
                                    _animationController.reverse();
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: WhiteBackGround(),
                                        type: PageTransitionType.downToUp,
                                        duration: Duration(milliseconds: 200)
                                    ));
                                  },
                              child: Text(
                                  Constants.whiteCurrency == null ? "0.00" : Constants.whiteCurrency,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Quicksand',
                                      fontSize: 70,
                                      fontWeight: FontWeight.bold)),
                            )                  
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            print(Constants.whiteCurr);
                            print(Constants.whiteCountry);
                            print(Constants.currencyJson[Constants.whiteCurr][Constants.redCurr]);

                            Navigator.push(
                              context,
                              PageTransition(
                                child: WhiteCurrency(up: up,),
                                type: PageTransitionType.rightToLeftWithFade,
                                duration: Duration(milliseconds: 200)
                              )
                            ); 
                          },
                          child: Text(
                            "${Constants.whiteCountry}",
                            style: TextStyle(
                                color: Colors.red[300],
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w700,
                                fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            // The Arrow Container
            RotationTransition(
              turns: turnsTween.animate(_animationController),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if(up) {
                      _animationController.forward();
                    } else {
                      _animationController.reverse();
                    }

                    // Setting the bool for convertion
                    if(!usdToInr) {
                      usdToInr = true;
                    } else {
                      usdToInr = false;
                    }

                    up = !up; 
                    // usdToInr = !usdToInr;
                    
                  });
                  // print(usdToInr);
                  // print(Constants.redCurrency);            
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.red, width: 10),
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: Icon(
                      Icons.arrow_upward,
                      color: Colors.red,
                      size: 90,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
