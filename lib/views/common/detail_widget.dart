import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    super.key,
    required this.name,
    required this.number,
    required this.email,
    required this.country,
    required this.state,
    required this.district,
    required this.town,
    required this.address,
    required this.pincode,
    required this.locality,
    required this.registeredaddress,
    required this.keyperson,
    required this.contact,
    required this.ig,
    required this.fb,
    required this.yt,
    required this.logo,
  });
  final String name;
  final String number;
  final String email;
  final String country;
  final String state;
  final String district;
  final String town;
  final String address;
  final String pincode;
  final String locality;
  final String registeredaddress;
  final String keyperson;
  final String contact;
  final String ig;
  final String fb;
  final String yt;
  final String logo;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // Rounded corners
        border: Border.all(
          color: Colors.grey, // Border color
          width: 1, // Border width
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Main image with circular overlay
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none, // Allow overflow for circular image
              children: [
                // Main image
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0), // Rounded top-left
                      topRight: Radius.circular(20.0), // Rounded top-right
                    ),
                    child: Image.network(
                      'https://users.spenmax.in/Default_i_need_to_default_image_for_our_partners_for_my_web_ap_1.jpg',
                      width: Get.width,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Circular overlay with white background
                Positioned(
                  bottom: -30, // Adjust position of circular image
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white, // White background
                      shape: BoxShape.circle, // Makes it circular
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.grey.withOpacity(0.5), // Optional shadow
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                          4.0), // Add padding for white border
                      child: ClipOval(
                        child: Image.network(
                          logo, // Circular image
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              name,
              style: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                const Text(
                  "Mobile Number",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  number,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                const Text(
                  'Email',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  email,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                const Text(
                  'Country',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  country,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                const Text(
                  'State',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  state,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                const Text(
                  'District',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  district,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                const Text(
                  'Town',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  town,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                const Text(
                  'PinCode',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  pincode,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                const Text(
                  'Address',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  address,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                const Text(
                  'Locality',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  locality,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                const Text(
                  'RegisteredAddress',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  registeredaddress,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                const Text(
                  "Key Person Name",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  keyperson,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                const Text(
                  "Key Person Contact",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  contact,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(26, 26, 26, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialMediaButton(
                    label: "Instagram",
                    icon: Image.network(
                        'https://users.spenmax.in/instagram%20(1).png'), // Replace with actual path
                    onPressed: () {
                      print('Instagram');
                    },
                  ),
                  const Spacer(),
                  _socialMediaButton(
                    label: "Facebook",
                    icon: Image.network(
                        'https://users.spenmax.in/facebook.png'), // Replace with actual path
                    onPressed: () {
                      print('Facebook');
                    },
                  ),
                  const Spacer(),
                  _socialMediaButton(
                    label: "Youtube",
                    icon: Image.network(
                        'https://users.spenmax.in/youtube%20(1).png'), // Replace with actual path
                    onPressed: () {
                      print('YouTube');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _socialMediaButton({
    required Image icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // color: Colors.grey[200], // Customize button color
            ),
            child: icon,
          ),
        ),
        const SizedBox(height: 3), // Add spacing between icon and label
        Text(
          label,
          style: const TextStyle(fontSize: 12), // Customize label style
        ),
      ],
    );
  }
}
