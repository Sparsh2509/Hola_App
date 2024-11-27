import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/follower_list.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/pages/landing.dart';
import 'package:hola_app/shared/follower_card.dart';

class Follower extends StatefulWidget {
  const Follower({super.key});

  @override
  State<Follower> createState() => _FollowerState();
}

class _FollowerState extends State<Follower> {
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
                        builder: (BuildContext context) => Landing()));
              },
            ),
            title: Text(
              "Followers",
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
                      FollowerCard(
                        imageUrl: followerList[index].imageUrl,
                        text: followerList[index].text,
                        subtitle: followerList[index].subtitle,
                      ),
                    ]),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: screenHeight * 0.0);
                },
                itemCount: followerList.length),
          )),
    );
  }
  }
