import 'package:ecommere_app/controller/signup_controller.dart';
import 'package:ecommere_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(builder: (ctrl) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /// **Title**
              Text(
                'Create Your Account !!',
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

              /// **Confirm Password Field**
              TextField(
                keyboardType: TextInputType.visiblePassword,
                controller: ctrl.confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  labelText: 'Confirm Password',
                  suffixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 10),

              /// **Sign Up Button**
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
                ),
                onPressed: () {
                  ctrl.signUpWithEmail();
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 10),

              /// **Login Navigation**
              TextButton(
                onPressed: () {
                  Get.to(LoginPage());
                },
                child: Text(
                  'Already have an account? Login',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
