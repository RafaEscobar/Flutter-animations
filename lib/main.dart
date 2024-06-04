import 'package:animations/animations/animation_posicioned.dart';
import 'package:animations/screens/animation_scroll.dart';
// import 'package:animations/screens/animation_scroll.dart';

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
      //  home: AnimationScroll(),
      home: SafeArea(child: AnimationPosicioned()),
    );
  }
}