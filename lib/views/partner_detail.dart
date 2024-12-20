import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spenmax/model/components/active_badge.dart';
import 'package:spenmax/model/components/appbar.dart';
import 'package:spenmax/model/components/welcome_text.dart';
import 'package:spenmax/view-model/detail_controller.dart';
import 'package:spenmax/views/common/detail_widget.dart';
import 'package:spenmax/views/common/offer_widget.dart';

class PartnerDetail extends StatelessWidget {
  PartnerDetail({super.key, required this.id});
  final String id;
  final CompanyController _controller = Get.put(CompanyController());

  @override
  Widget build(BuildContext context) {
    // Trigger API fetch for the given ID
    _controller.fetchCompanyData(id);

    return Scaffold(
      appBar: CustomAppBar(
        leading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section for loading state
            Obx(() {
              if (_controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return const SizedBox.shrink(); // Empty space when not loading
            }),

            // Section for data
            Obx(() {
              final company = _controller.companyDetails.value;
              if (company.isEmpty) {
                return const Center(child: Text("No data found"));
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WelcomeText(),
                  const SizedBox(height: 10),
                  const ActiveBadge(
                    package: 'Spenmax The Grand Package',
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(5)),
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 1, // Border width
                        ),
                      ),
                      // height: Get.width / 1.2,
                      padding: const EdgeInsets.all(12),
                      width: Get.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DetailWidget(
                            contact: company['KeyPersonContact'],
                            keyperson: company['KeyPersonName'],
                            registeredaddress: company['company']
                                ['head_office_address'],
                            locality: company['Locality'],
                            pincode: company['PinCode'],
                            address: company['RegisteredAddress'],
                            town: company['Town'],
                            district: company['District'],
                            state: company['State'],
                            country: company['country'],
                            name: company['company']['organization'],
                            number: company['company']['mobile_number'],
                            email: company['company']['email_id'],
                            ig: company['company']['instagram_link'],
                            fb: company['company']['facebook_link'],
                            yt: company['company']['youtube_link'],
                            logo: company['company']['logo'] ??
                                "https://users.spenmax.in/icons8-shop-100.png",
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            "Partner Details",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const OfferWidget()
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
