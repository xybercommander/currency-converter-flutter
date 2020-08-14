import 'package:flutter/material.dart';

class WhiteBackGround extends StatefulWidget {
  @override
  _WhiteBackGroundState createState() => _WhiteBackGroundState();
}

class _WhiteBackGroundState extends State<WhiteBackGround> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
      ),
    );
  }
}