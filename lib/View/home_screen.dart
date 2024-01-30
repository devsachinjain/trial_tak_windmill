import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trial_task/Controllers/home_controller.dart';
import 'package:trial_task/Modal/crypto.dart';
import 'package:trial_task/View/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      
      onRefresh: () => homeController.resfreshIndigator(),

      child: Obx(() => homeController.data.isEmpty
          ? const CircularProgressIndicator()
          : ListView.builder(
              controller: homeController.scrollController,
              itemCount: homeController.data.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index < homeController.data.length) {
                  CryptoCurrenciesData data = homeController.data[index];
                  return InkWell(
                    onTap: () async {
                      final result = await Get.to(DetailScreen(
                        true,
                        element: data,
                      ));
                      if (result) {}
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(data.name ?? ""),
                        subtitle: Text(data.symbol ?? ""),
                        // trailing: IconButton(onPressed: (){
                        //   homeController.markAsFavorites(data);

                        // }, icon:  Obx(() {
                        //   return Icon(homeController.data[index].isfav ?? false ? Icons.favorite : Icons.favorite_border) ;
                        // }) ,)
                      ),
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            )),
    );
  }
}
