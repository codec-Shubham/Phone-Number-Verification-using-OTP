import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_veri/phone.dart';
import 'package:pinput/pinput.dart';

class Myotp extends StatefulWidget {
  @override
  _MyotpState createState() => _MyotpState();
}

class _MyotpState extends State<Myotp> {
  final FirebaseAuth auth  = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    var code = "";
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios,color: Colors.black),
        ),
      ),
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
              SizedBox(height: 20),
              Text("Phone Verification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,),
              SizedBox(height:2),
              Text("We need to register your phone before getting started !",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.center,),
              SizedBox(height: 18),

                Pinput(
                length: 6,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                  onChanged: (value){
                  code = value;
                  },
                ),

                SizedBox(height: 25),
                SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(onPressed: () async{

                  try {
                    PhoneAuthCredential credential = PhoneAuthProvider
                        .credential(
                        verificationId: MyPhone.verify, smsCode: code);
                    await auth.signInWithCredential(credential);
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'home', (route) => false);
                  }catch(e){
                    print("Wrong OTP!!");
                  }








                // Sign the user in (or link) with the credential

                }, child: Text("Verify Phone Number"),style: ElevatedButton.styleFrom(
                  primary: Colors.green.shade500,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                ),
                ),
              SizedBox(height: 2),
            Row(children: [
            TextButton(onPressed: (){Navigator.pushNamedAndRemoveUntil(context, 'phone', (route) => false);}, child: Text("Edit  Phone Number?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black)))
          ],)
            ],
          ),


        ),
      ),
    );
  }
}
