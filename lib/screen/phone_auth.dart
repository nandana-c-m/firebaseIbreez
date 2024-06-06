import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'otp_screen.dart';

class Phone_Auth extends StatefulWidget {
  const Phone_Auth({super.key});
  static String verify = "";
  @override
  State<Phone_Auth> createState() => _Phone_AuthState();
}

class _Phone_AuthState extends State<Phone_Auth> {
  var phone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Enter your Phone number",
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextFormField(
              onChanged: (value) {
                phone = value;
              },
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Phone",
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.blue[900],
                ),
                label: const Text("Phone"),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: '+91$phone',
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verifictionId, int? resendToken) {
                    Phone_Auth.verify = verifictionId;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpScreen()));
                  },
                  codeAutoRetrievalTimeout: (String verifictionId) {});
            },
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: Colors.green),
            child: const Text("send the otp"),
          )
        ],
      ),
    );
  }
}
