import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:spenmax/model/api/api.dart';
import 'package:spenmax/model/components/loader.dart';

import 'package:spenmax/views/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController dobController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController pincodeController = TextEditingController();

  final Api api = Api();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String country = "";
  String state = "";
  String city = "";
  bool isButtonDisabled = false;

  void handleSignUp() {
    if (!isButtonDisabled) {
      setState(() {
        isButtonDisabled = true; // Disable the button
      });
      // Perform your sign-up logic here
      api.usersignup(
        nameController.text,
        emailController.text,
        phoneController.text,
        dobController.text,
        addressController.text,
        pincodeController.text,
        passwordController.text,
        country,
        state,
        city,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            width: Get.width,
            height: Get.height / 1.2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                width: 3,
                color: const Color(0xFF629A9F), // Border color
              ),
            ),
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/images/logob.png', // Replace with your logo asset path
                      height: 50,
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Name
                    _buildTextField(
                      label: 'Name',
                      controller: nameController,
                      validator: (value) =>
                          value!.isEmpty ? "Name cannot be empty" : null,
                    ),
                    const SizedBox(height: 16),
                    // Email
                    _buildTextField(
                      label: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cannot be empty";
                        } else if (!GetUtils.isEmail(value)) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Phone
                    _buildTextField(
                      label: 'Phone',
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) => value!.isEmpty
                          ? "Phone number cannot be empty"
                          : null,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: dobController,
                        keyboardType: TextInputType.datetime,
                        obscureText: false,
                        cursorColor: const Color(0xFF629A9F),
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF629A9F)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF629A9F)),
                          ),
                        ),
                        validator: (value) => value!.isEmpty
                            ? "Date of Birth cannot be empty"
                            : null,
                        onTap: _openDatePicker,
                      ),
                    ),

                    // Date of Birth
                    // _buildTextField(
                    //   label: 'Date of Birth',
                    //   controller: dobController,
                    //   keyboardType: TextInputType.datetime,
                    //   validator: (value) => value!.isEmpty
                    //       ? "Date of Birth cannot be empty"
                    //       : null,
                    // ),
                    const SizedBox(height: 16),
                    // Address
                    _buildTextField(
                      label: 'Address',
                      controller: addressController,
                      validator: (value) =>
                          value!.isEmpty ? "Address cannot be empty" : null,
                    ),
                    const SizedBox(height: 16),
                    // Pincode
                    _buildTextField(
                      label: 'Pincode',
                      controller: pincodeController,
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value!.isEmpty ? "Pincode cannot be empty" : null,
                    ),
                    const SizedBox(height: 16),
                    CSCPicker(
                      ///Enable disable state dropdown [Optional Parameter]
                      showStates: true,
                      selectedItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      layout: Layout.vertical,

                      ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                      dropdownHeadingStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),

                      ///DropdownDialog Item style [OPTIONAL PARAMETER]
                      dropdownItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),

                      /// Enable disable city dropdown [Optional Parameter]
                      // showCities: true,
                      flagState: CountryFlag.DISABLE,

                      /// Country dropdown label
                      countryDropdownLabel: "Select Country",

                      /// State dropdown label
                      stateDropdownLabel: "Select State",

                      /// City dropdown label
                      cityDropdownLabel: "Select City",

                      /// Default Country
                      defaultCountry: CscCountry.India,

                      /// Dropdown decoration
                      dropdownDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                      ),

                      /// When selected Country, State, and City
                      onCountryChanged: (value) {
                        setState(() {
                          country = "India";
                        });
                      },
                      onStateChanged: (value) {
                        setState(() {
                          state = value ?? "";
                        });
                      },
                      onCityChanged: (value) {
                        print(country);
                        setState(() {
                          city = value ?? "";
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    // Password
                    _buildTextField(
                      label: 'Password',
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) =>
                          value!.isEmpty ? "Password cannot be empty" : null,
                    ),
                    const SizedBox(height: 16),
                    // Confirm Password
                    _buildTextField(
                      label: 'Confirm Password',
                      controller: confirmPasswordController,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Confirm Password cannot be empty";
                        } else if (value != passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
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
                          if (isButtonDisabled) return;

                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // Prevent dismissing the dialog by tapping outside
                              builder: (BuildContext context) {
                                return const LottieLoader();
                              },
                            );
                            handleSignUp(); // Perform the sign-up action

                            // Future.delayed(const Duration(seconds: 3), () {
                            //   // Close the loading dialog after 3 seconds
                            //   // ignore: use_build_context_synchronously
                            //   Navigator.of(context)
                            //       .pop(); // This will close the dialog
                            // });
                          }
                        },
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openDatePicker() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1920, 1, 1),
      maxTime: DateTime(2100, 12, 31),
      onConfirm: (date) {
        setState(() {
          dobController.text =
              "${date.year}-${date.month}-${date.day}"; // Update text field
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: const Color(0xFF629A9F),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xFF629A9F)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xFF629A9F)),
        ),
      ),
      validator: validator,
    );
  }
}
