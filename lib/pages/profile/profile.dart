import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:trademale/utilities/dimensions.dart';
import 'package:trademale/utilities/routeHelper.dart';
import 'package:trademale/widgets/profileTap.dart';

import '../../utilities/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(Dimension.height10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffb5838d), // Set the border color
                        width: 2.0, // Set the border width
                      ),
                      shape: BoxShape.circle, // Set the shape to circle
                    ),
                    child: Icon(
                      Icons.person,
                      size: Dimension.iconSize40 * 3.2,
                      color: Color(0xffb5838d),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Dimension.height20,
              ),
              Text(
                'Target',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Schyler',
                    fontSize: Dimension.font26 * 1.2,
                    color: Color(0xff6d6875),
                    letterSpacing: 2),
              ),
              Text(
                'target@gmail.com',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimension.font12 * 1.3,
                    color: Color(0xff6d6875),
                    letterSpacing: 1),
              ),
              SizedBox(
                height: Dimension.height20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(routeHelper.getDeliveryAddress());
                        },
                        child: ProfileTap(
                          name: 'My address',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ProfileTap(
                          name: 'My wallet',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ProfileTap(
                          name: 'Settings',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ProfileTap(
                          name: 'Chat With Store',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ProfileTap(
                          name: 'About Strore',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ProfileTap(
                          name: 'About Developers',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.question,
                            animType: AnimType.topSlide,
                            showCloseIcon: false,
                            title: "Hey!!",
                            desc: "Ary you sure you want to logout?",
                            btnOkText: "yes",
                            btnCancelText: "No",
                            btnOkOnPress: () async {
                              Box box = await Hive.openBox('myBox');
                              print(box.get(kToken));
                              await box.delete(kToken);
                              Get.offAllNamed(routeHelper.getSignIn());
                              print(box.get(kToken));
                            },
                            btnCancelOnPress: () {},
                          ).show();
                        },
                        child: ProfileTap(
                          name: 'Log out',
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
