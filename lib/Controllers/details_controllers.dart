import 'package:get/get.dart';
import 'package:trial_task/Modal/crypto.dart';
import 'package:trial_task/utils/database_controller.dart';

class DetailsController extends GetxController {
  
final DatabaseController dbController = DatabaseController();
 
  
  void markAsFavorites(CryptoCurrenciesData entry){
  entry.isfav = true;
  dbController.updateIsFav(entry);
  Get.back(result: true);

}

void removeFavorites(CryptoCurrenciesData entry){
  entry.isfav = false;
  dbController.updateIsFav(entry);
Get.back(result: true);
}

Future<bool?> checkIsFaV(CryptoCurrenciesData entry) async {
var result = await dbController.findByID(entry);

return result["isfav"] as bool;
}

}