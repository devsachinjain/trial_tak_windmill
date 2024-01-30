import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trial_task/Controllers/details_controllers.dart';
import 'package:trial_task/Modal/crypto.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  final bool fromMainScreen;
  final CryptoCurrenciesData element;

  DetailScreen(this.fromMainScreen, {super.key, required this.element});
  final DetailsController detailsController = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: const Text("Cryptocurrency"),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                
                title: Text(" Name:-     ${element.name ?? "?"}"),
              ),
              Divider(),
              ListTile(
                
                title: Text(" Symbol:-   ${element.symbol ?? "?"}"),
              ),
              Divider(),
              ListTile(
                
                title: Text(" slug:-        ${element.slug ?? "?"}"),
              ),
              
              Divider(),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  if (fromMainScreen) {
                    detailsController.markAsFavorites(element);
                  } else {
                    detailsController.removeFavorites(element);
                  }
                },
                child: Text(fromMainScreen
                    ? "Add to favorites"
                    : "Remove From favorites"),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
