

import 'package:axamen/tes3.dart';
import 'package:axamen/test2_page.dart';
import 'package:flutter/material.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Test2Page(),
      //home:Test3Page(),
      home: Test2Page(),
    );
  }
}