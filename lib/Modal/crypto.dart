// To parse this JSON data, do
//
//     final cryptoCurrencies = cryptoCurrenciesFromJson(jsonString);

import 'dart:convert';

CryptoCurrencies cryptoCurrenciesFromJson(String str) => CryptoCurrencies.fromJson(json.decode(str));

String cryptoCurrenciesToJson(CryptoCurrencies data) => json.encode(data.toJson());

class CryptoCurrencies {
    List<CryptoCurrenciesData>? data;

    CryptoCurrencies({
        this.data,
    });

    factory CryptoCurrencies.fromJson(Map<String, dynamic> json) => CryptoCurrencies(
        data: json["data"] == null ? [] : List<CryptoCurrenciesData>.from(json["data"]!.map((x) => CryptoCurrenciesData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class CryptoCurrenciesData {
    int? id;
    String? name;
    String? symbol;
    String? slug;
    bool? isfav;

    CryptoCurrenciesData({
        this.id,
        
        this.name,
        this.symbol,
        this.slug,
        
        this.isfav,
        
    });

    factory CryptoCurrenciesData.fromJson(Map<String, dynamic> json) => CryptoCurrenciesData(
        id: json["id"],
        
        name: json["name"],
        symbol: json["symbol"],
        slug: json["slug"],
        
        isfav: json["isfav"] == 1 ? true : false,
        
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        
        "name": name,
        "symbol": symbol,
        "slug": slug,
        
        "isfav": isfav,
        
    };

  static fromJSON(Map<String, Object?> item) {}
}
