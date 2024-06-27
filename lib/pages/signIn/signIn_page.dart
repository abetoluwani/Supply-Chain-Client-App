import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademale/conrtollers/signIn_controller.dart';
import 'package:trademale/models/signIn_Model.dart';
import 'package:trademale/utilities/dimensions.dart';
import 'package:trademale/utilities/routeHelper.dart';

import '../../widgets/app_icon.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool secure = true;
  bool agree = false;

  TextEditingController emailController = TextEditingController();
  bool isEmailValid = false;
  TextEditingController passwordController = TextEditingController();
  bool isPasswordValid = false;

  @override
  Widget build(BuildContext context) {
    void login(SignInController signInController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      SignInModel signInModel = SignInModel(email: email, password: password);
      signInController.login(signInModel);
    }

    return Scaffold(
        resizeToAvoidBottomInset: true,
        // backgroundColor: Colors.red,
        body: GetBuilder<SignInController>(
          builder: (signInController) {
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
                              Get.toNamed(routeHelper.getSignUp());
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
                        'Let\'s Sign You In',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: Dimension.font26 * 1.4,
                            color: Color(0xff6d6875),
                            letterSpacing: 2),
                      ),
                      Text(
                        ' welcome back,you\'ve been missed!',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: Dimension.font12 * 1.4,
                            color: Color(0xffb5838d),
                            letterSpacing: 1),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: Dimension.width30,
                            right: Dimension.width30,
                            top: Dimension.height50),
                        // color: Colors.black,
                        width: double.infinity,
                        height: Dimension.screenHeight / 1.5,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: Dimension.height50 * 2,
                              //color: Colors.blue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: Dimension.font12 * 1.4,
                                        color: Color(0xff6d6875),
                                        letterSpacing: 1),
                                  ),
                                  SizedBox(
                                    height: Dimension.height5,
                                  ),
                                  TextField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.person_sharp),
                                      hintText: "ex:alma@gmail.com",
                                      hintStyle:
                                          TextStyle(color: Color(0x4c6d6875)),
                                      border: InputBorder.none,
                                      suffixIcon: isEmailValid
                                          ? Icon(Icons.check,
                                              color: Colors.green)
                                          : null, // Show a checkmark icon if the username is valid
                                    ),
                                    onChanged: (text) {
                                      // Validate username format when the user enters text
                                      bool isValid = RegExp(
                                              r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                          .hasMatch(text);
                                      setState(() {
                                        isEmailValid = isValid;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: Dimension.height50 * 2,
                              // color: Colors.blue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Password',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: Dimension.font12 * 1.4,
                                        color: Color(0xff6d6875),
                                        letterSpacing: 1),
                                  ),
                                  SizedBox(
                                    height: Dimension.height5,
                                  ),
                                  TextField(
                                    controller: passwordController,
                                    obscureText: secure,
                                    decoration: new InputDecoration(
                                      icon: new Icon(Icons.lock),
                                      border: InputBorder.none,
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            secure = !secure;
                                          });
                                        },
                                        child: passwordController.text.length >=
                                                8
                                            ? secure == false
                                                ? Icon(
                                                    Icons.visibility_outlined,
                                                    color: Colors.green,
                                                  )
                                                : Icon(
                                                    Icons
                                                        .visibility_off_outlined,
                                                    color: Colors.green,
                                                  )
                                            : secure == true
                                                ? Icon(
                                                    Icons
                                                        .visibility_off_outlined,
                                                  )
                                                : Icon(
                                                    Icons.visibility_outlined),
                                      ),
                                    ),
                                    onChanged: (text) {
                                      setState(() {
                                        bool isValid = text.length >= 8;
                                        isPasswordValid = isValid;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: Dimension.width10,
                                  right: Dimension.width10 * 7,
                                  top: Dimension.height15),
                              width: double.infinity,
                              height: Dimension.height30 * 2.5,
                              //color: Colors.blue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        child: agree == false
                                            ? Icon(
                                                Icons.check_box_outline_blank)
                                            : Icon(Icons.check_box),
                                        onTap: () {
                                          setState(() {
                                            agree = !agree;
                                          });
                                        },
                                      ),
                                      SizedBox(width: Dimension.width10),
                                      Flexible(
                                        child: Text(
                                          'Remember me',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: Dimension.font12,
                                            color: Color(0xff6d6875),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Dimension.height50 * 1.7,
                            ),
                            Container(
                              width: double.infinity,
                              //color: Colors.red,
                              child: Column(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      if (isPasswordValid && isEmailValid) {
                                        login(signInController);
                                        print('correct');
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
                                          child: Text('Sign In',
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
                                  SizedBox(
                                    height: Dimension.height10,
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Don\'t have an account?',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: Dimension.font12 * 1.15,
                                              color: Color(0xff6d6875),
                                              letterSpacing: 1),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                routeHelper.getSignUp());
                                          },
                                          child: Text(
                                            ' Sign up',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize:
                                                    Dimension.font12 * 1.15,
                                                color: Color(0xff6d6875),
                                                letterSpacing: 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
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
