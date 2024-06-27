// To parse this JSON data, do
//
//     final getAllCityResponceModel = getAllCityResponceModelFromJson(jsonString);

import 'dart:convert';

GetAllCityResponceModel getAllCityResponceModelFromJson(String str) => GetAllCityResponceModel.fromJson(json.decode(str));

String getAllCityResponceModelToJson(GetAllCityResponceModel data) => json.encode(data.toJson());

class GetAllCityResponceModel {
  String? status;
  bool? success;
  String? message;
  List<City>? data;
  int? page;

  GetAllCityResponceModel({
    this.status,
    this.success,
    this.message,
    this.data,
    this.page,
  });

  factory GetAllCityResponceModel.fromJson(Map<String, dynamic> json) => GetAllCityResponceModel(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<City>.from(json["data"]!.map((x) => City.fromJson(x))),
    page: json["page"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "page": page,
  };
}

class City {
  String? id;
  String? name;
  String? stateId;
  String? countryId;
  String? icon;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  bool? disable;
  String? cityLat;
  String? cityLong;

  City({
    this.id,
    this.name,
    this.stateId,
    this.countryId,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.disable,
    this.cityLat,
    this.cityLong,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["_id"],
    name: json["name"],
    stateId: json["stateId"],
    countryId: json["countryId"],
    icon: json["icon"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    disable: json["disable"],
    cityLat: json["cityLat"],
    cityLong: json["cityLong"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "stateId": stateId,
    "countryId": countryId,
    "icon": icon,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "disable": disable,
    "cityLat": cityLat,
    "cityLong": cityLong,
  };
}
