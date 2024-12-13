// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'dart:convert';

import 'package:http/http.dart';

class AuthAPI {
  Future<String> signup(
      {required String name,
      required String email,
      required String password}) async {
    try {
      Response response = await post(Uri.parse("https://snapverse-6nqx.onrender.com/api/auth/signup"),
          body: {
            'name': name,
            'email': email,
            'password': password,
            'userName': name
          });
      print("sign up status code " + response.statusCode.toString());
      print("sign up response = " + response.body.toString());

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());
        print(
            "sign up verification token " + data['user']['verificationToken']);

            return data['user']['verificationToken'];

        // verifyEmail(data['user']['verificationToken']).then((onValue) {
        //   return "Signup Successful";
        // }).catchError((e) {
        //   throw (e);
        // });
      }
    } catch (e) {
      throw "Signup Failed";
    }

    throw "SignUp Failed";
  }

  Future<String> verifyEmail(String code) async {
    try {
      Response responseEmail = await post(
          Uri.parse("https://snapverse-6nqx.onrender.com/api/auth/verify-email"),
          body: {'code': code});
      if (responseEmail.statusCode == 200) {
        return "Email Verified";
      }
    } catch (e) {
      throw "Email Verification Failed";
    }
    throw "Email Verification Failed";
  }
}
