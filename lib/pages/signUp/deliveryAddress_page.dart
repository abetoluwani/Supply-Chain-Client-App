import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademale/conrtollers/signUp_controller.dart';
import 'package:trademale/models/signUp_Model.dart';
import 'package:trademale/utilities/dimensions.dart';
import 'package:trademale/utilities/routeHelper.dart';

import '../../widgets/app_icon.dart';

class DeliveryAddressPage extends StatefulWidget {
  const DeliveryAddressPage({Key? key}) : super(key: key);

  @override
  State<DeliveryAddressPage> createState() => _DeliveryAddressPageState();
}

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  TextEditingController cityController = TextEditingController();
  bool isCityValid = false;
  TextEditingController regionController = TextEditingController();
  bool isRegionValid = false;
  TextEditingController streetController = TextEditingController();
  bool isStreetValid = false;
  TextEditingController phoneController = TextEditingController();
  bool isPhoneValid = false;
  TextEditingController descriptionController = TextEditingController();
  bool isDescriptionValid = true;

  @override
  Widget build(BuildContext context) {
    void registeration(SignUpController signUpController) {
      String name = Get.arguments['username'];
      String email = Get.arguments['email'];
      String phone = phoneController.text.trim();
      String password = Get.arguments['password'];
      String city = cityController.text.trim();
      String region = regionController.text.trim();
      String street = streetController.text.trim();
      String description = descriptionController.text;

      SignUpModel signUpModel = SignUpModel(
        name: name,
        email: email,
        phone: phone,
        password: password,
        city: city,
        region: region,
        street: street,
        description: description,
      );
      signUpController.registeration(signUpModel);
    }

    return Scaffold(
        resizeToAvoidBottomInset: true,
        // backgroundColor: Colors.red,
        body: GetBuilder<SignUpController>(
          builder: (signUpController) {
            return SafeArea(
              child: Container(
                margin: EdgeInsets.fromLTRB(Dimension.height10,
                    Dimension.height10, Dimension.height10, Dimension.height10),
                //color: Colors.blue,
                height: Dimension.screenHeight,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: AppIcon(
                                backgroundColor: Colors.transparent,
                                iconColor: Color(0xff6d6875),
                                icon: Icons.arrow_back_ios_new_rounded),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Dimension.height30,
                      ),
                      Text(
                        'Enter the delivery address',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: Dimension.font26 * 1.4,
                            color: Color(0xff6d6875),
                            letterSpacing: 2),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: Dimension.width30,
                            right: Dimension.width30,
                            top: Dimension.height50),
                        //color: Colors.black,
                        width: double.infinity,
                        height: Dimension.screenHeight / 1.5,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: Dimension.height50 * 1.5,
                              //color: Colors.blue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextField(
                                    controller: cityController,
                                    decoration: new InputDecoration(
                                      labelText: 'City',
                                      labelStyle:
                                          TextStyle(color: Color(0xff6d6875)),
                                      //icon: new Icon(Icons.email),
                                      // hintText: "nooralden@example.com",
                                      hintStyle:
                                          TextStyle(color: Color(0x4c6d6875)),
                                      // border: ,
                                      suffixIcon: isCityValid
                                          ? Icon(Icons.check,
                                              color: Colors.green)
                                          : null,
                                    ),
                                    onChanged: (text) {
                                      bool isValid = RegExp(r'^[a-zA-Z\s]+$')
                                          .hasMatch(text);

                                      setState(() {
                                        isCityValid = isValid;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: Dimension.height50 * 1.5,
                              //color: Colors.blue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextField(
                                    controller: regionController,
                                    decoration: InputDecoration(
                                      labelText: 'Region',
                                      labelStyle:
                                          TextStyle(color: Color(0xff6d6875)),
                                      // icon: Icon(Icons.person_sharp),
                                      // hintText: "ex:Sarya",
                                      hintStyle:
                                          TextStyle(color: Color(0x4c6d6875)),
                                      // border: InputBorder.none,
                                      suffixIcon: isRegionValid
                                          ? Icon(Icons.check,
                                              color: Colors.green)
                                          : null, // Show a checkmark icon if the username is valid
                                    ),
                                    onChanged: (text) {
                                      // Validate username format when the user enters text
                                      bool isValid = RegExp(r'^[a-zA-Z\s]+$')
                                          .hasMatch(text);

                                      setState(() {
                                        isRegionValid = isValid;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: Dimension.height50 * 1.5,
                              // color: Colors.blue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextField(
                                    controller: streetController,
                                    decoration: new InputDecoration(
                                      labelText: 'Street',
                                      labelStyle:
                                          TextStyle(color: Color(0xff6d6875)),
                                      suffixIcon: isStreetValid
                                          ? Icon(Icons.check,
                                              color: Colors.green)
                                          : null,
                                    ),
                                    onChanged: (text) {
                                      bool isValid = RegExp(r'^[a-zA-Z\s]+$')
                                          .hasMatch(text);

                                      setState(() {
                                        isStreetValid = isValid;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              width: double.infinity,
                              height: Dimension.height50 * 1.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextField(
                                    controller: phoneController,
                                    decoration: new InputDecoration(
                                      labelText: '+963',
                                      labelStyle:
                                          TextStyle(color: Color(0xff6d6875)),
                                      suffixIcon: isPhoneValid
                                          ? Icon(Icons.check,
                                              color: Colors.green)
                                          : null,
                                    ),
                                    onChanged: (text) {
                                      bool isValid =
                                          RegExp(r'^\d{10}$').hasMatch(text);

                                      setState(() {
                                        isPhoneValid = isValid;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: Dimension.height50 * 2,
                              margin: EdgeInsets.symmetric(
                                  vertical: Dimension.height15),
                              //color: Colors.red,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    controller: descriptionController,
                                    minLines: 2,
                                    maxLines: 2,
                                    keyboardType: TextInputType.multiline,
                                    decoration: InputDecoration(
                                      hintText: 'Add a note ',
                                      hintStyle: TextStyle(
                                        color: Color(0xffb5838d),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                    onChanged: (text) {
                                      bool isValid = RegExp(r'^[a-zA-Z\s]*$')
                                          .hasMatch(text);
                                      setState(() {
                                        isDescriptionValid = isValid;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   height: Dimension.height50 * 2,
                            // ),
                            Container(
                              width: double.infinity,
                              //color: Colors.red,
                              child: Column(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      if (isCityValid &&
                                          isRegionValid &&
                                          isStreetValid &&
                                          isPhoneValid) {
                                        registeration(signUpController);
                                        Get.toNamed(routeHelper.getHead("0"));
                                      } else
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.WARNING,
                                          headerAnimationLoop: false,
                                          animType: AnimType.bottomSlide,
                                          title: 'Error',
                                          desc: 'please enter your info',
                                          buttonsTextStyle: const TextStyle(
                                              color: Colors.black),
                                          showCloseIcon: false,
                                          btnCancelOnPress: null,
                                          btnOkOnPress: () {},
                                        ).show();
                                    },
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            Dimension.width5),
                                      ),
                                      backgroundColor: Color(0xffb5838d),
                                    ),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text('Save',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  letterSpacing: 0.8,
                                                  color: Color(0xffffffff),
                                                  height: 1.2,
                                                  fontSize:
                                                      Dimension.font20 * 1.2,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                        Icon(
                                          Icons.exit_to_app,
                                          size: Dimension.width30,
                                        ), // Icon on the right
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
