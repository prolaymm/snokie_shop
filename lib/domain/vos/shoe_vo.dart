

import 'package:hive/hive.dart';
import 'dart:convert';

part 'shoe_vo.g.dart';

List<ShoeVo> shoeVoFromJson(String str) => List<ShoeVo>.from(json.decode(str).map((x) => ShoeVo.fromJson(x)));

String shoeVoToJson(List<ShoeVo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 1)
class ShoeVo {
  @HiveField(1)
  String? id;
  @HiveField(2)
  String? sku;
  @HiveField(3)
  String? brand;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? colorway;
  @HiveField(6)
  String? gender;
  @HiveField(7)
  String? silhouette;
  @HiveField(8)
  String? releaseYear;
  @HiveField(9)
  String? releaseDate;
  @HiveField(10)
  int? retailPrice;
  @HiveField(11)
  int? estimatedMarketValue;
  @HiveField(12)
  String? story;
  @HiveField(13)
  List<String>? color;
  @HiveField(14)
  List<String>? country;
  @HiveField(15)
  List<int>? size;
  @HiveField(16)
  Image? image;
  @HiveField(17)
  Links? links;
  @HiveField(18)
  bool? isFavourite=false;


  ShoeVo({
    this.id,
    this.sku,
    this.brand,
    this.name,
    this.colorway,
    this.gender,
    this.silhouette,
    this.releaseYear,
    this.releaseDate,
    this.retailPrice,
    this.estimatedMarketValue,
    this.story,
    this.color,
    this.country,
    this.size,
    this.image,
    this.links,
    this.isFavourite
  });

  factory ShoeVo.fromJson(Map<String, dynamic> json) => ShoeVo(
    id: json["id"],
    sku: json["sku"],
    brand: json["brand"],
    name: json["name"],
    colorway: json["colorway"],
    gender: json["gender"],
    silhouette: json["silhouette"],
    releaseYear: json["releaseYear"],
    releaseDate: json["releaseDate"],
    retailPrice: json["retailPrice"],
    estimatedMarketValue: json["estimatedMarketValue"],
    story: json["story"],
    color: json["color"] == null ? [] : List<String>.from(json["color"]!.map((x) => x)),
    country: json["country"] == null ? [] : List<String>.from(json["country"]!.map((x) => x)),
    size: json["size"] == null ? [] : List<int>.from(json["size"]!.map((x) => x)),
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "brand": brand,
    "name": name,
    "colorway": colorway,
    "gender": gender,
    "silhouette": silhouette,
    "releaseYear": releaseYear,
    "releaseDate": releaseDate,
    "retailPrice": retailPrice,
    "estimatedMarketValue": estimatedMarketValue,
    "story": story,
    "color": color == null ? [] : List<dynamic>.from(color!.map((x) => x)),
    "country": country == null ? [] : List<dynamic>.from(country!.map((x) => x)),
    "size": size == null ? [] : List<dynamic>.from(size!.map((x) => x)),
    "image": image?.toJson(),
    "links": links?.toJson(),
  };
  @override
  String toString() {

    return "${toJson()}";
  }
}

@HiveType(typeId: 2)
class Image {
  @HiveField(1)
  List<dynamic>? the360;
  @HiveField(2)
  String? original;
  @HiveField(3)
  String? small;
  @HiveField(4)
  String? thumbnail;

  Image({
    this.the360,
    this.original,
    this.small,
    this.thumbnail,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    the360: json["360"] == null ? [] : List<dynamic>.from(json["360"]!.map((x) => x)),
    original: json["original"],
    small: json["small"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "360": the360 == null ? [] : List<dynamic>.from(the360!.map((x) => x)),
    "original": original,
    "small": small,
    "thumbnail": thumbnail,
  };
}

@HiveType(typeId: 3)
class Links {
  @HiveField(1)
  String? stockX;
  @HiveField(2)
  String? goat;
  @HiveField(3)
  String? flightClub;
  @HiveField(4)
  String? stadiumGoods;

  Links({
    this.stockX,
    this.goat,
    this.flightClub,
    this.stadiumGoods,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    stockX: json["stockX"],
    goat: json["goat"],
    flightClub: json["flightClub"],
    stadiumGoods: json["stadiumGoods"],
  );

  Map<String, dynamic> toJson() => {
    "stockX": stockX,
    "goat": goat,
    "flightClub": flightClub,
    "stadiumGoods": stadiumGoods,
  };
}
