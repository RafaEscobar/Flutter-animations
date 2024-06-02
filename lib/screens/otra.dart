import 'package:flutter/material.dart';

class Otra extends StatefulWidget {
  const Otra({
    super.key
  });

  @override
  State < Otra > createState() => _OtraState();
}

class _OtraState extends State < Otra > with SingleTickerProviderStateMixin {
  bool isFullWidth = true;
  bool _isExpanded = true;
  late AnimationController _controller;
  late Animation < Offset > _offsetAnimation;

  void toggleButtonWidth() {
    setState(() {
      isFullWidth = !isFullWidth;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
        vsync: this,
    );
    _offsetAnimation = Tween < Offset > (
      begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  void _toggleButton() {
    setState(() {
      _isExpanded = !_isExpanded;
      _isExpanded ? _controller.reverse() : _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
      ),
      body: SizedBox(
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRect(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SlideTransition(
                        position: _offsetAnimation,
                        child: Visibility(
                          visible: !_isExpanded,
                          child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Colors.white),
                          ),
                            onPressed: _toggleButton,
                            child: const Icon(Icons.arrow_back, color: Colors.black),
                          ),
                        ),
                        ),
                        const SizedBox(width: 10,),
                        AnimatedContainer(
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 400),
                              width: isFullWidth ? screenWidth * .50 : screenWidth * 0.73,
                              child: ElevatedButton(
                                onPressed: () {
                                  toggleButtonWidth();
                                  _toggleButton();
                                },
                                child: const Text('Continuar1'),
                              ),
                          ),
                      ],
                    ),
                ),
              ),
          ],
        ),
      ),
    );
  }

}