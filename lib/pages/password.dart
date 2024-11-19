// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  Text _getTextFormFieldHintText(String text) {
    return Text(text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: whiteColor));
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
                      Image.asset("assets/Password_image.png"),
                      SizedBox(height: screenHeight * 0.05),
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Don’t worry it happens. Please enter the E-mail address associated with your account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          
                          color: greyColor,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.05
                      ),
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
                      SizedBox(
                        height: screenHeight *0.08
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.9,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Text("Get OTP",
                              style:
                                  TextStyle(fontSize: 20, color: whiteColor)),
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
