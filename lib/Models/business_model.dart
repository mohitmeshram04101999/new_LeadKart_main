class BusinessModel {
  final String id;
  final String businessName;
  final String?
      businessImage; // nullable for cases where image might be missing
  final String userId;
  final String businessCategoryId;
  final List<dynamic> servicesId;
  final int? businessContact;
  final int? whatsappNumber;
  final String stateId;
  final String cityId;
  final String countryId;
  final String websiteLink;
  final String instagramLink;
  final String twitterLink;
  final String youtubeLink;
  final String facebookLink;
  final String address;
  final String tagline;
  final bool disable;
  final bool isFacebookPageLinked;

//<editor-fold desc="Data Methods">
  const BusinessModel({
    required this.businessName,
    this.businessImage,
    required this.userId,
    required this.businessCategoryId,
    required this.servicesId,
    required this.businessContact,
    required this.whatsappNumber,
    required this.stateId,
    required this.cityId,
    required this.countryId,
    required this.websiteLink,
    required this.instagramLink,
    required this.twitterLink,
    required this.youtubeLink,
    required this.facebookLink,
    required this.address,
    required this.tagline,
    required this.disable,
    required this.isFacebookPageLinked,
    required String id,
  }) : id = id;

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
      tagline.hashCode ^
      disable.hashCode ^
      isFacebookPageLinked.hashCode;

  @override
  String toString() {
    return 'BusinessModel{' +
        ' _id: $id,' +
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
    List<String>? servicesId,
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
      'tagline': this.tagline,
      'disable': this.disable,
      'isFacebookPageLinked': this.isFacebookPageLinked,
    };
  }

  factory BusinessModel.fromMap(Map<String, dynamic> map) {
    return BusinessModel(
      id: map['_id'].toString(),
      businessName: map['businessName'].toString(),
      businessImage: map['businessImage'].toString(),
      userId: map['userId'].toString(),
      businessCategoryId: map['businessCategoryId'].toString(),
      servicesId: map['servicesId'] as List<dynamic>,
      businessContact: map['businessContact'],
      whatsappNumber: map['whatsappNumber'],
      stateId: map['stateId'].toString(),
      cityId: map['cityId'].toString(),
      countryId: map['countryId'].toString(),
      websiteLink: map['websiteLink'].toString(),
      instagramLink: map['instagramLink'].toString(),
      twitterLink: map['twitterLink'].toString(),
      youtubeLink: map['youtubeLink'].toString(),
      facebookLink: map['facebookLink'].toString(),
      address: map['address'].toString(),
      tagline: map['tagline'].toString(),
      disable: map['disable'] as bool,
      isFacebookPageLinked: map['isFacebookPageLinked'] as bool,
    );
  }

//</editor-fold>
}
