// To parse this JSON data, do
//
//     final leadAssignHistoryResponce = leadAssignHistoryResponceFromJson(jsonString);

import 'dart:convert';

LeadAssignUserHistoryResponce leadAssignHistoryResponceFromJson(String str) => LeadAssignUserHistoryResponce.fromJson(json.decode(str));

String leadAssignHistoryResponceToJson(LeadAssignUserHistoryResponce data) => json.encode(data.toJson());

class LeadAssignUserHistoryResponce {
  String? status;
  bool? success;
  String? message;
  List<LeadAssignHistory>? data;
  int? page;

  LeadAssignUserHistoryResponce({
    this.status,
    this.success,
    this.message,
    this.data,
    this.page,
  });

  factory LeadAssignUserHistoryResponce.fromJson(Map<String, dynamic> json) => LeadAssignUserHistoryResponce(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<LeadAssignHistory>.from(json["data"]!.map((x) => LeadAssignHistory.fromJson(x))),
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

class LeadAssignHistory {
  String? id;
  UserId? userId;
  String? leadId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  LeadAssignHistory({
    this.id,
    this.userId,
    this.leadId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory LeadAssignHistory.fromJson(Map<String, dynamic> json) => LeadAssignHistory(
    id: json["_id"],
    userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
    leadId: json["leadId"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId?.toJson(),
    "leadId": leadId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class UserId {
  String? id;
  String? name;
  int? mobile;
  String? image;

  UserId({
    this.id,
    this.name,
    this.mobile,
    this.image,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    id: json["_id"],
    name: json["name"],
    mobile: json["mobile"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "mobile": mobile,
    "image": image,
  };
}
