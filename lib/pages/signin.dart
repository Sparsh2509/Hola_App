import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/pages/homepage.dart';
import 'package:hola_app/pages/password.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                      "Sign In",
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Enter valid user name & password to continue",
                      style: TextStyle(
                        color: greyColor,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              // Navigate to Sign In page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Password()),
                              );
                            },
                            child: Text("Forgot password?",
                                style: TextStyle(color: iconColor)),
                          ),

                      ],

                    ),
                    SizedBox(
                      height: screenHeight * 0.08
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },

                        child: Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.9,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Text("Login",
                              style:
                                  TextStyle(fontSize: 20, color: whiteColor)),
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
        ]),
      ),
    ));
  }
}
