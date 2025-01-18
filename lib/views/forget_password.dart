import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spenmax/model/api/api.dart';
import 'package:spenmax/model/components/snackbar.dart';
import 'package:spenmax/views/login_screen.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final TextEditingController emailController = TextEditingController();
  final Api api = Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
              width: Get.width,
              height: Get.height / 1.8,
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
                    'Forgot Password',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    controller: emailController, // Attach the controller
                    cursorColor: const Color(0xFF629A9F),
                    decoration: InputDecoration(
                      focusColor: const Color(0xFF629A9F),
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Color(0xFF629A9F)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
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
                        if (emailController.text == "") {
                          showCustomSnackbar(
                            message: "Invalid Email Address",

                            title: 'Error',
                            position: SnackPosition.TOP,
                            backgroundColor: Colors.black, // Background color
                          );
                        } else {
                          api.forgetpassword(email);
                        }
                        // api.authenticate(email, password);
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
                        "Already have an account ?",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.off(() => const LoginScreen());
                        },
                        child: const Text(
                          ' Log In',
                          style: TextStyle(
                              color: Color(0xFF539B9B),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
