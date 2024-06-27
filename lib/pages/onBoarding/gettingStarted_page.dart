import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:trademale/utilities/dimensions.dart';
import 'package:trademale/utilities/routeHelper.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Dimension.height20 * 2,
                ),
                Center(
                  child: Text(
                    'TradeMale',
                    style: TextStyle(
                        fontFamily: 'Schyler',
                        letterSpacing: 2,
                        fontWeight: FontWeight.w900,
                        color: Color(0xff6d6875),
                        fontSize: Dimension.font20 * 1.6),
                  ),
                ),
                SizedBox(
                  height: Dimension.height20 * 2,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: Dimension.height10, right: Dimension.height10),
                  height: Dimension.height50 * 10,
                  width: double.infinity,
                  //color: Colors.red,
                  child: Stack(
                    children: [
                      Positioned(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimension.height30 *
                                3), // Top-left corner circular
                            topRight: Radius.circular(Dimension.height30 *
                                3), // Top-right corner circular
                            bottomLeft: Radius
                                .zero, // Bottom-left corner square (0 circular)
                            bottomRight: Radius
                                .zero, // Bottom-right corner square (0 circular)
                          ),
                          child: Image.asset(
                            'assets/images/2.jpg',
                            width: Dimension.screenWidth /
                                2, // Adjust the width as needed
                            height: Dimension.height30 *
                                10, // Adjust the height as needed
                            fit: BoxFit.cover,
                          ),
                        ),
                        left: 0,
                        top: 0,
                      ),
                      Positioned(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(0), // Top-left corner circular
                            topRight:
                                Radius.circular(0), // Top-right corner circular
                            bottomLeft: Radius.circular(Dimension.height30 *
                                3), // Bottom-left corner square (0 circular)
                            bottomRight: Radius.circular(Dimension.height30 *
                                3), // Bottom-right corner square (0 circular)
                          ),
                          child: Image.asset(
                            'assets/images/1.jpg',
                            width: Dimension.screenWidth /
                                2, // Adjust the width as needed
                            height: Dimension.height30 *
                                10, // Adjust the height as needed
                            fit: BoxFit.cover,
                          ),
                        ),
                        right: 0,
                        bottom: 0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimension.height20,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New Tradement Way in Syria',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Schyler',
                          fontSize: Dimension.font26,
                          fontWeight: FontWeight.w900,
                          height: 3,
                          letterSpacing: 1.2,
                          color: Color(0xff6d6875),
                        ),
                      ),
                      Container(
                        width: Dimension.width50 * 3.6,
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(routeHelper.getSignUp());
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Color(0xffb5838d),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Get Start',
                                  style: TextStyle(
                                      fontFamily: 'Schyler',
                                      letterSpacing: 0.8,
                                      color: Color(0xffffffff),
                                      height: 1.2,
                                      fontSize: Dimension.font20 * 1.2,
                                      fontWeight: FontWeight.w400)),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: Dimension.width15,
                              ), // Icon on the right
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
