import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademale/conrtollers/watchList_controller.dart';
import 'package:trademale/utilities/dimensions.dart';

class ProductItemWatchList extends StatefulWidget {
  final int id;
  final String productName;
  final String supplierName;
  final ImageProvider imagePath;
  final int buyPrice;
  final int sellPrice;
  final String updatedAt;

  ProductItemWatchList({
    required this.id,
    required this.productName,
    required this.supplierName,
    required this.imagePath,
    required this.buyPrice,
    required this.sellPrice,
    required this.updatedAt,
  });

  @override
  State<ProductItemWatchList> createState() => _ProductItemWatchListState();
}

class _ProductItemWatchListState extends State<ProductItemWatchList> {
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
              image: DecorationImage(
                fit: BoxFit.cover,
                image: widget.imagePath,
              ),
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
                        widget.productName,
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
                          Icons.favorite,
                          color: Color(0xffe5989b),
                        ),
                        onTap: () {
                          setState(() {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              animType: AnimType.leftSlide,
                              showCloseIcon: false,
                              title: "hey !!",
                              desc: "Are you sure you want to remove item ?!",
                              btnOkText: "Yes",
                              btnCancelText: "No",
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {
                                Get.find<WatchListController>()
                                    .removeWatchListItem(widget.id);
                              },
                            ).show();
                          });
                        },
                      ),
                    ],
                  ),
                  Text(
                    widget.supplierName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xffa3a3a3),
                    ),
                  ),
                  Text(
                    "last update:${widget.updatedAt.substring(0, widget.updatedAt.length - widget.updatedAt.length + 10)}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xffa3a3a3),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${widget.buyPrice.toString() ?? 0}',
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
