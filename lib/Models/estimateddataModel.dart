// To parse this JSON data, do
//
//     final estimetedDataResponce = estimetedDataResponceFromJson(jsonString);

import 'dart:convert';

EstimetedDataResponce estimetedDataResponceFromJson(String str) => EstimetedDataResponce.fromJson(json.decode(str));

String estimetedDataResponceToJson(EstimetedDataResponce data) => json.encode(data.toJson());

class EstimetedDataResponce {
  String? status;
  bool? success;
  String? message;
  EstimatedData? data;

  EstimetedDataResponce({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory EstimetedDataResponce.fromJson(Map<String, dynamic> json) => EstimetedDataResponce(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : EstimatedData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class EstimatedData {
  int? totalLeads;
  int? totalReach;

  EstimatedData({
    this.totalLeads,
    this.totalReach,
  });

  factory EstimatedData.fromJson(Map<String, dynamic> json) => EstimatedData(
    totalLeads: json["totalLeads"],
    totalReach: json["totalReach"],
  );

  Map<String, dynamic> toJson() => {
    "totalLeads": totalLeads,
    "totalReach": totalReach,
  };
}
