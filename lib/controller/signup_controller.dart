import 'package:ecommere_app/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }


  /// **Sign Up with Email & Password**
  Future<void> signUpWithEmail() async {
    try {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String confirmPassword = confirmPasswordController.text.trim();

      if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        Get.snackbar(
          'Error', 'All fields are required',
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
        return;
      }

      if (password != confirmPassword) {
        Get.snackbar(
          'Error', 'Passwords do not match',
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
        return;
      }

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        Get.to(HomePage());
        Get.snackbar(
          'Success', 'Account created successfully!',
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error', 'Sign-up failed: ${e.toString()}',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }
}
