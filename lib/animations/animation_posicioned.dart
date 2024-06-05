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
  double _topHeight = 280.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
          _topHeight = (_scrollController.offset < 0) ?
            280 :
            280 - _scrollController.offset;
          if (_topHeight < 120) _topHeight = 120;
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
    double scale = (_topHeight - 100) / 200;
    double translationX = (_topHeight -280)/1.2;
    double translationY = (_topHeight - 280)/4;
    double translationXI = ((_topHeight-280))/3.8;
    double translationYI = ((_topHeight-280))/4;
    double translationXII = ((_topHeight-280))/4;
    double translationYII = ((_topHeight-280))/2.7;
    double translationXIII = ((_topHeight-280))/3.8;
    double translationYIII = ((_topHeight-280))/2.4;

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.translate(
                    offset: Offset(translationX, -translationY),
                    child: const  Icon(
                      Icons.monetization_on_outlined,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Transform.translate(
                    offset: Offset(translationXI, translationYI),
                    child: const Text(
                      '¡Gracias por tu pago!',
                      style: TextStyle(
                        fontSize: 12
                      ),
                    ),
                  ),
                  Transform.scale(
                    scale: 1 - 0.3 * (1 - scale),
                    child: Transform.translate(
                      offset: Offset(translationXIII, translationYIII),
                      child: const Text('\$3001.00', style: TextStyle(
                        fontSize: 45
                      ), ),
                    )
                  ),
                  Transform.translate(
                    offset: Offset(translationXII, translationYII),
                    child: const Text(
                      'Folio: XDCFVGBJHKK',
                      style: TextStyle(
                        fontSize: 12
                      ),
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
            child: SingleChildScrollView(
              controller: _scrollController,
              child: const Contenido(),
            )
          ),
        ],
      )
    );
  }
}