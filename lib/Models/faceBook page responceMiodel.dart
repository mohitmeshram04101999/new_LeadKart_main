// To parse this JSON data, do
//
//     final faceBookPageResponce = faceBookPageResponceFromJson(jsonString);

import 'dart:convert';

FaceBookPageResponce faceBookPageResponceFromJson(String str) => FaceBookPageResponce.fromJson(json.decode(str));

String faceBookPageResponceToJson(FaceBookPageResponce data) => json.encode(data.toJson());

class FaceBookPageResponce {
  List<Datum>? data;
  Paging? paging;

  FaceBookPageResponce({
    this.data,
    this.paging,
  });

  factory FaceBookPageResponce.fromJson(Map<String, dynamic> json) => FaceBookPageResponce(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    paging: json["paging"] == null ? null : Paging.fromJson(json["paging"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "paging": paging?.toJson(),
  };
}

class Datum {
  String? accessToken;
  String? category;
  List<CategoryList>? categoryList;
  String? name;
  String? id;
  List<String>? tasks;

  Datum({
    this.accessToken,
    this.category,
    this.categoryList,
    this.name,
    this.id,
    this.tasks,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    accessToken: json["access_token"],
    category: json["category"],
    categoryList: json["category_list"] == null ? [] : List<CategoryList>.from(json["category_list"]!.map((x) => CategoryList.fromJson(x))),
    name: json["name"],
    id: json["id"],
    tasks: json["tasks"] == null ? [] : List<String>.from(json["tasks"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "category": category,
    "category_list": categoryList == null ? [] : List<dynamic>.from(categoryList!.map((x) => x.toJson())),
    "name": name,
    "id": id,
    "tasks": tasks == null ? [] : List<dynamic>.from(tasks!.map((x) => x)),
  };
}

class CategoryList {
  String? id;
  String? name;

  CategoryList({
    this.id,
    this.name,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Paging {
  Cursors? cursors;

  Paging({
    this.cursors,
  });

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
    cursors: json["cursors"] == null ? null : Cursors.fromJson(json["cursors"]),
  );

  Map<String, dynamic> toJson() => {
    "cursors": cursors?.toJson(),
  };
}

class Cursors {
  String? before;
  String? after;

  Cursors({
    this.before,
    this.after,
  });

  factory Cursors.fromJson(Map<String, dynamic> json) => Cursors(
    before: json["before"],
    after: json["after"],
  );

  Map<String, dynamic> toJson() => {
    "before": before,
    "after": after,
  };
}
