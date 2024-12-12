
// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/post_list.dart';
import 'package:hola_app/models/post_model.dart';
import 'package:hola_app/pages/landing_section/landing.dart';
import 'package:image_picker/image_picker.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  final TextEditingController postController = TextEditingController();
  final TextEditingController captionController = TextEditingController();
  

  File? selectedImage;
  final picker = ImagePicker();
  
  Future getImageGallery() async{
    final PickedFile =await picker.pickImage(
      source: ImageSource.gallery ,
      imageQuality: 80,
      );
      setState(() {
        if(PickedFile != null){
          selectedImage = File(PickedFile.path);
        }
        else{
          print(" NO Image picked");
        }
      });
  }
  // Future<void> pickImage() async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       selectedImage = File(pickedFile.path);
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: SingleChildScrollView(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
        title: const Text(
          
          'CREATE POST',
          style: TextStyle(fontSize: 15,color: whiteColor)
        ),
        centerTitle: true,
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pushReplacement(context,
        //           MaterialPageRoute(builder: (context) =>Landing2()));
        //     },
        //     icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(color: iconColor),
                controller: captionController,
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText: 'Add a Caption',hintStyle: TextStyle(color: iconColor),
                ),
              ),
              const SizedBox(height: 20),
              selectedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        selectedImage!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: greyColor),
                      child: const Center(
                        child: Text(
                          'Select a Image',
                          style: TextStyle(fontSize: 15)
                        ),
                      ),
                    ),
              TextButton.icon(
                onPressed: getImageGallery,
                icon: const Icon(Icons.image),
                label: const Text('Upload Image'),
              ),
              const SizedBox(height: 10),
              // Post Content TextField
              TextField(
                style: const TextStyle(color: iconColor),
                controller: postController,
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText: 'What\'s on your mind?',hintStyle: TextStyle(color: iconColor),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (postController.text.isNotEmpty || selectedImage != null) {
                    setState(
                      () {
                        postList.add(
                          PostModel(text: postController.text,
                          caption: captionController.text,
                          image: selectedImage!,
                          comments: 30,
                          likes: 120,
                          isliked: false)
                          );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Landing()));
                      },
                    );
                    postController.clear();
                    captionController.clear();
                    selectedImage = null;
                  }
                },
                child: const Text('Post'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
          // child: Column(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text("Cancel",style: TextStyle(color: whiteColor,fontSize: 20),),
          //           Row(
          //             children: [
          //               Text("Recent",style: TextStyle(color: whiteColor,fontSize: 20)),
          //               Icon(Icons.keyboard_arrow_down,color: whiteColor,),
          //             ],
          //           ),
          //           Text("Next",style: TextStyle(color: blueColor,fontSize: 20))
                   
                
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: screenHeight*0.02,
          //     ),
          //     Container(
          //       height: screenHeight*0.4,
          //       width: screenWidth,
          //       decoration: BoxDecoration(
          //         border: Border.all(color: iconColor),
          //         borderRadius: BorderRadius.circular(10)
          //       ),
          //     )
          //   ],
          // ),
      