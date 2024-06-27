import 'package:flutter/cupertino.dart';
import 'package:trademale/utilities/dimensions.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  IconTextWidget(
      {required this.icon, required this.text, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimension.iconSize25,
        ),
        SizedBox(
          width: Dimension.width5,
        ),
        Text(text),
      ],
    );
  }
}
