// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';

class DmPage extends StatefulWidget {
  const DmPage({super.key});

  @override
  State<DmPage> createState() => _DmPageState();
}

class _DmPageState extends State<DmPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(

        backgroundColor: whiteColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: blackColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:  AssetImage("assets/person_image.png"), 
            ),
            SizedBox(
              width: screenWidth * 0.01,
            ),
            Column(
              children: [
                Text("Richard Wright" ,style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
                SizedBox(
                  // height: screenHeight *0.01,
                ),
                Text("Where should we go tomorrow?",style: TextStyle(fontSize: 12),)
              ],
            )
          ],
        ),
        
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: blackColor),
            onPressed: () {},
          ),
        ],
      ),

      body: Container(
        
        decoration: BoxDecoration(
          // color: Colors.red,
          image: DecorationImage(
            image: AssetImage("assets/chat_bg_image.png"),
            fit: BoxFit.cover,
          ),
          
          borderRadius: BorderRadius.only( topLeft: Radius.circular(40), topRight: Radius.circular(40),)

        ),
      ),
      

    )
    );
  }
}
