import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spenmax/model/api/api.dart';
import 'package:spenmax/view-model/home_controller.dart';

class EditUserPopup extends StatelessWidget {
  final String name;
  final String purchasedate;
  final String expirydate;
  final String phone;
  final String district;
  final String state;
  final String address;
  final String dob;
  final String email;
  final String country;
  final String pin;
  final Function(Map<String, String>) onSave;

  EditUserPopup({
    super.key,
    required this.name,
    required this.purchasedate,
    required this.expirydate,
    required this.phone,
    required this.district,
    required this.state,
    required this.address,
    required this.dob,
    required this.email,
    required this.country,
    required this.pin,
    required this.onSave,
  });

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final Api api = Api();
  @override
  Widget build(BuildContext context) {
    // Pre-fill data
    nameController.text = name;
    phoneController.text = phone;
    districtController.text = district;
    stateController.text = state;
    addressController.text = address;
    dobController.text = dob;
    emailController.text = email;
    pinController.text = pin;
    countryController.text = country;

    return AlertDialog(
      title: const Center(child: Text('Edit Profile')),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField(nameController, 'Name'),
              _buildTextField(phoneController, 'Phone'),
              _buildTextField(districtController, 'District'),
              _buildTextField(stateController, 'State'),
              _buildTextField(addressController, 'Address'),
              _buildTextField(dobController, 'Date of Birth'),
              _buildTextField(emailController, 'Email'),
              _buildTextField(pinController, 'Pincode'),
              _buildTextField(countryController, 'Country'),
            ],
          ),
        ),
      ),
      actions: [
        SizedBox(
          height: Get.width / 10,
          width: Get.width / 3.2,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Get.size / 25,
              foregroundColor: Colors.white,
              backgroundColor: Colors.red, // Text color
              side: const BorderSide(color: Colors.red), // Border
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    25.0), // Adjust border radius as needed
              ),
            ),
            child: const Text('Cancel'),
          ),
        ),
        SizedBox(
          height: Get.width / 10,
          width: Get.width / 2.8,
          child: ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await onSave({
                  'name': nameController.text,
                  'phone': phoneController.text,
                  'district': districtController.text,
                  'state': stateController.text,
                  'address': addressController.text,
                  'dob': dobController.text,
                  'email': emailController.text,
                  'pincode': pinController.text,
                  'country': countryController.text,
                });
                Navigator.of(context).pop();
                await api.updateCustomerDetails(
                  name: nameController.text,
                  phone: phoneController.text,
                  district: districtController.text,
                  state: stateController.text,
                  address: addressController.text,
                  dob: dobController.text,
                  email: emailController.text,
                  pincode: pinController.text,
                  country: countryController.text,
                );
                Get.find<HomeController>().reloadData();
              }
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color(0xff668A8D),
              backgroundColor: const Color(0xff668A8D), // Text color
              // side: const BorderSide(color: Colors.black), // Border
              // shape: RoundedRectangleBorder(
              //   borderRadius:
              //       BorderRadius.circular(25.0), // Adjust border radius as needed
              // ),
            ),
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        cursorColor: const Color(0xff668A8D),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Color(0xff668A8D),
                width: 2.0,
              ),
            ),
            labelText: label,
            fillColor: Colors.red,
            border: const OutlineInputBorder(
              borderSide: BorderSide(),
            )),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}
