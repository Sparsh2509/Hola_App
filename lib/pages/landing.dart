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