import 'package:flutter/material.dart';
import 'package:trademale/utilities/dimensions.dart';

class OrderHistoryItem extends StatelessWidget {
  const OrderHistoryItem({
    super.key,
    required this.orderId,
    required this.created_at,
    required this.client_id,
    required this.supplier,
    required this.total,
    required this.Expected_delivery_date,
    required this.status,
  });

  final int orderId;
  final String created_at;
  final int client_id;
  final String supplier;
  final int total;
  final String? Expected_delivery_date;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimension.height10,
        bottom: Dimension.height10,
      ),
      padding: EdgeInsets.only(
        left: Dimension.width20,
      ),
      decoration: BoxDecoration(
        color: Color(0x26e57b7f),
        borderRadius: BorderRadius.circular(15),
      ),
      height: Dimension.height50 * 3.5,
      width: double.infinity,
      // color: Colors.red,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "created_at:\n${created_at.substring(0, created_at.indexOf('.'))}",
                  style: TextStyle(
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.w400,
                      fontSize: Dimension.font12 * 1.4,
                      color: Color(0xff6d6875)),
                ),
                Text(
                  "client id:  ${client_id}",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontFamily: 'Schyler',
                      color: Color(0xff6d6875),
                      fontWeight: FontWeight.w400,
                      fontSize: Dimension.font12 * 1.4),
                ),
                Text(
                  "supplier:  ${supplier}",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontFamily: 'Schyler',
                      color: Color(0xff6d6875),
                      fontWeight: FontWeight.w400,
                      fontSize: Dimension.font12 * 1.4),
                ),
                Text(
                  "total:  ${total}",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontFamily: 'Schyler',
                      color: Color(0xff6d6875),
                      fontWeight: FontWeight.w400,
                      fontSize: Dimension.font12 * 1.4),
                ),
                Text(
                  "Expected delivery date:  ${Expected_delivery_date}",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontFamily: 'Schyler',
                      color: Color(0xff6d6875),
                      fontWeight: FontWeight.w400,
                      fontSize: Dimension.font12 * 1.4),
                ),
                Text(
                  "status:  ${status}",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontFamily: 'Schyler',
                      color: Color(0xff6d6875),
                      fontWeight: FontWeight.w400,
                      fontSize: Dimension.font12 * 1.4),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: Dimension.width10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/cart.jpg'),
              ),
            ),
            width: Dimension.width50 * 2.5,
            height: Dimension.height50 * 2.5,
          ),
        ],
      ),
    );
  }
}
