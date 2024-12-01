
import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cancel",style: TextStyle(color: whiteColor,fontSize: 20),),
                    Row(
                      children: [
                        Text("Recent",style: TextStyle(color: whiteColor,fontSize: 20)),
                        Icon(Icons.keyboard_arrow_down,color: whiteColor,),
                      ],
                    ),
                    Text("Next",style: TextStyle(color: blueColor,fontSize: 20))
                   
                
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight*0.02,
              ),
              Container(
                height: screenHeight*0.4,
                width: screenWidth,
                decoration: BoxDecoration(
                  border: Border.all(color: iconColor),
                  borderRadius: BorderRadius.circular(10)
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}