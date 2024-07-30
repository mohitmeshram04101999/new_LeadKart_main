// To parse this JSON data, do
//
//     final viewPlansModel = viewPlansModelFromJson(jsonString);

import 'dart:convert';

ViewPlansModel viewPlansModelFromJson(String str) => ViewPlansModel.fromJson(json.decode(str));

String viewPlansModelToJson(ViewPlansModel data) => json.encode(data.toJson());

class ViewPlansModel {
  String? status;
  bool? success;
  String? message;
  List<PlanDetail>? data;
  int? page;

  ViewPlansModel({
    this.status,
    this.success,
    this.message,
    this.data,
    this.page,
  });

  factory ViewPlansModel.fromJson(Map<String, dynamic> json) => ViewPlansModel(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<PlanDetail>.from(json["data"]!.map((x) => PlanDetail.fromJson(x))),
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

class PlanDetail {
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
  dynamic reach;
  dynamic leads;

  PlanDetail({
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
  });

  factory PlanDetail.fromJson(Map<String, dynamic> json) => PlanDetail(
    instaBudget: json["instaBudget"],
    googleBudget: json["googleBudget"],
    facebookBudget: json["facebookBudget"],
    id: json["_id"],
    advertisementTypeId: json["advertisementTypeId"] == null ? null : AdvertisementTypeId.fromJson(json["advertisementTypeId"]),
    title:json["title"],
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
  };
}

class AdvertisementTypeId {
  String? id;
  String? image;
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





