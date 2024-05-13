import 'package:exam_app/pages/home_menu.dart';
import 'package:exam_app/pages/profile_page.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeMenu(),
    );
  }
}
