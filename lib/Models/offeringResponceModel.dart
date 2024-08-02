// To parse this JSON data, do
//
//     final offeringApiResponce = offeringApiResponceFromJson(jsonString);

import 'dart:convert';

OfferingApiResponce offeringApiResponceFromJson(String str) => OfferingApiResponce.fromJson(json.decode(str));

String offeringApiResponceToJson(OfferingApiResponce data) => json.encode(data.toJson());

class OfferingApiResponce {
  String? status;
  bool? success;
  String? message;
  List<OfferDetail>? data;

  OfferingApiResponce({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory OfferingApiResponce.fromJson(Map<String, dynamic> json) => OfferingApiResponce(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<OfferDetail>.from(json["data"]!.map((x) => OfferDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class OfferDetail {
  String? id;
  String? title;
  String? image;
  String? description;
  String? planId;
  int? v;
  bool? disable;

  OfferDetail({
    this.id,
    this.title,
    this.image,
    this.description,
    this.planId,
    this.v,
    this.disable,
  });

  factory OfferDetail.fromJson(Map<String, dynamic> json) => OfferDetail(
    id: json["_id"],
    title: json["title"],
    image: json["image"],
    description: json["description"],
    planId: json["planId"],
    v: json["__v"],
    disable: json["disable"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "image": image,
    "description": description,
    "planId": planId,
    "__v": v,
    "disable": disable,
  };
}
