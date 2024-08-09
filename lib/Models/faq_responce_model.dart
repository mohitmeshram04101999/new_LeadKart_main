// To parse this JSON data, do
//
//     final faqApiResponce = faqApiResponceFromJson(jsonString);

import 'dart:convert';

FaqApiResponce faqApiResponceFromJson(String str) => FaqApiResponce.fromJson(json.decode(str));

String faqApiResponceToJson(FaqApiResponce data) => json.encode(data.toJson());

class FaqApiResponce {
  String? status;
  bool? success;
  String? message;
  List<Question>? data;
  int? page;

  FaqApiResponce({
    this.status,
    this.success,
    this.message,
    this.data,
    this.page,
  });

  factory FaqApiResponce.fromJson(Map<String, dynamic> json) => FaqApiResponce(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Question>.from(json["data"]!.map((x) => Question.fromJson(x))),
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

class Question {
  String? type;
  String? id;
  String? question;
  String? answer;
  bool? disable;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Question({
    this.type,
    this.id,
    this.question,
    this.answer,
    this.disable,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    type: json["type"],
    id: json["_id"],
    question: json["question"],
    answer: json["answer"],
    disable: json["disable"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "_id": id,
    "question": question,
    "answer": answer,
    "disable": disable,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
