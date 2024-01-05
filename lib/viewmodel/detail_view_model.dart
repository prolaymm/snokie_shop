import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:snokie_shoe/domain/db/shoe_db.dart';
import 'package:snokie_shoe/utils/db_constants.dart';

import '../domain/vos/shoe_vo.dart';

class DetailViewModel extends ChangeNotifier {

  int? selectedSize;
  int selectedColor = 0;
  late ShoeVo vo;

  bool isWishList = false;
  final ShoeDb _db = ShoeDb();
  int totalCount = 1;
  DetailViewModel(this.vo){
    checkWishList();
  }

  onSelectSize(int position){
    selectedSize = position;
    notifyListeners();
  }

  onSelectColor(int index) {
    selectedColor = index;
    notifyListeners();
  }


  onCount([bool isIncrement = false]) {
    if(isIncrement) {
      totalCount++;
    } else {
      if(totalCount>1) {
        totalCount--;
      }
    }
    notifyListeners();
  }


  onAddWishList() {
    if(!isWishList){
      _db.saveSingleShoe(vo: vo, dbKey: shoeHiveBox);
      isWishList = true;

    } else {
      _db.deleteSingleShoe(id: vo.id, dbKey: shoeHiveBox);
      isWishList = false;
    }
    notifyListeners();
  }


  checkWishList() {
    ShoeVo wishList = _db.getSingleShoe(dbKey: shoeHiveBox, id: vo.id??"");
    if(wishList.id == vo.id) {
      isWishList = true;
    } else {
      isWishList = false;
    }
    notifyListeners();

  }

}


Map<String,dynamic> data =    {
  "id":"ffff317b-a854-4aa0-bec1-498708ccf948",
  "sku":"WPHERSR1",
  "brand":"New Balance",
  "name":"Wmns Powher Run 'Munsell White Cloud Pink'",
  "colorway":"Munsell White/Cloud Pink",
  "gender":"women",
  "silhouette":"Powher Run",
  "releaseYear":"2021",
  "releaseDate":"2021-03-29",
  "color":[
    "#FAFAAFA",
    "#ff1500",
    "#ff0385"
  ],
  "country":[
    "UK",
    "US",
    "Myanmar"
  ],
  "size":[
    20,
    15,
    5,
    10
  ],
  "retailPrice":70,
  "estimatedMarketValue":70,
  "story":"",
  "image":{
    "360":[

    ],
    "original":"https://image.goat.com/attachments/product_template_pictures/images/052/646/095/original/WPHERSR1.png.png",
    "small":"https://image.goat.com/750/attachments/product_template_pictures/images/052/646/095/original/WPHERSR1.png.png",
    "thumbnail":"https://image.goat.com/375/attachments/product_template_pictures/images/052/646/095/original/WPHERSR1.png.png"
  },
  "links":{
    "stockX":"",
    "goat":"https://goat.com/sneakers/wmns-powher-run-munsell-white-cloud-pink-wphersr1",
    "flightClub":"https://flightclub.com/wmns-powher-run-munsell-white-cloud-pink-wphersr1",
    "stadiumGoods":""
  }
};