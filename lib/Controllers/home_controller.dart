import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trial_task/Modal/crypto.dart';
import 'package:trial_task/utils/database_controller.dart';
import 'package:trial_task/utils/networks/network_repo.dart';

class HomeController extends GetxController {
  var data = <CryptoCurrenciesData>[].obs;

  final ScrollController scrollController = ScrollController();
  int currentPage = 20;
  int offset = 1;


  final DatabaseController dbController = DatabaseController();

  @override
  void onInit() {
    super.onInit();
    fetchData();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // Load more data when the user reaches the end
        currentPage += 10;
        offset ++;
        fetchData();
      }
    });
  }

  Future<void> resfreshIndigator() async {
    data.clear();
    currentPage = 20;
    fetchData();
  }

  Future<void> fetchData() async {
    
    var jsonMap = await networkRepository.getCryptoList(currentPage.toString());
    if (jsonMap != null) {
      var responseData = CryptoCurrencies.fromJson(jsonMap);
      responseData.data?.forEach((element) {
        dbController.createEntryDB(element);
      });
      data.value = responseData.data!;
    }else{
      var details = await dbController.getAllData(offset);
      data.addAll(details);
    }
  }
}
