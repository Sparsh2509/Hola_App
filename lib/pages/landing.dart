// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hola_app/pages/chat.dart';
import 'package:hola_app/pages/homepage.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        HomePage(),
        Chats()
      ],
    );
  }
}