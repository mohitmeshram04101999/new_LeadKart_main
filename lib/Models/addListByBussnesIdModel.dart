import 'dart:convert';

AddListByBusinessResponce addListByBusinessResponceFromJson(String str) =>
    AddListByBusinessResponce.fromJson(json.decode(str));

String addListByBusinessResponceToJson(AddListByBusinessResponce data) =>
    json.encode(data.toJson());

class AddListByBusinessResponce {
  String? status;
  bool? success;
  String? message;
  List<AddByBuinesss>? data;
  int? page;

  AddListByBusinessResponce({
    this.status,
    this.success,
    this.message,
    this.data,
    this.page,
  });

  factory AddListByBusinessResponce.fromJson(Map<String, dynamic> json) =>
      AddListByBusinessResponce(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<AddByBuinesss>.from(json["data"]!.map((x) => AddByBuinesss.fromJson(x))),
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

class AddByBuinesss {
  String? image;
  String? status;
  String? id;
  String? creativeId;
  String? businessId;
  String? externalCampiagnId;
  String? title;
  String? imageHashId;
  bool? isCallToActionEnabled;
  String? destinationUrl;
  List<dynamic>? audienceId;
  List<String>? interest;
  String? location;
  List<int>? audienceGender;
  int? ageRangeFrom;
  int? ageRangeTo;
  List<int>? days;
  int? facebookBudget;
  int? instaBudget;
  String? paymentStatus;
  String? startDate;
  String? endDate;
  String? dayStartTime;
  String? dayEndTime;
  bool? isFacebookAdEnabled;
  bool? isInstaAdEnabled;
  bool? isGoogleAdEnabled;
  AddTypeId? addTypeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? facebookAdSetId;
  int? totalReach;
  int? totalSpendBudget;
  int? totalImpression;
  int? totalBudget;
  int? totalLeads;
  int? totalClicks;

  AddByBuinesss({
    this.image,
    this.totalLeads,
    this.totalClicks,
    this.status,
    this.id,
    this.creativeId,
    this.businessId,
    this.externalCampiagnId,
    this.title,
    this.imageHashId,
    this.isCallToActionEnabled,
    this.destinationUrl,
    this.audienceId,
    this.interest,
    this.location,
    this.audienceGender,
    this.ageRangeFrom,
    this.ageRangeTo,
    this.days,
    this.facebookBudget,
    this.instaBudget,
    this.paymentStatus,
    this.startDate,
    this.endDate,
    this.dayStartTime,
    this.dayEndTime,
    this.isFacebookAdEnabled,
    this.isInstaAdEnabled,
    this.isGoogleAdEnabled,
    this.addTypeId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.facebookAdSetId,
    this.totalReach,
    this.totalSpendBudget,
    this.totalImpression,
    this.totalBudget,
  });

  factory AddByBuinesss.fromJson(Map<String, dynamic> json) => AddByBuinesss(
    image: json["image"],
        status: json["status"],
        id: json["_id"],
        totalLeads: json["totalLeads"],
        totalClicks: json["totalClicks"],
        creativeId: json["creativeId"],
        businessId: json["businessId"],
        externalCampiagnId: json["externalCampiagnId"],
        title: json["title"],
        imageHashId: json["imageHashId"],
        isCallToActionEnabled: json["isCallToActionEnabled"],
        destinationUrl: json["destinationUrl"],
        audienceId: json["audienceId"] == null
            ? []
            : List<dynamic>.from(json["audienceId"]!.map((x) => x)),
        interest: json["interest"] == null
            ? []
            : List<String>.from(json["interest"]!.map((x) => x)),
        location: json["location"],
        audienceGender: json["audienceGender"] == null
            ? []
            : List<int>.from(json["audienceGender"]!.map((x) => x)),
        ageRangeFrom: json["ageRangeFrom"],
        ageRangeTo: json["ageRangeTo"],
        days: json["days"] == null
            ? []
            : List<int>.from(json["days"]!.map((x) => x)),
        facebookBudget: json["facebookBudget"],
        instaBudget: json["instaBudget"],
        paymentStatus: json["paymentStatus"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        dayStartTime: json["dayStartTime"],
        dayEndTime: json["dayEndTime"],
        isFacebookAdEnabled: json["isFacebookAdEnabled"],
        isInstaAdEnabled: json["isInstaAdEnabled"],
        isGoogleAdEnabled: json["isGoogleAdEnabled"],
        addTypeId: json["addTypeId"] == null
            ? null
            : AddTypeId.fromJson(json["addTypeId"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        facebookAdSetId: json["facebookAdSetId"],
        totalReach: json["totalReach"],
        totalSpendBudget: json["totalSpendBudget"],
        totalImpression: json["totalImpression"],
        totalBudget: json["totalBudget"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "_id": id,
        "image":image,
        "creativeId": creativeId,
        "businessId": businessId,
        "externalCampiagnId": externalCampiagnId,
        "title": title,
        "imageHashId": imageHashId,
        "isCallToActionEnabled": isCallToActionEnabled,
        "destinationUrl": destinationUrl,
        "audienceId": audienceId == null
            ? []
            : List<dynamic>.from(audienceId!.map((x) => x)),
        "interest":
            interest == null ? [] : List<dynamic>.from(interest!.map((x) => x)),
        "location": location,
        "audienceGender": audienceGender == null
            ? []
            : List<dynamic>.from(audienceGender!.map((x) => x)),
        "ageRangeFrom": ageRangeFrom,
        "ageRangeTo": ageRangeTo,
        "days": days == null ? [] : List<dynamic>.from(days!.map((x) => x)),
        "facebookBudget": facebookBudget,
        "instaBudget": instaBudget,
        "paymentStatus": paymentStatus,
        "startDate": startDate,
        "endDate": endDate,
        "dayStartTime": dayStartTime,
        "dayEndTime": dayEndTime,
        "isFacebookAdEnabled": isFacebookAdEnabled,
        "isInstaAdEnabled": isInstaAdEnabled,
        "isGoogleAdEnabled": isGoogleAdEnabled,
        "addTypeId": addTypeId?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "facebookAdSetId": facebookAdSetId,
        "totalReach": totalReach,
        "totalSpendBudget": totalSpendBudget,
        "totalImpression": totalImpression,
        "totalBudget": totalBudget,
      };
}

class AddTypeId {
  String? id;
  String? title;

  AddTypeId({
    this.id,
    this.title,
  });

  factory AddTypeId.fromJson(Map<String, dynamic> json) => AddTypeId(
        id: json["_id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
      };
}
