class AdvertisementTypeModel{
  final String id;
  final String? image;
  final String title;
  final String description;
  final bool isInstagram;
  final bool isFacebook;
  final bool isGoogle;
  final String advertisementType;
  final int minimumBudget;
  final bool disable;
  final int version;
  final String createdAt;
  final String updatedAt;

  AdvertisementTypeModel({required this.id,
    this.image,
    required this.title,
    required this.description,
    required this.isInstagram,
    required this.isFacebook,
    required this.isGoogle,
    required this.advertisementType,
    required this.minimumBudget,
    required this.disable,
    required this.version,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AdvertisementTypeModel.fromJson(Map<String, dynamic> json) {
    return AdvertisementTypeModel(
      id: json['_id'] as String,
      image: json['image'] as String?,
      title: json['title'] as String,
      description: json['discription'] as String,
      // Note: typo in JSON key
      isInstagram: json['isInstagram'] as bool,
      isFacebook: json['isFacebook'] as bool,
      isGoogle: json['isGoogle'] as bool,
      advertisementType: json['advertisementType'] as String,
      minimumBudget: json['minimumBudget'] as int,
      disable: json['disable'] as bool,
      version: json['__v'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'image': image,
      'title': title,
      'discription': description, // Use the original typo for consistency
      'isInstagram': isInstagram,
      'isFacebook': isFacebook,
      'isGoogle': isGoogle,
      'advertisementType': advertisementType,
      'minimumBudget': minimumBudget,
      'disable': disable,
      '__v': version,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}