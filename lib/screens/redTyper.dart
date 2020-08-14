import 'package:flutter/material.dart';

class RedBackGround extends StatefulWidget {
  @override
  _RedBackGroundState createState() => _RedBackGroundState();
}

class _RedBackGroundState extends State<RedBackGround> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: Center(
          child: IconButton(
            icon: Icon(Icons.arrow_drop_up),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}