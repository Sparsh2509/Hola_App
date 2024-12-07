import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/pages/post.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final List<Map<String, dynamic>> posts = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Your Posts',
            style: TextStyle(fontSize: 15,color: whiteColor)
          ),
          centerTitle: true,
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () {
            Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => Post()));
          },

        ),
        ),
        body: Expanded(
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                color: greyColor,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (posts[index]['image'] != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.file(
                            posts[index]['image'],
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      const SizedBox(height: 8),
                      if (posts[index]['caption'] != null &&
                          posts[index]['caption'].isNotEmpty)
                        Text(posts[index]['caption'],
                            style: TextStyle(fontSize: 15)),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            posts[index]['text'],
                            style: const TextStyle(
                              fontSize: 16,
                              color: whiteColor,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete,
                                color: iconColor),
                            onPressed: () {
                              setState(() {
                                posts.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
