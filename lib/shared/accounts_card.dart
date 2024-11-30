import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';

class AccountsCard extends StatelessWidget {
  AccountsCard({
    required this.imageUrl,
    required this.text,
    required this.subtitle,
  });
  String imageUrl;
  String text;
  String subtitle;

  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          height: screenWidth * 0.15,
          width: screenWidth * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(imageUrl),
          ),
        ),
        title: Text(
          text,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: whiteColor),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 16, color: greyColor),
        ),
        
      ),
    ); 
  }
}