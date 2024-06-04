import 'package:animations/extras/contenido.dart';
import 'package:flutter/material.dart';

class AnimationPosicioned extends StatefulWidget {
  const AnimationPosicioned({
    super.key
  });
  static String routeName = 'misc/animated_positioned';

  @override
  State < AnimationPosicioned > createState() => _AnimationPosicionedState();
}

class _AnimationPosicionedState extends State < AnimationPosicioned > {
  late ScrollController _scrollController;
  double _topHeight = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _topHeight = 200;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // AnimatedPositioned animates changes to a widget's position within a Stack
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: _topHeight,
            child: Container(
              width: size.width,
              color: Colors.blue,
              child: const Column(
                children: [
                  Icon(
                    Icons.monetization_on_outlined,
                    size: 40,
                  ),
                  SizedBox(height: 20, ),
                  Text(
                    '¡Gracias por tu pago!',
                    style: TextStyle(
                      fontSize: 12
                    ),
                  ),
                  Text('\$300.00', style: TextStyle(
                    fontSize: 45
                  ), ),
                  Text(
                    'Folio: XDCFVGBJHKK',
                    style: TextStyle(
                      fontSize: 12
                    ),
                  ),

                ],
              ),
            )
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: _topHeight,
            child: const SingleChildScrollView(
              child: Contenido(),
            )
          ),
        ],
      )
    );
  }
}
