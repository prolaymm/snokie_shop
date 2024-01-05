
class ApiConstant {

  static final ApiConstant _singleton = ApiConstant._internal();

  factory ApiConstant() {
    return _singleton;
  }
  ApiConstant._internal();

  ///base url
    static const String  baseUrl = "https://dl.dropboxusercontent.com/scl/fi";

    static const String shoes = "/6f3l5ppqobndnjhtn1fpc/shoes.json?rlkey=bqt5c7mpzw2ppwapm9sgimk4s";
    static const String brand = "/78tb9w8jiyh3l312ao6ei/brand.json?rlkey=o3srnmmx7jwz36urwzdq8cc35";



}

