import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


NetworkRepository networkRepository = NetworkRepository();

class NetworkRepository {
  static final NetworkRepository _networkRepository =
      NetworkRepository._internal();

  factory NetworkRepository() {
    return _networkRepository;
  }

  NetworkRepository._internal();

  // Auth SignUp

  getCryptoList(String index) async {
    var client = http.Client();
    var api = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/map?limit=$index";
    var headers = {
        'X-CMC_PRO_API_KEY': '21f82a7c-19b6-4eba-8d3a-95f60eeac0b2'
    };
    try {
      var request = await client.get(Uri.parse(api),headers: headers);
      Map<String, dynamic> response = jsonDecode(request.body);
      return response;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}

