class BusinessModel {
  final String id;
  final String? businessName;
  final String?
      businessImage; // nullable for cases where image might be missing
  final String? userId;
  final String? businessCategoryId;
  final List<dynamic> servicesId;
  final int? businessContact;
  final int? whatsappNumber;
  final String? stateId;
  final String? cityId;
  final String? countryId;
  final String? websiteLink;
  final String? instagramLink;
  final String? twitterLink;
  final String? youtubeLink;
  final String? facebookLink;
  final String? address;
  final bool isPageSubscribe;
  final String? pageId;
  final String? pageAccessToken;
  final String? tagline;
  final bool disable;
  final bool isFacebookPageLinked;

//<editor-fold desc="Data Methods">
  const BusinessModel({
    required this.id,
    this.businessName,
    this.businessImage,
    this.userId,
    this.businessCategoryId,
    required this.servicesId,
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
    required this.isPageSubscribe,
    this.pageId,
    this.pageAccessToken,
    this.tagline,
    required this.disable,
    required this.isFacebookPageLinked,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusinessModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          businessName == other.businessName &&
          businessImage == other.businessImage &&
          userId == other.userId &&
          businessCategoryId == other.businessCategoryId &&
          servicesId == other.servicesId &&
          businessContact == other.businessContact &&
          whatsappNumber == other.whatsappNumber &&
          stateId == other.stateId &&
          cityId == other.cityId &&
          countryId == other.countryId &&
          websiteLink == other.websiteLink &&
          instagramLink == other.instagramLink &&
          twitterLink == other.twitterLink &&
          youtubeLink == other.youtubeLink &&
          facebookLink == other.facebookLink &&
          address == other.address &&
          isPageSubscribe == other.isPageSubscribe &&
          pageId == other.pageId &&
          pageAccessToken == other.pageAccessToken &&
          tagline == other.tagline &&
          disable == other.disable &&
          isFacebookPageLinked == other.isFacebookPageLinked);

  @override
  int get hashCode =>
      id.hashCode ^
      businessName.hashCode ^
      businessImage.hashCode ^
      userId.hashCode ^
      businessCategoryId.hashCode ^
      servicesId.hashCode ^
      businessContact.hashCode ^
      whatsappNumber.hashCode ^
      stateId.hashCode ^
      cityId.hashCode ^
      countryId.hashCode ^
      websiteLink.hashCode ^
      instagramLink.hashCode ^
      twitterLink.hashCode ^
      youtubeLink.hashCode ^
      facebookLink.hashCode ^
      address.hashCode ^
      isPageSubscribe.hashCode ^
      pageId.hashCode ^
      pageAccessToken.hashCode ^
      tagline.hashCode ^
      disable.hashCode ^
      isFacebookPageLinked.hashCode;

  @override
  String toString() {
    return 'BusinessModel{' +
        ' id: $id,' +
        ' businessName: $businessName,' +
        ' businessImage: $businessImage,' +
        ' userId: $userId,' +
        ' businessCategoryId: $businessCategoryId,' +
        ' servicesId: $servicesId,' +
        ' businessContact: $businessContact,' +
        ' whatsappNumber: $whatsappNumber,' +
        ' stateId: $stateId,' +
        ' cityId: $cityId,' +
        ' countryId: $countryId,' +
        ' websiteLink: $websiteLink,' +
        ' instagramLink: $instagramLink,' +
        ' twitterLink: $twitterLink,' +
        ' youtubeLink: $youtubeLink,' +
        ' facebookLink: $facebookLink,' +
        ' address: $address,' +
        ' isPageSubscribe: $isPageSubscribe,' +
        ' pageId: $pageId,' +
        ' pageAccessToken: $pageAccessToken,' +
        ' tagline: $tagline,' +
        ' disable: $disable,' +
        ' isFacebookPageLinked: $isFacebookPageLinked,' +
        '}';
  }

  BusinessModel copyWith({
    String? id,
    String? businessName,
    String? businessImage,
    String? userId,
    String? businessCategoryId,
    List<dynamic>? servicesId,
    int? businessContact,
    int? whatsappNumber,
    String? stateId,
    String? cityId,
    String? countryId,
    String? websiteLink,
    String? instagramLink,
    String? twitterLink,
    String? youtubeLink,
    String? facebookLink,
    String? address,
    bool? isPageSubscribe,
    String? pageId,
    String? pageAccessToken,
    String? tagline,
    bool? disable,
    bool? isFacebookPageLinked,
  }) {
    return BusinessModel(
      id: id ?? this.id,
      businessName: businessName ?? this.businessName,
      businessImage: businessImage ?? this.businessImage,
      userId: userId ?? this.userId,
      businessCategoryId: businessCategoryId ?? this.businessCategoryId,
      servicesId: servicesId ?? this.servicesId,
      businessContact: businessContact ?? this.businessContact,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      stateId: stateId ?? this.stateId,
      cityId: cityId ?? this.cityId,
      countryId: countryId ?? this.countryId,
      websiteLink: websiteLink ?? this.websiteLink,
      instagramLink: instagramLink ?? this.instagramLink,
      twitterLink: twitterLink ?? this.twitterLink,
      youtubeLink: youtubeLink ?? this.youtubeLink,
      facebookLink: facebookLink ?? this.facebookLink,
      address: address ?? this.address,
      isPageSubscribe: isPageSubscribe ?? this.isPageSubscribe,
      pageId: pageId ?? this.pageId,
      pageAccessToken: pageAccessToken ?? this.pageAccessToken,
      tagline: tagline ?? this.tagline,
      disable: disable ?? this.disable,
      isFacebookPageLinked: isFacebookPageLinked ?? this.isFacebookPageLinked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': this.id,
      'businessName': this.businessName,
      'businessImage': this.businessImage,
      'userId': this.userId,
      'businessCategoryId': this.businessCategoryId,
      'servicesId': this.servicesId,
      'businessContact': this.businessContact,
      'whatsappNumber': this.whatsappNumber,
      'stateId': this.stateId,
      'cityId': this.cityId,
      'countryId': this.countryId,
      'websiteLink': this.websiteLink,
      'instagramLink': this.instagramLink,
      'twitterLink': this.twitterLink,
      'youtubeLink': this.youtubeLink,
      'facebookLink': this.facebookLink,
      'address': this.address,
      'isPageSubscribe': this.isPageSubscribe,
      'pageId': this.pageId,
      'pageAccessToken': this.pageAccessToken,
      'tagline': this.tagline,
      'disable': this.disable,
      'isFacebookPageLinked': this.isFacebookPageLinked,
    };
  }

  factory BusinessModel.fromMap(Map<String, dynamic> map) {
    return BusinessModel(
      id: map['_id'] as String,
      businessName: map['businessName'] as String?,
      businessImage: map['businessImage'] as String?,
      userId: map['userId'] as String?,
      businessCategoryId: map['businessCategoryId'] as String?,
      servicesId: map['servicesId'] as List<dynamic>? ?? [],
      businessContact: map['businessContact'] as int?,
      whatsappNumber: map['whatsappNumber'] as int?,
      stateId: map['stateId'] as String?,
      cityId: map['cityId'] as String?,
      countryId: map['countryId'] as String?,
      websiteLink: map['websiteLink'] as String?,
      instagramLink: map['instagramLink'] as String?,
      twitterLink: map['twitterLink'] as String?,
      youtubeLink: map['youtubeLink'] as String?,
      facebookLink: map['facebookLink'] as String?,
      address: map['address'] as String?,
      isPageSubscribe: map['isPageSubscribe'] as bool? ?? false,
      pageId: map['pageId'] as String?,
      pageAccessToken: map['pageAccessToken'] as String?,
      tagline: map['tagline'] as String?,
      disable: map['disable'] as bool? ?? false,
      isFacebookPageLinked: map['isFacebookPageLinked'] as bool? ?? false,
    );
  }

//</editor-fold>
}
