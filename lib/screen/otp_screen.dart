import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ibreez/screen/phone_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'signin_Screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var code = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Enter OTP",
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Pinput(
                length: 6,
                showCursor: true,
                onChanged: (value) {
                  code = value;
                },
              )),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: Phone_Auth.verify, smsCode: code);
                await auth.signInWithCredential(credential);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignIn();
                }));
              } catch (e) {
                print("wrong Otp");
              }
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: Colors.green),
            child: const Text("Send the otp"),
          )
        ],
      ),
    );
  }
}
