import 'package:flutter/material.dart';

class AnimationChangeDimensions extends StatefulWidget {
  const AnimationChangeDimensions({super.key});

  @override
  State<AnimationChangeDimensions> createState() => _AnimationChangeDimensionsState();
}

class _AnimationChangeDimensionsState extends State<AnimationChangeDimensions> with SingleTickerProviderStateMixin {
  bool _isExpanded = true;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool isFullWidth = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
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

  void toggleButtonWidth() {
    setState(() {
      isFullWidth = !isFullWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SizedBox(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  duration: const Duration(milliseconds: 400),
                  width: isFullWidth ? (screenWidth * 0.9) : screenWidth * 0.6,
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
    );
  }
}
