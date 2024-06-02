import 'package:animations/screens/animation_change_dimensions.dart';
import 'package:animations/screens/otra.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: AnimationChangeDimensions(),
      home: Otra(),
    );
  }
}