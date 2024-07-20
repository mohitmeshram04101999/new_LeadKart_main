// To parse this JSON data, do
//
//     final getCampaignDetailModel = getCampaignDetailModelFromJson(jsonString);


class GetCampaignDetailModel {
  bool? success;
  String? message;
  Data? data;

  GetCampaignDetailModel({
    this.success,
    this.message,
    this.data,
  });

  factory GetCampaignDetailModel.fromJson(Map<String, dynamic> json) => GetCampaignDetailModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
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

  Data({
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
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    creativeId: json["creativeId"],
    businessId: json["businessId"],
    externalCampiagnId: json["externalCampiagnId"],
    title: json["title"],
    imageHashId: json["imageHashId"],
    isCallToActionEnabled: json["isCallToActionEnabled"],
    destinationUrl: json["destinationUrl"],
    audienceId: json["audienceId"] == null ? [] : List<dynamic>.from(json["audienceId"]!.map((x) => x)),
    interest: json["interest"] == null ? [] : List<String>.from(json["interest"]!.map((x) => x)),
    location: json["location"],
    audienceGender: json["audienceGender"] == null ? [] : List<int>.from(json["audienceGender"]!.map((x) => x)),
    ageRangeFrom: json["ageRangeFrom"],
    ageRangeTo: json["ageRangeTo"],
    days: json["days"] == null ? [] : List<int>.from(json["days"]!.map((x) => x)),
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
    addTypeId: json["addTypeId"] == null ? null : AddTypeId.fromJson(json["addTypeId"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    facebookAdSetId: json["facebookAdSetId"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "creativeId": creativeId,
    "businessId": businessId,
    "externalCampiagnId": externalCampiagnId,
    "title": title,
    "imageHashId": imageHashId,
    "isCallToActionEnabled": isCallToActionEnabled,
    "destinationUrl": destinationUrl,
    "audienceId": audienceId == null ? [] : List<dynamic>.from(audienceId!.map((x) => x)),
    "interest": interest == null ? [] : List<dynamic>.from(interest!.map((x) => x)),
    "location": location,
    "audienceGender": audienceGender == null ? [] : List<dynamic>.from(audienceGender!.map((x) => x)),
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
