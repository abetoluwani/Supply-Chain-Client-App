import 'package:flutter/material.dart';

class TabBarButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final double width;
  final double height;
  final double borderRadius;
  final Color buttonColor;
  final Color borderColor; // Color for the border

  TabBarButton({
    Key? key,
    required this.text,
    this.backgroundColor = Colors.white,
    this.width = 75.0,
    this.height = 40.0,
    this.borderRadius = 20.0,
    this.buttonColor = const Color(0xffe5989b),
    this.borderColor = const Color(0xffe5989b), // Default border color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          // color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor, width: 1.0),
          color: backgroundColor // Border
          ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Schyler',
            color: backgroundColor == Color(0xffe5989b)
                ? Colors.white
                : Color(0xffe5989b),
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
