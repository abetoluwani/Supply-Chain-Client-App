import 'package:flutter/material.dart';
import 'package:trademale/utilities/dimensions.dart';

import 'iconText_widget.dart';

class ProductItemSupplierPage extends StatelessWidget {
  final String title;
  final String description;
  final ImageProvider imagePath;
  final int price;
  final int pPrice;

  ProductItemSupplierPage({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.pPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimension.height50 * 2,
      width: double.infinity,
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
                        Text(
                          title,
                          style: TextStyle(
                            fontFamily: 'Schyler',
                            fontSize: Dimension.font12 * 1.7,
                            fontWeight: FontWeight.w900,
                            letterSpacing: Dimension.width5 / 3,
                            color: Color(0xff161616),
                          ),
                        ),
                        Icon(
                          Icons.favorite_border,
                          color: Color(0xffe5989b),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimension.height5,
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color(0xffa3a3a3),
                      ),
                    ),
                    SizedBox(
                      height: Dimension.height10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconTextWidget(
                            icon: Icons.money_off_csred_rounded,
                            text: price.toString(),
                            iconColor: Color(0xffe5989b)),
                        IconTextWidget(
                            icon: Icons.attach_money,
                            text: pPrice.toString(),
                            iconColor: Color(0xffe5989b)),
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
