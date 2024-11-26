// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final TextEditingController _searchController = TextEditingController();

  OutlineInputBorder _getOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: color),
    );
  }

  InputDecoration _getTextFormFieldInputDecorationWithIcon(
      Icon icon, String hintText, TextStyle hintStyle) {
    return InputDecoration(
      prefixIcon: icon,
      hintText: hintText,
      hintStyle: hintStyle,
      enabledBorder: _getOutlineInputBorder(whiteColor),
      focusedBorder: _getOutlineInputBorder(whiteColor),

      // errorBorder: _getOutlineInputBorder(Colors.red),
      // focusedErrorBorder: _getOutlineInputBorder(Colors.red)
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () {
            // Navigator.pushReplacement(context,
            //   MaterialPageRoute(builder: (BuildContext context) => Landing()));
          },
        ),
        title: Text(
          "Settings and activity",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            TextFormField(
              style: TextStyle(color: iconColor),
              controller: _searchController,
              // validator: (text) {
              //   if (text == null || text.isEmpty) {
              //     return "Enter a Name";
              //   }
              //   return null;
              // },
              decoration: _getTextFormFieldInputDecorationWithIcon(
                  Icon(Icons.search, color: iconColor),
                  "Search",
                  TextStyle(fontSize: 15, color: whiteColor)),
            ),
            SizedBox(height: screenHeight * 0.02),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Your Account",
                  style: TextStyle(fontSize: 15, color: whiteColor),
                )),
            SizedBox(height: screenHeight * 0.02),
            GestureDetector(
              // onTap: ,
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  height: screenWidth * 0.15,
                  width: screenWidth * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.person, color: iconColor),
                ),
                title: Text(
                  "Accounts Center",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: whiteColor),
                ),
                subtitle: Text(
                  "Password, security, personal details, ad preferences",
                  style: const TextStyle(fontSize: 16, color: greyColor),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Divider(
              color: greyColor,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "How you use Hola",
                  style: TextStyle(fontSize: 15, color: greyColor),
                )),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.bookmark_border, color: whiteColor),
                Text(
                  "Saved",
                  style: TextStyle(color: whiteColor, fontSize: 15),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.arrow_forward_ios_outlined,
                        color: whiteColor)),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.more_time, color: whiteColor),
                Text(
                  "Archieve",
                  style: TextStyle(color: whiteColor, fontSize: 15),
                ),
                Container(
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.arrow_forward_ios_outlined,
                            color: whiteColor))),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.access_time, color: whiteColor),
                Text(
                  "Time Management",
                  style: TextStyle(color: whiteColor, fontSize: 15),
                ),
                Container(
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.arrow_forward_ios_outlined,
                            color: whiteColor))),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.stars, color: whiteColor),
                Text(
                  "Close Friend",
                  style: TextStyle(color: whiteColor, fontSize: 15),
                ),
                Container(
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.arrow_forward_ios_outlined,
                            color: whiteColor))),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.block, color: whiteColor),
                Text(
                  "Blocked",
                  style: TextStyle(color: whiteColor, fontSize: 15),
                ),
                Container(
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.arrow_forward_ios_outlined,
                            color: whiteColor))),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.lock, color: whiteColor),
                Text(
                  "Account Privacy",
                  style: TextStyle(color: whiteColor, fontSize: 15),
                ),
                Container(
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.arrow_forward_ios_outlined,
                            color: whiteColor))),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.language, color: whiteColor),
                Text(
                  "Language",
                  style: TextStyle(color: whiteColor, fontSize: 15),
                ),
                Container(
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.arrow_forward_ios_outlined,
                            color: whiteColor))),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.question_mark, color: whiteColor),
                Text(
                  "Help",
                  style: TextStyle(color: whiteColor, fontSize: 15),
                ),
                Container(
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.arrow_forward_ios_outlined,
                            color: whiteColor))),
              ],
            ),
            
          ],
        ),
      ),
    ));
  }
}
