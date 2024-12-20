import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spenmax/model/api/api.dart';
import 'package:spenmax/views/forget_password.dart';
import 'package:spenmax/views/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // Create controllers for email and password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Api api = Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8ECEF), // Background color
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  height: Get.height / 1.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      width: 3,
                      color: const Color(0xFF629A9F), // Border color
                    ),
                  ),
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      // Logo
                      Image.asset(
                        'assets/images/logob.png', // Replace with your logo asset path
                        height: 50,
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Email TextField
                      TextField(
                        controller: emailController, // Attach the controller
                        cursorColor: const Color(0xFF629A9F),
                        decoration: InputDecoration(
                          focusColor: const Color(0xFF629A9F),
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF629A9F)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Password TextField
                      TextField(
                        controller: passwordController, // Attach the controller
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => ForgetPassword());
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Forgot your password?',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                              ),
                              Icon(
                                Icons.arrow_right_alt,
                                color: Colors.red,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFF539B9B), // Button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () {
                            // Handle login action
                            final email = emailController.text;
                            final password = passwordController.text;
                            api.authenticate(email, password);
                            // print("Email: $email, Password: $password");
                          },
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Doesn't have an account yet?",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SignupScreen());
                            },
                            child: const Text(
                              ' Sign Up',
                              style: TextStyle(
                                  color: Color(0xFF539B9B),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
