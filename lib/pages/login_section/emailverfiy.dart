// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/models/email_model.dart';
import 'package:hola_app/pages/login_section/signin.dart';
import 'package:http/http.dart';

class Email extends StatefulWidget {
  const Email({super.key});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  


  Future<void> createSign(String otp, String email) async {
    final validateStatus = _form.currentState?.validate();
    if (validateStatus!) {
      print("here2");
      final EmailModel signIn = EmailModel(
          email: _emailController.text.trim(),
          otp: _otpController.text.trim());

      try {
        Response response = await post(
            Uri.parse('https://snapverse-6nqx.onrender.com/api/auth/verify-email'),
            body: {
              'otp': otp
            });
        print(response.statusCode);

        if (response.statusCode == 201) {
          print(response.body.toString());

          print('Email verifed successfully');
        } else {
          print('failed');
        }
      } catch (e) {
        print(e.toString());
      }

      
    } else {
      print("here");
    }
  }

  OutlineInputBorder _getOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: color),
    );
  }

  InputDecoration _getTextFormFieldInputDecorationWithIcon(
      Icon icon, String hintText, TextStyle hintStyle) {
    return InputDecoration(
        prefix: icon,
        hintText: hintText,
        hintStyle: hintStyle,
        enabledBorder: _getOutlineInputBorder(whiteColor),
        focusedBorder: _getOutlineInputBorder(whiteColor),
        errorBorder: _getOutlineInputBorder(Colors.red),
        focusedErrorBorder: _getOutlineInputBorder(Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
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
                    Image.asset("assets/sign_in_image.png"),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "Verify Email",
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Enter valid Email to verify",
                      style: TextStyle(
                        color: greyColor,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    TextFormField(
                      style: TextStyle(color: iconColor),
                      controller: _emailController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Enter a email ";
                        }
                        return null;
                      },
                      decoration: _getTextFormFieldInputDecorationWithIcon(
                          Icon(Icons.email_outlined, color: iconColor),
                          "Enter Email",
                          TextStyle(fontSize: 15, color: whiteColor)),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextFormField(
                      style: TextStyle(color: iconColor),
                      controller: _otpController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Enter Otp";
                        }
                        return null;
                      },
                      decoration: _getTextFormFieldInputDecorationWithIcon(
                          Icon(Icons.lock, color: iconColor),
                          "Enter OTP",
                          TextStyle(fontSize: 15, color: whiteColor)),
                    ),
                   
                    
                    SizedBox(height: screenHeight * 0.08),
                    GestureDetector(
                      onTap: () {
                        createSign(_otpController.text.toString(),
                            _emailController.text.toString());
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()),
                              ); 
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: screenWidth * 0.9,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Text("Get OTP",
                            style: TextStyle(fontSize: 20, color: whiteColor)),
                      ),
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
                                style:
                                    TextStyle(fontSize: 20, color: whiteColor)),
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
                              MaterialPageRoute(builder: (context) => SignIn()),
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
        ]),
      ),
    ));
  }
}

