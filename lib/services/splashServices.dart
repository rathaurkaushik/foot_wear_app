import 'dart:async';
import 'package:get/get.dart';
import 'package:ecommere_app/pages/home_page.dart';
import 'package:ecommere_app/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final _auth = FirebaseAuth.instance;

    final user = _auth.currentUser;

    // Add delay or make sure navigation happens after the first frame is drawn
    Timer(
      Duration(seconds: 2),
          () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (user != null) {
            // Navigate to HomePage if the user is logged in
            Get.to(HomePage());
          } else {
            // Navigate to LoginPage if no user is logged in
            Get.to(LoginPage());
          }
        });
      },
    );
  }
}
