import 'package:get/get.dart';
import 'package:trial_task/utils/database_controller.dart';

class FavController extends GetxController {
  RxList data = [].obs;
  final DatabaseController dbController = DatabaseController();
  static const int itemsPerPage = 10;
 var currentPage = 0.obs;


 @override
  void onInit() {
    super.onInit();
    fetchData();
  }



  Future<void> fetchData() async {


    var details = await dbController.getAllFav();
    data.value = details.toList();
    
  }
}






