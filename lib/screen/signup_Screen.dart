import 'package:firebase_ibreez/screen/phone_auth.dart';
import 'package:flutter/material.dart';
import '../firebase_service/user_repository.dart';


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String? _validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name is required';
  }
  if (value.length < 2) {
    return 'Name must be at least 2 characters long';
  }
  if (value.length > 50) {
    return 'Name must be less than 50 characters long';
  }
  return null;
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => SignupScreen_State();
}

class SignupScreen_State extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _cpasswordController = TextEditingController();
  FirebaseServices firebaseServices = FirebaseServices();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _cpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/signupbackgroundimage.webp"),
                      fit: BoxFit.cover)),
            ),
            Form(
              key: _formKey,
              child: Container(
                width: w,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome!..",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Create an Account",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.5)),
                          ]),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          final emailRegExp =
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (!emailRegExp.hasMatch(value!)) {
                            return 'Please enter valid email';
                          }
                          return null;
                        },
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.blue[900],
                          ),
                          label: const Text("Email"),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(30)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.5)),
                          ]),
                      child: TextFormField(
                        validator: _validateName,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _nameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Name",
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.blue[900],
                          ),
                          label: const Text("Name"),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(30)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.5))
                          ]),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your phone Number';
                          }
                          if (value.length < 10) {
                            return 'Password must be 10 characters long ';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text,
                        controller: _phoneController,
                        decoration: InputDecoration(
                            hintText: "Phone",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.blue[900],
                            ),
                            label: const Text("Phone"),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white, width: 1.0),
                                borderRadius: BorderRadius.circular(30)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white, width: 1.0),
                                borderRadius: BorderRadius.circular(30)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.5))
                          ]),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be atleast 6 character long';
                          }
                          return null;
                        },
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.blue[900],
                            ),
                            label: const Text("Password"),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white, width: 1.0),
                                borderRadius: BorderRadius.circular(30)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white, width: 1.0),
                                borderRadius: BorderRadius.circular(30)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.5))
                          ]),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Password do not match';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _cpasswordController,
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.blue[900],
                            ),
                            label: const Text("Confirm Password"),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white, width: 1.0),
                                borderRadius: BorderRadius.circular(30)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white, width: 1.0),
                                borderRadius: BorderRadius.circular(30)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                firebaseServices.signUpWithEmailPassword(_emailController.text,
                    _passwordController.text, _phoneController.text);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Phone_Auth()));
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
              child: const Text(
                "Sign Up",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

          ],
        ),
      ),
    );
  }
}
