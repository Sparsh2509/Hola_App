

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/models/post_model.dart';

class PostCard extends StatelessWidget {
  const PostCard(
      {super.key,
      required this.postModel,
      });

   final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: blackColor,
        // height: screenHeight*0.5,
        child: Container(
          // color: blackColor,
          height: screenHeight * 0.47,

          decoration: BoxDecoration(
              border: Border.all(color: iconColor),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                   
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    Expanded(
                      child: Text(postModel.caption,
                          style: TextStyle(fontSize: 20, color: whiteColor)),
                    ),
                    
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(postModel.text,
                    style: TextStyle(fontSize: 15, color: whiteColor)),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  height: screenHeight * 0.2,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(color: iconColor),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(postModel.image as String),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
