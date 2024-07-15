

class BusinessDetailModel {
  bool? isFacebookPageLinked;
  String? id;
  String? businessName;
  dynamic businessImage;
  String? userId;
  String? businessCategoryId;
  List<ServicesId>? servicesId;
  int? businessContact;
  int? whatsappNumber;
  String? stateId;
  String? cityId;
  String? countryId;
  String? websiteLink;
  String? instagramLink;
  String? twitterLink;
  String? youtubeLink;
  String? facebookLink;
  String? address;
  String? tagline;
  bool? disable;
  int? v;
  String? metaAccessToken;
  String? pageId;
  String? pageAccessToken;
  bool? isPageAccessTokenActive;
  bool? isMetaAccessTokenActive;

  BusinessDetailModel({
    this.isFacebookPageLinked,
    this.id,
    this.businessName,
    this.businessImage,
    this.userId,
    this.businessCategoryId,
    this.servicesId,
    this.businessContact,
    this.whatsappNumber,
    this.stateId,
    this.cityId,
    this.countryId,
    this.websiteLink,
    this.instagramLink,
    this.twitterLink,
    this.youtubeLink,
    this.facebookLink,
    this.address,
    this.tagline,
    this.disable,
    this.v,
    this.metaAccessToken,
    this.pageId,
    this.pageAccessToken,
    this.isPageAccessTokenActive,
    this.isMetaAccessTokenActive,
  });

  factory BusinessDetailModel.fromJson(Map<String, dynamic> json) => BusinessDetailModel(
    isFacebookPageLinked: json["isFacebookPageLinked"],
    id: json["_id"],
    businessName: json["businessName"],
    businessImage: json["businessImage"],
    userId: json["userId"],
    businessCategoryId: json["businessCategoryId"],
    servicesId: json["servicesId"] == null ? [] : List<ServicesId>.from(json["servicesId"]!.map((x) => ServicesId.fromJson(x))),
    businessContact: json["businessContact"],
    whatsappNumber: json["whatsappNumber"],
    stateId: json["stateId"],
    cityId: json["cityId"],
    countryId: json["countryId"],
    websiteLink: json["websiteLink"],
    instagramLink: json["instagramLink"],
    twitterLink: json["twitterLink"],
    youtubeLink: json["youtubeLink"],
    facebookLink: json["facebookLink"],
    address: json["address"],
    tagline: json["tagline"],
    disable: json["disable"],
    v: json["__v"],
    metaAccessToken: json["metaAccessToken"],
    pageId: json["pageId"],
    pageAccessToken: json["pageAccessToken"],
    isPageAccessTokenActive: json["isPageAccessTokenActive"],
    isMetaAccessTokenActive: json["isMetaAccessTokenActive"],
  );

  Map<String, dynamic> toJson() => {
    "isFacebookPageLinked": isFacebookPageLinked,
    "_id": id,
    "businessName": businessName,
    "businessImage": businessImage,
    "userId": userId,
    "businessCategoryId": businessCategoryId,
    "servicesId": servicesId == null ? [] : List<dynamic>.from(servicesId!.map((x) => x.toJson())),
    "businessContact": businessContact,
    "whatsappNumber": whatsappNumber,
    "stateId": stateId,
    "cityId": cityId,
    "countryId": countryId,
    "websiteLink": websiteLink,
    "instagramLink": instagramLink,
    "twitterLink": twitterLink,
    "youtubeLink": youtubeLink,
    "facebookLink": facebookLink,
    "address": address,
    "tagline": tagline,
    "disable": disable,
    "__v": v,
    "metaAccessToken": metaAccessToken,
    "pageId": pageId,
    "pageAccessToken": pageAccessToken,
    "isPageAccessTokenActive": isPageAccessTokenActive,
    "isMetaAccessTokenActive": isMetaAccessTokenActive,
  };
}

class ServicesId {
  String? id;
  String? title;

  ServicesId({
    this.id,
    this.title,
  });

  factory ServicesId.fromJson(Map<String, dynamic> json) => ServicesId(
    id: json["_id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
  };
}
