import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:spenmax/model/components/active_badge.dart';
import 'package:spenmax/model/components/bottom_nav_bar.dart';

class HomeContainer extends StatelessWidget {
  HomeContainer(
      {super.key,
      required this.imageurl,
      required this.customerid,
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
      required this.package,
      required this.ishome});
  final String imageurl;
  final bool ishome;
  final String customerid;
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
  final String package;
  final BottomNavBarController controller = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // height: Get.height,
        decoration: BoxDecoration(
          color: const Color(0xffC1DCDC),
          borderRadius:
              BorderRadius.circular(20), // Adjust the value for rounded corners
          // border: Border.all(
          //   color: Colors.black, // Border color
          //   width: 2, // Border width
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 14,
              ),
              ActiveBadge(package: package),
              const SizedBox(
                height: 14,
              ),
              Center(
                child: Container(
                  width: Get.width / 1.2,
                  height: Get.height / 1.5,
                  decoration: BoxDecoration(
                      color: const Color(0xff82AEB0),
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 14,
                        ),
                        GlassmorphicContainer(
                          width: Get.width / 1,
                          height: Get.width / 1.2,
                          borderRadius: 10,
                          blur: 0,
                          alignment: Alignment.center,
                          border: 0,
                          linearGradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.1),
                              const Color.fromARGB(255, 255, 254, 254)
                                  .withOpacity(0.1),
                            ],
                          ),
                          borderGradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0),
                              const Color.fromARGB(255, 255, 254, 254)
                                  .withOpacity(0),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Image
                              CircleAvatar(
                                radius:
                                    50, // Adjusted to maintain the 100x100 size
                                backgroundColor: Colors.grey
                                    .shade200, // CircleAvatar background color
                                child: ClipOval(
                                  child: imageurl == 'null'
                                      ? Image.asset(
                                          "assets/images/man.png",
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit
                                              .cover, // Ensures the image is cropped and fills the circle
                                        )
                                      : Image.network(
                                          imageurl,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit
                                              .cover, // Ensures the image is cropped and fills the circle
                                        ),
                                ),
                              ),

                              const SizedBox(
                                height: 16,
                              ),
                              // Title
                              Text(
                                name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),

                              // Card details
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "Customer ID: $customerid",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color:
                                        const Color.fromARGB(255, 255, 255, 255)
                                            .withOpacity(0.8),
                                    fontSize: 16,
                                  ),
                                ),
                              ),

                              // Elevated button with glassmorphic effect
                              ishome
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                          shadowColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                        onPressed: () {
                                          controller.navigateToScreen(3);
                                          // Add your action here
                                        },
                                        child: const Text(
                                          "View Profile",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ))
                                  : const SizedBox()
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Row(
                          children: [
                            Text(
                              "Purchase Date",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Expiry Date",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          children: [
                            Text(
                              purchasedate,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              expirydate,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Center(
                          child: GlassmorphicContainer(
                            width: 160,
                            height: 50,
                            borderRadius: 25,
                            blur: 100,
                            alignment: Alignment.center,
                            border: 1,
                            linearGradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.1),
                                Colors.white.withOpacity(0.05),
                              ],
                            ),
                            borderGradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.2),
                                Colors.white.withOpacity(0.1),
                              ],
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              onPressed: () {
                                controller.navigateToScreen(1);

                                // Add your action here
                              },
                              child: const Text(
                                "Find Partners",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      color: Colors.white,
                    ),
                    const Text(
                      "Full Name",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    const Text(
                      "Phone",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      phone,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    const Text(
                      "District",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      district,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    const Text(
                      "State",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      state,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    const Text(
                      "Address",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      address,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    const Text(
                      "Date of birth",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      dob,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    const Text(
                      "Pincode",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      pin,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    const Text(
                      "Country",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      country,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    ishome
                        ? const SizedBox()
                        : Row(
                            children: [
                              const Spacer(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                onPressed: () {
                                  // Add your action here
                                },
                                child: const Text(
                                  "Edit",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      child: Image.network(
                          "https://users.spenmax.in/ad-area@2x.png"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
