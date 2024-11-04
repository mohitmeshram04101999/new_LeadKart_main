class BusinessPermissionsResponse {
  String? status;
  bool? success;
  String? message;
  List<PermissionData>? data;

  BusinessPermissionsResponse({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory BusinessPermissionsResponse.fromJson(Map<String, dynamic> json) =>
      BusinessPermissionsResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<PermissionData>.from(
                json["data"].map((x) => PermissionData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PermissionData {
  List<String>? business;
  List<String>? leads;
  List<String>? ads;

  PermissionData({
    this.business,
    this.leads,
    this.ads,
  });

  factory PermissionData.fromJson(Map<String, dynamic> json) => PermissionData(
        business: json["business"] == null
            ? []
            : List<String>.from(json["business"].map((x) => x)),
        leads: json["leads"] == null
            ? []
            : List<String>.from(json["leads"].map((x) => x)),
        ads: json["ads"] == null
            ? []
            : List<String>.from(json["ads"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "business":
            business == null ? [] : List<dynamic>.from(business!.map((x) => x)),
        "leads": leads == null ? [] : List<dynamic>.from(leads!.map((x) => x)),
        "ads": ads == null ? [] : List<dynamic>.from(ads!.map((x) => x)),
      };
}
