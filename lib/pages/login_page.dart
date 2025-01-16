import 'package:ecommere_app/pages/home_page.dart';
import 'package:ecommere_app/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome Back',
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Mobile Number',
                  labelText: 'Mobile Number',
                  suffixIcon: Icon(Icons.phone_android_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.deepPurple)),
                onPressed: () {
                  Get.to(HomePage());
                },
                child: Text(
                  'Login',
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                )),
            TextButton(
                onPressed: () {
                  Get.to(SignupPage());
                },
                child: Text(
                  'Register new account',
                  style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
