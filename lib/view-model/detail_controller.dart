import 'package:get/get.dart';
import 'package:spenmax/model/api/api.dart';

class CompanyController extends GetxController {
  final Api api = Api();

  // Observables
  var isLoading = true.obs;
  var companyDetails = {}.obs;

  // Fetch data from the API
  Future<void> fetchCompanyData(String id) async {
    isLoading.value = true;
    try {
      final data = await api.fetchPartnerDetails(id);
      companyDetails.value = data;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
