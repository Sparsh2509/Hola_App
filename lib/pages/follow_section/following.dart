// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/following_list.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/pages/landing_section/landing.dart';
import 'package:hola_app/pages/profile_section/profile.dart';
import 'package:hola_app/shared/following_card.dart';

class Following extends StatefulWidget {
  const Following({super.key});

  @override
  State<Following> createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: blackColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: whiteColor),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>  Landing()));
              },
            ),
            title: const Text(
              "Following",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
            ),
          ),
          body: Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => DmPage()),
                      // );
                    },
                    child: Row(children: [
                      FollowingCard(
                        imageUrl: followingList[index].imageUrl,
                        text: followingList[index].text,
                        subtitle: followingList[index].subtitle,
                      ),
                    ]),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: screenHeight * 0.0);
                },
                itemCount: followingList.length),
          )),
    );
  }
}
