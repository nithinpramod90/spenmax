import 'package:get/get.dart';
import 'package:spenmax/model/api/api.dart';

class BranchesController extends GetxController {
  final Api api = Api();
  var branches = <dynamic>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBranchesData();
  }

  void fetchBranchesData({String? category, String? search}) async {
    try {
      isLoading(true);
      var fetchedBranches = await api.fetchBranches(
        category: category,
        search: search,
      );
      branches.assignAll(fetchedBranches);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
