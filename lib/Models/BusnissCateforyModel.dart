// To parse this JSON data, do
//
//     final busnissCategoryApiModel = busnissCategoryApiModelFromJson(jsonString);

import 'dart:convert';

BussnissCategoryApiModel busnissCategoryApiModelFromJson(String str) =>
    BussnissCategoryApiModel.fromJson(json.decode(str));

String busnissCategoryApiModelToJson(BussnissCategoryApiModel data) =>
    json.encode(data.toJson());

class BussnissCategoryApiModel {
  String? status;
  bool? success;
  String? message;
  List<BCategory>? data;
  int? page;

  BussnissCategoryApiModel({
    this.status,
    this.success,
    this.message,
    this.data,
    this.page,
  });

  factory BussnissCategoryApiModel.fromJson(Map<String, dynamic> json) =>
      BussnissCategoryApiModel(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<BCategory>.from(json["data"]!.map((x) => BCategory.fromJson(x))),
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "page": page,
      };
}

class BCategory {
  String? categoryId;
  String? id;
  String? title;
  String? icon;
  String? servicesId;
  bool? disable;
  int? v;

  BCategory({
    this.categoryId,
    this.id,
    this.title,
    this.icon,
    this.servicesId,
    this.disable,
    this.v,
  });

  factory BCategory.fromJson(Map<String, dynamic> json) => BCategory(
        categoryId: json["categoryId"],
        id: json["_id"],
        title: json["title"],
        icon: json["icon"],
        servicesId: json["servicesId"],
        disable: json["disable"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "_id": id,
        "title": title,
        "icon": icon,
        "servicesId": servicesId,
        "disable": disable,
        "__v": v,
      };
}
