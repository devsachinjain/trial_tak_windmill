import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trial_task/Controllers/fav_controller.dart';
import 'package:trial_task/Modal/crypto.dart';

import 'package:trial_task/View/detail_screen.dart';



class FavScreen extends StatefulWidget {
  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  final FavController favController = Get.put(FavController());

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    favController.fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Obx(() => favController.data.isEmpty ? const Center(child: Text("No favourites elements are avilable"),) : ListView.builder(

itemCount: favController.data.length ,
      itemBuilder: (BuildContext context, int index) {

        // if (index < favController.data.length) {
CryptoCurrenciesData data = favController.data[index];

        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            final result = await Get.to( DetailScreen( false, element: favController.data[index],));
              if (result){
                favController.fetchData();
              }
            
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            child:  ListTile(
              leading: Text("${index +1 }"),
              title: Text(data.name ?? ""),
            subtitle: Text(data.symbol ?? ""),
              trailing: const Icon(Icons.favorite,color: Colors.red,),
            ),
          ),
        );

        // }else {
        //         return const Padding(
        //           padding:  EdgeInsets.all(8.0),
        //           child: Center(
        //             child: CircularProgressIndicator(),
        //           ),
        //         );
        //       }
        
        
      },
    ));
  }
}



     

  