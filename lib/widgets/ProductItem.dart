import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademale/conrtollers/watchList_controller.dart';
import 'package:trademale/utilities/dimensions.dart';

class ProductItem extends StatefulWidget {
  final int id;
  final String title;
  final String subtitle;
  final ImageProvider imagePath;
  final int buyPrice;
  final int sellPrice;

  ProductItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.buyPrice,
    required this.sellPrice,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimension.height10,
        left: Dimension.height5,
      ),
      //color: Colors.red,
      height: Dimension.height50 * 4.05,
      width: Dimension.width30 * 6,
      child: Stack(
        children: [
          Container(
            height: Dimension.height30 * 4.3,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              image:
                  DecorationImage(fit: BoxFit.cover, image: widget.imagePath),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                left: Dimension.width10,
              ),
              height: Dimension.height20 * 5,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontFamily: 'Schyler',
                          fontSize: Dimension.font12 * 1.4,
                          fontWeight: FontWeight.w900,
                          letterSpacing: Dimension.width5 / 3,
                          color: Color(0xff161616),
                        ),
                      ),
                      GestureDetector(
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Color(0xffe5989b),
                        ),
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                            Get.find<WatchListController>()
                                .addToWatchList(widget.id);
                          });
                        },
                      ),
                    ],
                  ),
                  Text(
                    widget.subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color(0xffa3a3a3),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${widget.buyPrice.toString()}',
                        style: TextStyle(
                          color: Color(0xffe5989b),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '\$ ${widget.sellPrice.toString()}',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
