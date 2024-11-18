// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/models/signup_model.dart';
import 'package:hola_app/pages/homepage.dart';
import 'package:hola_app/pages/signin.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void createSign() {
    final validateStatus = _form.currentState?.validate();
    if (validateStatus!) {
      final Sign signup = Sign(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password : _passwordController.text.trim());

      Navigator.pop(context, signup);
    }
  }

  Text _getTextFormFieldHintText(String text) {
    return Text(text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }

  InputDecoration _getTextFormFieldInputDecoration() {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: whiteColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  InputDecoration _getTextFormFieldInputDecorationWithIcon(Icon icon) {
    return InputDecoration(
      prefix: icon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: whiteColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/bg_image.png",
              width: screenWidth,
              height: screenHeight,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.1),
                      Image.asset("assets/signup_image.png"),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Use proper information to continue",
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      TextFormField(
                        controller: _nameController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Enter a Name";
                          }
                          return null;
                        },
                        decoration: _getTextFormFieldInputDecorationWithIcon(
                            Icon(Icons.person, color: iconColor)),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      TextFormField(
                        controller: _emailController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Enter a email ";
                          }
                          return null;
                        },
                        decoration: _getTextFormFieldInputDecorationWithIcon(
                            Icon(Icons.email_outlined, color: iconColor)),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      TextFormField(
                        controller: _passwordController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Enter a password ";
                          }
                          return null;
                        },
                        decoration: _getTextFormFieldInputDecorationWithIcon(
                            Icon(Icons.lock, color: iconColor)),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      GestureDetector(
                        onTap: createSign,
                          
                        
                        child: Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.9,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Text("Create Account",
                              style:
                                  TextStyle(fontSize: 20, color: whiteColor)),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        "By signing up, you agree to our Terms & Conditions and Privacy Policy",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: whiteColor, fontSize: 15),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(color: whiteColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Or",
                              style: TextStyle(color: whiteColor),
                            ),
                          ),
                          Expanded(
                            child: Divider(color: whiteColor),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.9,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/google_icon.png",
                                height: screenHeight * 0.02,
                              ),
                              SizedBox(
                                width: screenWidth * 0.02,
                              ),
                              const Text("Continue with Google",
                                  style: TextStyle(
                                      fontSize: 20, color: whiteColor)),
                            ],
                          )),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(color: whiteColor),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to Sign In page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()),
                              );
                            },
                            child: Text("Sign In",
                                style: TextStyle(color: iconColor)),
                          ),
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
