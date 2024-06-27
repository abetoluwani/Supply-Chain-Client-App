import 'package:flutter/material.dart';
import 'package:trademale/utilities/dimensions.dart';

import 'iconText_widget.dart';

class SupplierItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String email;
  final ImageProvider imagePath;

  SupplierItem({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimension.height50 * 2.2,
      width: double.infinity,
      //color: Colors.black,
      margin: EdgeInsets.only(bottom: Dimension.height5),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimension.width10,
              right: Dimension.width10,
            ),
            width: Dimension.width30 * 4,
            height: Dimension.height50 * 1.92,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimension.radius15),
                bottomLeft: Radius.circular(Dimension.radius15),
              ),
              //color: Colors.yellow,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: imagePath,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: Dimension.listViewTextCon + Dimension.height5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimension.radius20),
                  bottomRight: Radius.circular(Dimension.radius20),
                ),
                color: Color(0xfff8efef),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: Dimension.width10,
                  right: Dimension.width10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Schyler',
                              fontSize: Dimension.font12 * 1.7,
                              fontWeight: FontWeight.w900,
                              letterSpacing: Dimension.width5 / 3,
                              color: Color(0xff161616),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.add,
                          color: Color(0xffe5989b),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimension.height5,
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: Dimension.height10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconTextWidget(
                          icon: Icons.email,
                          text: email,
                          iconColor: Color(0xffe5989b),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
