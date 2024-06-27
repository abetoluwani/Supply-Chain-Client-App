import 'package:flutter/material.dart';
import 'package:trademale/utilities/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  AppIcon({
    required this.icon,
    this.size = 0,
    this.iconColor = const Color(0xFF756d54),
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.iconSize = 0,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size == 0 ? Dimension.iconSize40 : size,
      height: size == 0 ? Dimension.iconSize40 : size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor,
          border:
              Border.all(color: iconColor, width: Dimension.iconSize15 / 9)),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize == 0 ? Dimension.iconSize15 : iconSize,
      ),
    );
  }
}
