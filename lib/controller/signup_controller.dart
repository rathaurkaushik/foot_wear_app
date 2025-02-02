import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommere_app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:otp_text_field_v2/otp_text_field_v2.dart';

class SignupController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference usersCollection;

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  bool visible = false;
  int? otpSend;
  int? otpEnter;

  @override
  void onInit() {
    usersCollection = firestore.collection('users');
    super.onInit();
  }
  Future<void> addUser() async {
    try {
      // Validate OTP first
      if (otpEnter != otpSend) {
        Get.snackbar(
          'Error', 'OTP is incorrect',
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
        return;
      }

      // Get a reference to a new document
      DocumentReference doc = usersCollection.doc();

      // Ensure number is valid before parsing
      String numberText = numberController.text.trim();
      int? parsedNumber = int.tryParse(numberText);

      if (parsedNumber == null) {
        Get.snackbar(
          'Error', 'Invalid phone number',
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
        return;
      }

      // Create User object
      User user = User(
        id: doc.id,
        name: nameController.text.trim(),
        number: parsedNumber,
      );

      // Convert to JSON and add to Firestore
      final userJson = user.toJson();
      await doc.set(userJson);

      // Show success message
      Get.snackbar(
        'Success', 'User registered successfully',
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );

      // Clear input fields after successful signup
      nameController.clear();
      numberController.clear();

    } catch (e) {
      // Handle and show error messages
      Get.snackbar(
        'Error', 'Failed to register: ${e.toString()}',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }

  sendOtp(){
    try {
      if (nameController.text.isEmpty || numberController.text.isEmpty) {
        Get.snackbar('Failed', 'Please fill all details',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
      else {
        final random = Random();
        int otp = 1000 + random.nextInt(9000);
        print("My OTP "+otp.toString());
        if (otp != null) {
          visible = true;
          otpSend = otp;
          Get.snackbar(
              'Success', 'Otp send successfully', colorText: Colors.white,
              backgroundColor: Colors.green);
        }
        else {
          Get.snackbar('Error', 'Otp not send !!', colorText: Colors.white,
              backgroundColor: Colors.red);
        }
      }
      }
    catch (e) {
      Get.snackbar('Error', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }finally{
      update();
    }

  }
}
