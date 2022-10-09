import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 15,left: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to Home Page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),textAlign: TextAlign.center,),
          Text("Your Number is Successfully Verified!!",style: TextStyle(fontSize: 17)),
          ],
        ),
      )
    );
  }
}
