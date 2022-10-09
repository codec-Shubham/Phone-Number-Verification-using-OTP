import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);
  static String verify = "";

  @override
  _MyPhoneState createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countrycode =  TextEditingController();
  var phone;

  @override
  void initState() {
    countrycode.text="+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.only(left: 25,right: 25),
        padding: EdgeInsets.all(30),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/img1.png",width: 150,height: 130),
              SizedBox(height: 15),
              Text("Phone Verification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,),
              SizedBox(height:2),
              Text("We need to register your phone before getting started !",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.center,),
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1,style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(children: [
                  SizedBox(width: 40,child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: countrycode,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  )),
                  Text("|",style: TextStyle(fontWeight: FontWeight.w100,fontSize: 30,color: Colors.grey)),
                  SizedBox(width: 10),
                  Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                          onChanged: (value){
                            phone=value;},

                          decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone",
                      ),)),
                ],),
              ),
              SizedBox(height: 28),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(onPressed: () async{
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '${countrycode.text+phone}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      MyPhone.verify=verificationId;
                      Navigator.pushNamed(context, "otp" );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                  Navigator.pushNamed(context, "otp" );}, child: Text("Send the Code"),style: ElevatedButton.styleFrom(
                  primary: Colors.green.shade500,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
