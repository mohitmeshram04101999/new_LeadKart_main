// To parse this JSON data, do
//
//     final tragetAreaApiResponce = tragetAreaApiResponceFromJson(jsonString);

import 'dart:convert';

TaragetAreaApiResponce TragetAreaApiResponceFromJson(String str) =>
    TaragetAreaApiResponce.fromJson(json.decode(str));

String TragetAreaApiResponceToJson(TaragetAreaApiResponce data) =>
    json.encode(data.toJson());

class TaragetAreaApiResponce {
  bool? success;
  String? message;
  List<TargetArea>? data;

  TaragetAreaApiResponce({
    this.success,
    this.message,
    this.data,
  });

  factory TaragetAreaApiResponce.fromJson(Map<String, dynamic> json) =>
      TaragetAreaApiResponce(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<TargetArea>.from(json["data"]!.map((x) => TargetArea.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TargetArea {
  String? key;
  String? name;
  String? type;
  String? countryCode;
  String? countryName;
  bool? supportsRegion;
  bool? supportsCity;
  String? region;
  int? regionId;
  String? geoHierarchyLevel;
  String? geoHierarchyName;

  TargetArea({
    this.key,
    this.name,
    this.type,
    this.countryCode,
    this.countryName,
    this.supportsRegion,
    this.supportsCity,
    this.region,
    this.regionId,
    this.geoHierarchyLevel,
    this.geoHierarchyName,
  });

  factory TargetArea.fromJson(Map<String, dynamic> json) => TargetArea(
        key: json["key"],
        name: json["name"],
        type: json["type"],
        countryCode: json["country_code"],
        countryName: json["country_name"],
        supportsRegion: json["supports_region"],
        supportsCity: json["supports_city"],
        region: json["region"],
        regionId: json["region_id"],
        geoHierarchyLevel: json["geo_hierarchy_level"],
        geoHierarchyName: json["geo_hierarchy_name"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "type": type,
        "country_code": countryCode,
        "country_name": countryName,
        "supports_region": supportsRegion,
        "supports_city": supportsCity,
        "region": region,
        "region_id": regionId,
        "geo_hierarchy_level": geoHierarchyLevel,
        "geo_hierarchy_name": geoHierarchyName,
      };
}





