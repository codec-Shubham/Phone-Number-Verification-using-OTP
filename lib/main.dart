import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp_veri/myhome.dart';
import 'package:otp_veri/phone.dart';
import 'otp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'phone',
    routes: {
      'phone': (context) => MyPhone(),
      'otp': (context) => Myotp(),
      'home':(context) => MyHome(),
    },
  ));
}
