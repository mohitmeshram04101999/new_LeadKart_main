
// To parse this JSON data, do
//
//     final getAllStateResponceModel = getAllStateResponceModelFromJson(jsonString);

import 'dart:convert';

GetAllStateResponceModel getAllStateResponceModelFromJson(String str) => GetAllStateResponceModel.fromJson(json.decode(str));

String getAllStateResponceModelToJson(GetAllStateResponceModel data) => json.encode(data.toJson());

class GetAllStateResponceModel {
  String? status;
  bool? success;
  String? message;
  List<StateCity>? data;
  int? page;

  GetAllStateResponceModel({
    this.status,
    this.success,
    this.message,
    this.data,
    this.page,
  });

  factory GetAllStateResponceModel.fromJson(Map<String, dynamic> json) => GetAllStateResponceModel(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<StateCity>.from(json["data"]!.map((x) => StateCity.fromJson(x))),
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

class StateCity {
  String? id;
  String? name;
  String? icon;
  String? countryId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  bool? disable;

  StateCity({
    this.id,
    this.name,
    this.icon,
    this.countryId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.disable,
  });

  factory StateCity.fromJson(Map<String, dynamic> json) => StateCity(
    id: json["_id"],
    name: json["name"],
    icon: json["icon"],
    countryId: json["countryId"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    disable: json["disable"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "icon": icon,
    "countryId": countryId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "disable": disable,
  };
}
