import 'package:flutter/material.dart';
import 'package:trademale/utilities/dimensions.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Dimension.height50,
      // color: Colors.grey,
      margin: EdgeInsets.symmetric(vertical: Dimension.height5 * 1.3),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.w600,
                    fontSize: Dimension.font20,
                    color: Color(0xff6d6875),
                    letterSpacing: 2),
              ),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: Color(0xff6d6875),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: Dimension.height10, bottom: 2),
            width: double.infinity,
            height: 1,
            color: Color(0xff6d6875),
          ),
        ],
      ),
    );
  }
}
