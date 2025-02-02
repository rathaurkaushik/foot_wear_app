import 'package:ecommere_app/controller/signup_controller.dart';
import 'package:ecommere_app/pages/home_page.dart';
import 'package:ecommere_app/pages/login_page.dart';
import 'package:ecommere_app/widgets/OTP_FEILD.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(builder: (ctrl) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Create Your Account !!',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: ctrl.nameController,
                decoration: InputDecoration(
                    hintText: 'Your Name',
                    labelText: 'Your Name',
                    suffixIcon: Icon(Icons.phone_android_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: ctrl.numberController,
                decoration: InputDecoration(
                    hintText: 'Mobile Number',
                    labelText: 'Mobile Number',
                    suffixIcon: Icon(Icons.phone_android_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 10,
              ),
              OtpTextField(
                otpController: ctrl.otpController,
                visible: ctrl.visible,
                onComplete: (otp) {
                  ctrl.otpEnter = int.tryParse(otp);
                },
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.deepPurple)),
                  onPressed: () {
                    if (ctrl.visible) {
                      ctrl.addUser();
                    } else {
                      ctrl.sendOtp();
                    }
                  },
                  child: Text(
                    ctrl.visible ? 'Verify' : 'Send OTP',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              TextButton(onPressed: (){
                Get.to(LoginPage());
              }, child: Text('Login',style: TextStyle(
                fontSize: 15,
                  color: Colors.deepPurple, fontWeight: FontWeight.bold),))
            ],
          ),
        ),
      );
    });
  }
}
