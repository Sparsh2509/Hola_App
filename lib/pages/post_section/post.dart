
// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hola_app/constants/postapi.dart';
import 'package:image_picker/image_picker.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  // final TextEditingController postController = TextEditingController();
  // final TextEditingController captionController = TextEditingController();
  final ApiService apiService = ApiService();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  
  

  // File? selectedImage;
  // final picker = ImagePicker();
  
  // Future getImageGallery() async{
  //   final PickedFile =await picker.pickImage(
  //     source: ImageSource.gallery ,
  //     imageQuality: 80,
  //     );
  //     setState(() {
  //       if(PickedFile != null){
  //         selectedImage = File(PickedFile.path);
  //       }
  //       else{
  //         print(" NO Image picked");
  //       }
  //     });
  // }
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
    return Scaffold(
      appBar: AppBar(title: Text("Create Post")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(labelText: "Body"),
            ),
            SizedBox(height: 16),
            _selectedImage != null
                ? Image.file(_selectedImage!, height: 150)
                : Text("No image selected."),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text("Pick Image"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final postData = {
                  "title": titleController.text,
                  "body": bodyController.text,
                  // Add image uploading to your API
                };

                try {
                  await apiService.createPost(postData);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Post created successfully!")),
                  );
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error: $e")),
                  );
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}