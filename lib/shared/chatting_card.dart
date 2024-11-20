import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';

// ignore: must_be_immutable
class ChattingCard extends StatelessWidget {
  ChattingCard({
    required this.imageUrl,
    required this.text,
    required this.subtitle,
  });
  String imageUrl;
  String text;
  String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // onTap:onTap,
      // contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 16),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      leading: Container(
        padding: const EdgeInsets.all(8),
        height: screenWidth * 0.15,
        width: screenWidth * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
          

        ),
        child: Image.asset(imageUrl),
        // decoration: BoxDecoration(
        //   image: DecorationImage(image: NetworkImage(imageUrl))
        // ),
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold ,color: whiteColor),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 16, color: greyColor),
      ),
      trailing: const Icon(Icons.camera_alt_outlined, color: whiteColor),
    );
  }
}
