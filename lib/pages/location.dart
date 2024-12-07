import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/pages/post_section/post.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final List<Map<String, dynamic>> posts = [];
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
