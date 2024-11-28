// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/pages/homepage_section/homepage.dart';
import 'package:hola_app/pages/landing.dart';

class CommentScreen extends StatefulWidget {
   const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
 final TextEditingController _searchController = TextEditingController();

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        title: const Text(
          'Comments',
          style: TextStyle(color: whiteColor),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
          onPressed: () {
             Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) => Landing()));
          },
        ),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/person_image.png',
                  ),
                ),
                title: Text('Shab_pt', style: TextStyle(color: whiteColor)),
                subtitle:
                    Text('Beautiful', style: TextStyle(color: whiteColor)),
                trailing: Column(
                  children: [
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      iconSize: 20,
                      padding: EdgeInsets.all(0),
                      icon: const Icon(
                        Icons.favorite_border,
                        color: whiteColor,
                      ),
                      onPressed: () {},
                    ),
                    const Text('3', style: TextStyle(color: whiteColor)),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.favorite,color: Colors.red,),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.emoji_emotions,color: Colors.yellow,),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.add,color: whiteColor,),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.mic,color: whiteColor,),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.send,color: whiteColor,),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(
          height: screenHeight*0.01,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
                  controller: _searchController,
                  style: TextStyle(color: whiteColor),
                  decoration: InputDecoration(
                  
                    hintText: "Type a Comment",
                    hintStyle: TextStyle(color: iconColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: whiteColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  
                  
                ),
        ),

      ]),

      // bottomNavigationBar: BottomAppBar(

      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       IconButton(
      //         icon: const
      //          Icon(Icons.favorite),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.emoji_emotions),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.add_circle_outline),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.mic),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.send),
      //         onPressed: () {},
      //       ),
      //     ],
      //   ),
    );
  }
}
