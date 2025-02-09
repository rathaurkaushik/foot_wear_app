import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/home_page.dart';

class LoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  /// **Login with Email & Password**
  Future<void> loginWithEmail() async {
    try {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        Get.snackbar(
          'Error', 'Email and password are required',
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
        return;
      }

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        Get.snackbar(
          'Success', 'Login successful!',
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );
        Get.offAll(HomePage()); // Navigate to home page after login
      }
    } catch (e) {
      Get.snackbar(
        'Error', 'Login failed: ${e.toString()}',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }

  /// **Forgot Password - Send Reset Email**
  Future<void> forgotPassword() async {
    try {
      String email = emailController.text.trim();

      if (email.isEmpty) {
        Get.snackbar(
          'Error', 'Please enter your email to reset password',
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
        return;
      }

      await auth.sendPasswordResetEmail(email: email);

      Get.snackbar(
        'Success', 'Password reset email sent! Check your inbox.',
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );
    } catch (e) {
      Get.snackbar(
        'Error', 'Failed to send reset email: ${e.toString()}',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }
}
