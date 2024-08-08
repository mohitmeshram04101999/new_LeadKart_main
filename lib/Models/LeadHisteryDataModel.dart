// To parse this JSON data, do
//
//     final leadsApiResponce = leadsApiResponceFromJson(jsonString);



import 'dart:convert';

import '../them/constents.dart';

LeadeHistory leadsApiResponceFromJson(String str) => LeadeHistory.fromJson(json.decode(str));

String leadsApiResponceToJson(LeadeHistory data) => json.encode(data.toJson());

class LeadeHistory {
  String? id;
  LeadId? leadId;
  String? historyType;
  String? statusChange;
  String? actionType;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  LeadeHistory({
    this.id,
    this.leadId,
    this.historyType,
    this.statusChange,
    this.actionType,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory LeadeHistory.fromJson(Map<String, dynamic> json) => LeadeHistory(
    id: json["_id"],
    leadId: LeadId.fromJson(json["leadId"]),
    historyType: json["historyType"],
    statusChange: json["statusChange"],
    actionType: json["actionType"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]).add(AppConstent().offset),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]).add(AppConstent().offset),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "leadId": leadId,
    "historyType": historyType,
    "statusChange": statusChange,
    "actionType": actionType,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}


class LeadId
{
  String id;
  String adId;
  LeadId({
    required this.id ,
    required this.adId,
});

  factory LeadId.fromJson(Map<String, dynamic> json) => LeadId(
    id: json["_id"]??"",
    adId: json["adId"]??"",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "adId":adId,
  };


}
