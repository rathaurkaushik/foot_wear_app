import 'package:ecommere_app/controller/login_controller.dart';
import 'package:ecommere_app/pages/home_page.dart';
import 'package:ecommere_app/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController ctrl = Get.put(LoginController()); // Inject controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /// **Title**
            Text(
              'Welcome Back',
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 10),

            /// **Email Field**
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: ctrl.emailController,
              decoration: InputDecoration(
                hintText: 'Email Address',
                labelText: 'Email',
                suffixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 10),

            /// **Password Field**
            TextField(
              keyboardType: TextInputType.visiblePassword,
              controller: ctrl.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                suffixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 10),

            /// **Forgot Password Button**
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ctrl.forgotPassword(); // Call forgot password function
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            /// **Login Button**
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
              ),
              onPressed: () {
                ctrl.loginWithEmail();
              },
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),

            /// **Sign Up Navigation**
            TextButton(
              onPressed: () {
                Get.to(SignupPage());
              },
              child: Text(
                'Register new account',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
