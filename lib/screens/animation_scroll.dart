// import 'package:animations/extras/contenido.dart';
import 'package:flutter/material.dart';

class AnimationScroll extends StatefulWidget {
  const AnimationScroll({super.key});


  @override
  State<AnimationScroll> createState() => _AnimationScrollState();
}

class _AnimationScrollState extends State<AnimationScroll> {
  late ScrollController _scrollController;
  double _topHeight = 300.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _topHeight = (_scrollController.offset < 0)
            ? 300
            : 300 - _scrollController.offset;
        if (_topHeight < 100) {
          _topHeight = 100;
        }
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
    double scale = (_topHeight - 100) / 200;
    double translationX = 100 * (1 - scale);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: _topHeight,
            child: Container(
              color: Colors.black,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1 - 0.8 * (1 - scale),
                      child: Transform.translate(
                        offset: Offset(-translationX, 0),
                        child: const Icon(
                            Icons.monetization_on_rounded,
                            color: Colors.white,
                            size: 37,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Transform.scale(
                      scale: 1 - 0.3 * (1 - scale),
                      child: Transform.translate(
                        offset: Offset(-translationX, 0),
                        child: const Text(
                          '¡Gracias por tu pago!',
                          style: TextStyle(color: Colors.white38, fontSize: 15),
                        ),
                      ),
                    ),
                    Transform.scale(
                      scale: 1 - 0.3 * (1 - scale),
                      child: Transform.translate(
                        offset: Offset(-translationX, 0),
                        child: const Text(
                          '\$1234.56',
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                    ),
                    Transform.scale(
                      scale: 1 - 0.3 * (1 - scale),
                      child: Transform.translate(
                        offset: Offset(-translationX, 0),
                        child: const Text(
                          'Folio: CTFVGBHJJR',
                          style: TextStyle(color: Colors.white38, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: _topHeight,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: List.generate(50, (index) => ListTile(
                    title: Text('Item $index'),
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
