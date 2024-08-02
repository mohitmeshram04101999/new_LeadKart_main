// To parse this JSON data, do
//
//     final plansByAddTypeIdResponce = plansByAddTypeIdResponceFromJson(jsonString);

import 'dart:convert';

PlansByAddTypeIdResponce plansByAddTypeIdResponceFromJson(String str) => PlansByAddTypeIdResponce.fromJson(json.decode(str));

String plansByAddTypeIdResponceToJson(PlansByAddTypeIdResponce data) => json.encode(data.toJson());

class PlansByAddTypeIdResponce {
  String? statusCode;
  String? message;
  List<PlanDetail2>? data;

  PlansByAddTypeIdResponce({
    this.statusCode,
    this.message,
    this.data,
  });

  factory PlansByAddTypeIdResponce.fromJson(Map<String, dynamic> json) => PlansByAddTypeIdResponce(
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] == null ? [] : List<PlanDetail2>.from(json["data"]!.map((x) => PlanDetail2.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PlanDetail2 {
  int? instaBudget;
  int? googleBudget;
  int? facebookBudget;
  String? id;
  AdvertisementTypeId? advertisementTypeId;
  String? title;
  int? price;
  int? duretion;
  int? dailySpendBudget;
  int? aiImageCount;
  bool? disable;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  dynamic views;
  int? reach;
  int? leads;
  List<Offering>? offerings;

  PlanDetail2({
    this.instaBudget,
    this.googleBudget,
    this.facebookBudget,
    this.id,
    this.advertisementTypeId,
    this.title,
    this.price,
    this.duretion,
    this.dailySpendBudget,
    this.aiImageCount,
    this.disable,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.views,
    this.reach,
    this.leads,
    this.offerings,
  });

  factory PlanDetail2.fromJson(Map<String, dynamic> json) => PlanDetail2(
    instaBudget: json["instaBudget"],
    googleBudget: json["googleBudget"],
    facebookBudget: json["facebookBudget"],
    id: json["_id"],
    advertisementTypeId: json["advertisementTypeId"] == null ? null : AdvertisementTypeId.fromJson(json["advertisementTypeId"]),
    title: json["title"],
    price: json["price"],
    duretion: json["duretion"],
    dailySpendBudget: json["dailySpendBudget"],
    aiImageCount: json["aiImageCount"],
    disable: json["disable"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    views: json["views"],
    reach: json["reach"],
    leads: json["leads"],
    offerings: json["offerings"] == null ? [] : List<Offering>.from(json["offerings"]!.map((x) => Offering.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "instaBudget": instaBudget,
    "googleBudget": googleBudget,
    "facebookBudget": facebookBudget,
    "_id": id,
    "advertisementTypeId": advertisementTypeId?.toJson(),
    "title": title,
    "price": price,
    "duretion": duretion,
    "dailySpendBudget": dailySpendBudget,
    "aiImageCount": aiImageCount,
    "disable": disable,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "views": views,
    "reach": reach,
    "leads": leads,
    "offerings": offerings == null ? [] : List<dynamic>.from(offerings!.map((x) => x.toJson())),
  };
}

class AdvertisementTypeId {
  String? id;
  dynamic image;
  String? title;
  String? discription;
  bool? isInstagram;
  bool? isFacebook;
  bool? isGoogle;
  String? advertisementType;
  int? minimumBudget;
  bool? disable;
  int? v;
  DateTime? createdAt;
  DateTime? updatedAt;

  AdvertisementTypeId({
    this.id,
    this.image,
    this.title,
    this.discription,
    this.isInstagram,
    this.isFacebook,
    this.isGoogle,
    this.advertisementType,
    this.minimumBudget,
    this.disable,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory AdvertisementTypeId.fromJson(Map<String, dynamic> json) => AdvertisementTypeId(
    id: json["_id"],
    image: json["image"],
    title: json["title"],
    discription: json["discription"],
    isInstagram: json["isInstagram"],
    isFacebook: json["isFacebook"],
    isGoogle: json["isGoogle"],
    advertisementType: json["advertisementType"],
    minimumBudget: json["minimumBudget"],
    disable: json["disable"],
    v: json["__v"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "title": title,
    "discription": discription,
    "isInstagram": isInstagram,
    "isFacebook": isFacebook,
    "isGoogle": isGoogle,
    "advertisementType": advertisementType,
    "minimumBudget": minimumBudget,
    "disable": disable,
    "__v": v,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Offering {
  String? id;
  String? title;
  String? image;
  String? description;
  String? planId;
  int? v;
  bool? disable;

  Offering({
    this.id,
    this.title,
    this.image,
    this.description,
    this.planId,
    this.v,
    this.disable,
  });

  factory Offering.fromJson(Map<String, dynamic> json) => Offering(
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
