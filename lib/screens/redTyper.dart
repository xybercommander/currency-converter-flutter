import 'package:currency_converter/helper/constants.dart';
import 'package:currency_converter/helper/helperfunctions.dart';
import 'package:flutter/material.dart';

class RedBackGround extends StatefulWidget {
  @override
  _RedBackGroundState createState() => _RedBackGroundState();
}

class _RedBackGroundState extends State<RedBackGround> {

  String output = "";
  int decimal = 1;

  addTextToTheOutput(String number) {
    setState(() {

      if(number == '.' && decimal == 0) {
        decimal++;
        output += number;
      } else if(number == '.' && decimal > 0) {
        print("Decimal is already there!");
      } else {
        output += number;
      }

    });
  }

  Widget numberButtons(String number) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.red[300],
        borderRadius: BorderRadius.circular(50)
      ),
      child: RawMaterialButton(
        onPressed: () {
          addTextToTheOutput(number);
        },
        child: Text(number, style: TextStyle(color: Colors.white54, fontSize: 17),),
        shape: CircleBorder(),
      )
    );
  }

  Widget doneButton() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.red[300],
        borderRadius: BorderRadius.circular(50)
      ),
      child: RawMaterialButton(
        onPressed: () {
          setState(() {
            Constants.redCurrency = output;
            Constants.whiteCurrency = convUsdToInr(output);          
          });

          // Saving the data
          HelperFunctions().saveWhiteCurrency(Constants.whiteCurrency);
          HelperFunctions().saveRedCurrency(Constants.redCurrency);
          print("saved");

          Navigator.pop(context);
        },
        child: Icon(Icons.check, color: Colors.white54,),
        shape: CircleBorder(),
      )
    );
  }


  String convUsdToInr(String dollar) {
    var usd = double.parse(dollar);
    var inr = usd * 72.98;
    return inr.toStringAsFixed(2);
  }



  // UI OF THE SCREEN
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[ 
            /*1*/           
            Container(              
              height: 30,
              width: 180,
              child: RawMaterialButton(
                onPressed: () {
                  setState(() {
                    output = "";
                    decimal = 0;
                  });
                },
                child: Text("tap to delete", style: TextStyle(color: Colors.red[200]),),
              ),
            ),
            /*2*/
            Container(
              height: 90,
              width: MediaQuery.of(context).size.width - 30,              
              child: Center(
                child: Text(
                  "$output", 
                  style: TextStyle(
                    fontSize: 40, 
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
            ),
            /*3*/
            Container(
              height: MediaQuery.of(context).size.height / 2,              
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberButtons("1"),
                      numberButtons("2"),
                      numberButtons("3")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberButtons("4"),
                      numberButtons("5"),
                      numberButtons("6")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberButtons("7"),
                      numberButtons("8"),
                      numberButtons("9")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberButtons("."),
                      numberButtons("0"),
                      doneButton()
                    ],
                  ),
                  Center(
                    child: IconButton(
                      icon: Icon(Icons.arrow_upward, color: Colors.white,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}