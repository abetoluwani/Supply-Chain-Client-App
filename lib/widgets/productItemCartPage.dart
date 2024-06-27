import 'package:flutter/material.dart';
import 'package:trademale/utilities/dimensions.dart';

class ProductItemCartPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final ImageProvider imagePath;
  final int quantity; // New field for quantity
  final VoidCallback onAdd; // Callback when quantity is incremented
  final VoidCallback onRemove; // Callback when quantity is decremented
  final VoidCallback onDelete;

  ProductItemCartPage({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imagePath,
    required this.quantity, // Initialize in constructor
    required this.onAdd,
    required this.onRemove,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimension.height50 * 2,
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
                color: Color(0x26e5989b),
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
                            fontSize: Dimension.font12 * 1.7,
                            fontWeight: FontWeight.w900,
                            letterSpacing: Dimension.width5 / 3,
                            color: Color(0xff6d6875),
                          ),
                        ),
                        GestureDetector(
                          onTap: onDelete,
                          child: Icon(
                            Icons.delete,
                            color: Color(0xff6d6875),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimension.height5,
                    ),
                    Text(
                      "${subtitle.substring(0, subtitle.indexOf('.'))}",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color(0xff6d6875),
                      ),
                    ),
                    SizedBox(
                      height: Dimension.height10,
                    ),
                    Row(
                      children: [
                        Text(
                          price,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6d6875),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: onRemove,
                          child: Icon(
                            Icons.remove,
                            color: Color(0xff6d6875),
                            size: Dimension.iconSize25,
                          ),
                        ),
                        SizedBox(
                          width: Dimension.width5,
                        ),
                        Text(quantity.toString()),
                        SizedBox(
                          width: Dimension.width5,
                        ),
                        GestureDetector(
                          onTap: onAdd,
                          child: Icon(
                            Icons.add,
                            color: Color(0xff6d6875),
                            size: Dimension.iconSize25,
                          ),
                        ),
                      ],
                    ),
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
