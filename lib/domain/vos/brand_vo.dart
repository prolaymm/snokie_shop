
import 'dart:convert';

List<BrandVo> brandVoFromJson(String str) => List<BrandVo>.from(json.decode(str).map((x) => BrandVo.fromJson(x)));

String brandVoToJson(List<BrandVo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BrandVo {
  String? brandName;
  String? logo;

  BrandVo({
    this.brandName,
    this.logo,
  });

  factory BrandVo.fromJson(Map<String, dynamic> json) => BrandVo(
    brandName: json["brand_name"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "brand_name": brandName,
    "logo": logo,
  };
}
