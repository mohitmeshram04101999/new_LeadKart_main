// To parse this JSON data, do
//
//     final addReportDetailModel = addReportDetailModelFromJson(jsonString);

import 'dart:convert';

AddReportDetailModel addReportDetailModelFromJson(String str) => AddReportDetailModel.fromJson(json.decode(str));

String addReportDetailModelToJson(AddReportDetailModel data) => json.encode(data.toJson());

class AddReportDetailModel {
  bool? success;
  String? message;
  List<FullReport>? fullReport;

  AddReportDetailModel({
    this.success,
    this.message,
    this.fullReport,
  });

  factory AddReportDetailModel.fromJson(Map<String, dynamic> json) => AddReportDetailModel(
    success: json["success"],
    message: json["message"],
    fullReport: json["fullReport"] == null ? [] : List<FullReport>.from(json["fullReport"]!.map((x) => FullReport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "fullReport": fullReport == null ? [] : List<dynamic>.from(fullReport!.map((x) => x.toJson())),
  };
}

class FullReport {
  KeyPerformanceIndicators? keyPerformanceIndicators;
  AgeWiseChart? deviceReach;
  AgeWiseChart? ageWiseChart;
  AgeWiseChart? gender;
  Placements? placements;
  Engagements? engagements;
  StateWisePerformance? stateWisePerformance;
  AgeWiseChart? cityWisePerformance;

  FullReport({
    this.keyPerformanceIndicators,
    this.deviceReach,
    this.ageWiseChart,
    this.gender,
    this.placements,
    this.engagements,
    this.stateWisePerformance,
    this.cityWisePerformance,
  });

  factory FullReport.fromJson(Map<String, dynamic> json) => FullReport(
    keyPerformanceIndicators: json["keyPerformanceIndicators"] == null ? null : KeyPerformanceIndicators.fromJson(json["keyPerformanceIndicators"]),
    deviceReach: json["deviceReach"] == null ? null : AgeWiseChart.fromJson(json["deviceReach"]),
    ageWiseChart: json["ageWiseChart"] == null ? null : AgeWiseChart.fromJson(json["ageWiseChart"]),
    gender: json["gender"] == null ? null : AgeWiseChart.fromJson(json["gender"]),
    placements: json["placements"] == null ? null : Placements.fromJson(json["placements"]),
    engagements: json["engagements"] == null ? null : Engagements.fromJson(json["engagements"]),
    stateWisePerformance: json["stateWisePerformance"] == null ? null : StateWisePerformance.fromJson(json["stateWisePerformance"]),
    cityWisePerformance: json["cityWisePerformance"] == null ? null : AgeWiseChart.fromJson(json["cityWisePerformance"]),
  );

  Map<String, dynamic> toJson() => {
    "keyPerformanceIndicators": keyPerformanceIndicators?.toJson(),
    "deviceReach": deviceReach?.toJson(),
    "ageWiseChart": ageWiseChart?.toJson(),
    "gender": gender?.toJson(),
    "placements": placements?.toJson(),
    "engagements": engagements?.toJson(),
    "stateWisePerformance": stateWisePerformance?.toJson(),
    "cityWisePerformance": cityWisePerformance?.toJson(),
  };
}

class AgeWiseChart {
  List<AgeWiseChartDatum>? data;
  Paging? paging;

  AgeWiseChart({
    this.data,
    this.paging,
  });

  factory AgeWiseChart.fromJson(Map<String, dynamic> json) => AgeWiseChart(
    data: json["data"] == null ? [] : List<AgeWiseChartDatum>.from(json["data"]!.map((x) => AgeWiseChartDatum.fromJson(x))),
    paging: json["paging"] == null ? null : Paging.fromJson(json["paging"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "paging": paging?.toJson(),
  };
}

class AgeWiseChartDatum {
  String? impressions;
  DateTime? dateStart;
  DateTime? dateStop;
  String? age;
  String? dma;
  String? devicePlatform;
  String? gender;

  AgeWiseChartDatum({
    this.impressions,
    this.dateStart,
    this.dateStop,
    this.age,
    this.dma,
    this.devicePlatform,
    this.gender,
  });

  factory AgeWiseChartDatum.fromJson(Map<String, dynamic> json) => AgeWiseChartDatum(
    impressions: json["impressions"],
    dateStart: json["date_start"] == null ? null : DateTime.parse(json["date_start"]),
    dateStop: json["date_stop"] == null ? null : DateTime.parse(json["date_stop"]),
    age: json["age"],
    dma: json["dma"],
    devicePlatform: json["device_platform"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "impressions": impressions,
    "date_start": "${dateStart!.year.toString().padLeft(4, '0')}-${dateStart!.month.toString().padLeft(2, '0')}-${dateStart!.day.toString().padLeft(2, '0')}",
    "date_stop": "${dateStop!.year.toString().padLeft(4, '0')}-${dateStop!.month.toString().padLeft(2, '0')}-${dateStop!.day.toString().padLeft(2, '0')}",
    "age": age,
    "dma": dma,
    "device_platform": devicePlatform,
    "gender": gender,
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

class Engagements {
  List<EngagementsDatum>? data;
  Paging? paging;

  Engagements({
    this.data,
    this.paging,
  });

  factory Engagements.fromJson(Map<String, dynamic> json) => Engagements(
    data: json["data"] == null ? [] : List<EngagementsDatum>.from(json["data"]!.map((x) => EngagementsDatum.fromJson(x))),
    paging: json["paging"] == null ? null : Paging.fromJson(json["paging"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "paging": paging?.toJson(),
  };
}

class EngagementsDatum {
  List<Action>? actions;
  DateTime? dateStart;
  DateTime? dateStop;

  EngagementsDatum({
    this.actions,
    this.dateStart,
    this.dateStop,
  });

  factory EngagementsDatum.fromJson(Map<String, dynamic> json) => EngagementsDatum(
    actions: json["actions"] == null ? [] : List<Action>.from(json["actions"]!.map((x) => Action.fromJson(x))),
    dateStart: json["date_start"] == null ? null : DateTime.parse(json["date_start"]),
    dateStop: json["date_stop"] == null ? null : DateTime.parse(json["date_stop"]),
  );

  Map<String, dynamic> toJson() => {
    "actions": actions == null ? [] : List<dynamic>.from(actions!.map((x) => x.toJson())),
    "date_start": "${dateStart!.year.toString().padLeft(4, '0')}-${dateStart!.month.toString().padLeft(2, '0')}-${dateStart!.day.toString().padLeft(2, '0')}",
    "date_stop": "${dateStop!.year.toString().padLeft(4, '0')}-${dateStop!.month.toString().padLeft(2, '0')}-${dateStop!.day.toString().padLeft(2, '0')}",
  };
}

class Action {
  String? actionType;
  String? value;

  Action({
    this.actionType,
    this.value,
  });

  factory Action.fromJson(Map<String, dynamic> json) => Action(
    actionType: json["action_type"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "action_type": actionType,
    "value": value,
  };
}

class KeyPerformanceIndicators {
  List<KeyPerformanceIndicatorsDatum>? data;
  Paging? paging;

  KeyPerformanceIndicators({
    this.data,
    this.paging,
  });

  factory KeyPerformanceIndicators.fromJson(Map<String, dynamic> json) => KeyPerformanceIndicators(
    data: json["data"] == null ? [] : List<KeyPerformanceIndicatorsDatum>.from(json["data"]!.map((x) => KeyPerformanceIndicatorsDatum.fromJson(x))),
    paging: json["paging"] == null ? null : Paging.fromJson(json["paging"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "paging": paging?.toJson(),
  };
}

class KeyPerformanceIndicatorsDatum {
  String? reach;
  String? impressions;
  String? clicks;
  String? spend;
  DateTime? dateStart;
  DateTime? dateStop;

  KeyPerformanceIndicatorsDatum({
    this.reach,
    this.impressions,
    this.clicks,
    this.spend,
    this.dateStart,
    this.dateStop,
  });

  factory KeyPerformanceIndicatorsDatum.fromJson(Map<String, dynamic> json) => KeyPerformanceIndicatorsDatum(
    reach: json["reach"],
    impressions: json["impressions"],
    clicks: json["clicks"],
    spend: json["spend"],
    dateStart: json["date_start"] == null ? null : DateTime.parse(json["date_start"]),
    dateStop: json["date_stop"] == null ? null : DateTime.parse(json["date_stop"]),
  );

  Map<String, dynamic> toJson() => {
    "reach": reach,
    "impressions": impressions,
    "clicks": clicks,
    "spend": spend,
    "date_start": "${dateStart!.year.toString().padLeft(4, '0')}-${dateStart!.month.toString().padLeft(2, '0')}-${dateStart!.day.toString().padLeft(2, '0')}",
    "date_stop": "${dateStop!.year.toString().padLeft(4, '0')}-${dateStop!.month.toString().padLeft(2, '0')}-${dateStop!.day.toString().padLeft(2, '0')}",
  };
}

class Placements {
  List<PlacementsDatum>? data;
  Paging? paging;

  Placements({
    this.data,
    this.paging,
  });

  factory Placements.fromJson(Map<String, dynamic> json) => Placements(
    data: json["data"] == null ? [] : List<PlacementsDatum>.from(json["data"]!.map((x) => PlacementsDatum.fromJson(x))),
    paging: json["paging"] == null ? null : Paging.fromJson(json["paging"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "paging": paging?.toJson(),
  };
}

class PlacementsDatum {
  String? impressions;
  DateTime? dateStart;
  DateTime? dateStop;
  String? publisherPlatform;
  String? platformPosition;

  PlacementsDatum({
    this.impressions,
    this.dateStart,
    this.dateStop,
    this.publisherPlatform,
    this.platformPosition,
  });

  factory PlacementsDatum.fromJson(Map<String, dynamic> json) => PlacementsDatum(
    impressions: json["impressions"],
    dateStart: json["date_start"] == null ? null : DateTime.parse(json["date_start"]),
    dateStop: json["date_stop"] == null ? null : DateTime.parse(json["date_stop"]),
    publisherPlatform: json["publisher_platform"],
    platformPosition: json["platform_position"],
  );

  Map<String, dynamic> toJson() => {
    "impressions": impressions,
    "date_start": "${dateStart!.year.toString().padLeft(4, '0')}-${dateStart!.month.toString().padLeft(2, '0')}-${dateStart!.day.toString().padLeft(2, '0')}",
    "date_stop": "${dateStop!.year.toString().padLeft(4, '0')}-${dateStop!.month.toString().padLeft(2, '0')}-${dateStop!.day.toString().padLeft(2, '0')}",
    "publisher_platform": publisherPlatform,
    "platform_position": platformPosition,
  };
}

class StateWisePerformance {
  List<StateWisePerformanceDatum>? data;
  Paging? paging;

  StateWisePerformance({
    this.data,
    this.paging,
  });

  factory StateWisePerformance.fromJson(Map<String, dynamic> json) => StateWisePerformance(
    data: json["data"] == null ? [] : List<StateWisePerformanceDatum>.from(json["data"]!.map((x) => StateWisePerformanceDatum.fromJson(x))),
    paging: json["paging"] == null ? null : Paging.fromJson(json["paging"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "paging": paging?.toJson(),
  };
}

class StateWisePerformanceDatum {
  String? accountId;
  String? adId;
  String? campaignId;
  String? adsetId;
  DateTime? dateStart;
  DateTime? dateStop;
  String? impressions;
  String? spend;
  String? region;

  StateWisePerformanceDatum({
    this.accountId,
    this.adId,
    this.campaignId,
    this.adsetId,
    this.dateStart,
    this.dateStop,
    this.impressions,
    this.spend,
    this.region,
  });

  factory StateWisePerformanceDatum.fromJson(Map<String, dynamic> json) => StateWisePerformanceDatum(
    accountId: json["account_id"],
    adId: json["ad_id"],
    campaignId: json["campaign_id"],
    adsetId: json["adset_id"],
    dateStart: json["date_start"] == null ? null : DateTime.parse(json["date_start"]),
    dateStop: json["date_stop"] == null ? null : DateTime.parse(json["date_stop"]),
    impressions: json["impressions"],
    spend: json["spend"],
    region: json["region"],
  );

  Map<String, dynamic> toJson() => {
    "account_id": accountId,
    "ad_id": adId,
    "campaign_id": campaignId,
    "adset_id": adsetId,
    "date_start": "${dateStart!.year.toString().padLeft(4, '0')}-${dateStart!.month.toString().padLeft(2, '0')}-${dateStart!.day.toString().padLeft(2, '0')}",
    "date_stop": "${dateStop!.year.toString().padLeft(4, '0')}-${dateStop!.month.toString().padLeft(2, '0')}-${dateStop!.day.toString().padLeft(2, '0')}",
    "impressions": impressions,
    "spend": spend,
    "region": region,
  };
}
