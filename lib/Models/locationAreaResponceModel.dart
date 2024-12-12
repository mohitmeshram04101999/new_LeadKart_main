// To parse this JSON data, do
//
//     final locationAreaResponseModel = locationAreaResponseModelFromJson(jsonString);

import 'dart:convert';

LocationAreaResponseModel locationAreaResponseModelFromJson(String str) => LocationAreaResponseModel.fromJson(json.decode(str));

String locationAreaResponseModelToJson(LocationAreaResponseModel data) => json.encode(data.toJson());

class LocationAreaResponseModel {
  bool? success;
  String? message;
  List<Area>? data;

  LocationAreaResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory LocationAreaResponseModel.fromJson(Map<String, dynamic> json) => LocationAreaResponseModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Area>.from(json["data"]!.map((x) => Area.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Area {
  String? key;
  String? name;
  String? type;
  String? countryCode;
  String? countryName;
  String? region;
  int? regionId;
  bool? supportsRegion;
  bool? supportsCity;
  String? geoHierarchyLevel;
  String? geoHierarchyName;

  Area({
    this.key,
    this.name,
    this.type,
    this.countryCode,
    this.countryName,
    this.region,
    this.regionId,
    this.supportsRegion,
    this.supportsCity,
    this.geoHierarchyLevel,
    this.geoHierarchyName,
  });

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    key: json["key"],
    name: json["name"],
    type: json["type"],
    countryCode: json["country_code"],
    countryName: json["country_name"],
    region: json["region"],
    regionId: json["region_id"],
    supportsRegion: json["supports_region"],
    supportsCity: json["supports_city"],
    geoHierarchyLevel: json["geo_hierarchy_level"],
    geoHierarchyName: json["geo_hierarchy_name"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "name": name,
    "type": type,
    "country_code": countryCode,
    "country_name": countryName,
    "region": region,
    "region_id": regionId,
    "supports_region": supportsRegion,
    "supports_city": supportsCity,
    "geo_hierarchy_level": geoHierarchyLevel,
    "geo_hierarchy_name": geoHierarchyName,
  };
}







