import 'package:flutter/material.dart';

class AnimationScroll extends StatefulWidget {
  const AnimationScroll({super.key});

  @override
  State < AnimationScroll > createState() => _AnimationScrollState();
}

class _AnimationScrollState extends State<AnimationScroll> {
  late double topPosition;
  late double leftPosition;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    topPosition = 10;
    leftPosition = 10;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appBar = AppBar(title: const Text('AnimatedPositioned'));

    return Scaffold(
      appBar: appBar,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            final scrollOffset = _scrollController.offset;
            // Ajusta la posición del botón en función del desplazamiento
            setState(() {
              topPosition = 20 + scrollOffset ;
              leftPosition = 30 + scrollOffset ;
            });
          }
          return false;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                // Contenido del scroll
                Column(
                  children: List.generate(
                    20,
                    (index) => Container(
                      height: 200,
                      color: index % 2 == 0 ? Colors.blue : Colors.green,
                      child: Center(
                        child: Text('Item $index'),
                      ),
                    ),
                  ),
                ),
                // Botón
                AnimatedPositioned(
                  top: topPosition,
                  left: leftPosition,
                  duration: const Duration(milliseconds: 300),
                  child: InkWell(
                    onTap: () => print('Botón pulsado'),
                    child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 50,
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Click Me',
                        style: TextStyle(
                          color: Theme.of(context)
                              .buttonTheme
                              .colorScheme!
                              .onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}