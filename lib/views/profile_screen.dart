import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spenmax/model/api/api.dart';
import 'package:spenmax/model/components/appbar.dart';
import 'package:spenmax/model/components/bottom_nav_bar.dart';
import 'package:spenmax/model/components/loader.dart';
import 'package:spenmax/view-model/home_controller.dart';
import 'package:spenmax/view-model/image_picker_serviece.dart';
import 'package:spenmax/views/common/edit.dart';
import 'package:spenmax/views/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final Api api = Api();
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(leading: false),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: LottieLoader());
        }

        final user = controller.userDetails;
        final imageurl = user['image'] ?? 'null';

        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: Get.width,
                  height: 190,
                  decoration: BoxDecoration(
                      color: const Color(0xff657575),
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: imageurl == 'null'
                                ? Image.asset(
                                    "assets/images/man.png",
                                    width: 100,
                                    height: 100,
                                  )
                                : Image.network(
                                    imageurl,
                                    width: 100,
                                    height: 100,
                                  ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                _pickAndUploadImage(
                                    context, user['id'].toString());
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors
                                      .orange, // Edit button background color
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.mode_edit_outlined,
                                  color: Colors.white,
                                  size: 20, // Icon size
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            user['name'] ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            user['customer_id'] ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(color: Colors.grey),
              ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                title: Text(
                  user['number'] ?? '',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  'phone number',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                title: Text(
                  user['email_id'] ?? '',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.calendar_month,
                  color: Colors.black,
                ),
                title: Text(
                  user['dob'] ?? '',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  'Date of Birth',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: Colors.black,
                ),
                title: Text(
                  user['address'] ?? '',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  'Address',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.location_city,
                  color: Colors.black,
                ),
                title: Text(
                  user['district'] ?? '',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  'District',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.location_city_rounded,
                  color: Colors.black,
                ),
                title: Text(
                  user['state'] ?? '',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  'State',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.location_city_rounded,
                  color: Colors.black,
                ),
                title: Text(
                  user['country'] ?? '',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  'Country',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.pin_drop_rounded,
                  color: Colors.black,
                ),
                title: Text(
                  user['pincode'] ?? '',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  'Pin Code',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Divider(color: Colors.grey),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () async {
                        _showEditPopup(context);
                      },
                      child: Row(
                        children: [
                          Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        await api.deleteSessionId();
                        Get.to(() => LoginScreen());
                      },
                      child: Row(
                        children: [
                          Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red.shade500,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.red.shade500,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  void _showEditPopup(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    final user = controller.userDetails;

    showDialog(
      context: context,
      builder: (context) {
        return EditUserPopup(
          name: user['name'] ?? '',
          purchasedate:
              (user['package_c'] != null && user['package_c'].isNotEmpty)
                  ? user['package_c'][0]['purchase_date']
                  : 'Expired',
          expirydate:
              (user['package_c'] != null && user['package_c'].isNotEmpty)
                  ? user['package_c'][0]['expiry_date']
                  : 'Expired',
          phone: user['number'] ?? '',
          district: user['district'] ?? '',
          state: user['state'] ?? '',
          address: user['address'] ?? '',
          dob: user['dob'] ?? '',
          email: user['email_id'] ?? '',
          country: user['country'] ?? '',
          pin: user['pincode'] ?? '',
          onSave: (updatedData) {
            // Handle the updated data, e.g., update state or save to a database.
            print('Updated Data: $updatedData');
          },
        );
      },
    );
  }

  Future<void> _pickAndUploadImage(BuildContext context, uid) async {
    final Api api = Api();

    try {
      // Pick the image
      final selectedImage = await pickImage();
      if (selectedImage != null) {
        // Upload the image
        final isUploaded = await api.uploadImage(uid, selectedImage);
        if (isUploaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Image uploaded successfully!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to upload image.')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No image selected.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }
}
