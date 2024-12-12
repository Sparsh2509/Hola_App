// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/homepage_list.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/constants/user_token.dart';

import 'package:hola_app/pages/chat_section/chat.dart';
import 'package:hola_app/pages/homepage_section/notification.dart';
import 'package:hola_app/shared/homepage_card.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getHomePagePost();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _getHomePagePost() async {
    try {
      setState(() {
        isLoading = true;
      });
      var response =
          await http.get(Uri.parse(baseUrl + "home/posts"),
              headers: Map<String, String>.from({
                "cookie": token
              }));
      print(response.body.toString());

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(response.body.toString());
        setState(() {
          isLoading = false;
        });

        print('Post fetched successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
              child: Image.asset("assets/Splash_image.png", fit: BoxFit.fill)),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Chats()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab Bar
          TabBar(
            controller: _tabController,
            labelColor: iconColor,
            unselectedLabelColor: whiteColor,
            indicatorColor: iconColor,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            // indicatorSize: .
            tabs: const [
              Tab(
                child: Text(
                  "All",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  "Following",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          // Posts List
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPostList(),
                _buildFollowingPage()
                // Column(
                //   children: [
                //     // _buildFollowingPage(),
                //     // SizedBox(height: 20),
                //     _buildPostList(),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFollowingPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Text(
            "Live",
            style: TextStyle(color: whiteColor, fontSize: 20),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          height: screenHeight * 0.15,
          width: screenWidth,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: screenHeight * 0.1,
                      height: screenHeight * 0.1,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: iconColor, width: 5),
                          image: DecorationImage(
                              image: AssetImage("assets/person_image.png"),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "@AliceK",
                      style: TextStyle(color: whiteColor),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 20,
                  height: 20,
                );
              },
              itemCount: 10),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Text(
            "Your Following",
            style: TextStyle(color: whiteColor, fontSize: 20),
          ),
        ),
        Expanded(child: _buildPostList())
      ],
    );
  }

  Widget _buildPostList() {
    return isLoading
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          )
        : ListView.separated(
            shrinkWrap: true,
            itemCount: homeList.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return HomepageCard(
                homepageModel: homeList[index],
                onValueChanged: () {
                  setState(() {
                    homeList[index].isliked = !homeList[index].isliked;
                    if (homeList[index].isliked) {
                      homeList[index].likes++;
                    } else {
                      homeList[index].likes--;
                    }
                  });
                },
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: screenHeight * 0.02,
              );
            },
          );
  }
}
