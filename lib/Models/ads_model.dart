class AdsModel {
  final String id;
  final String? image; // Nullable since it can be null
  final String title;
  final String description;
  final bool isInstagram;
  final bool isFacebook;
  final bool isGoogle;
  final String advertisementType;
  final int minimumBudget;
  final bool disable;

  AdsModel({
    required this.id,
    this.image,
    required this.title,
    required this.description,
    required this.isInstagram,
    required this.isFacebook,
    required this.isGoogle,
    required this.advertisementType,
    required this.minimumBudget,
    required this.disable,
  });

  factory AdsModel.fromJson(Map<String, dynamic> json) {
    return AdsModel(
      id: json['_id'] as String,
      image: json['image'] as String?, // Handle potential null value
      title: json['title'] as String,description: json['discription'] as String, // Note: typo in JSON key
      isInstagram: json['isInstagram'] as bool,
      isFacebook: json['isFacebook'] as bool,
      isGoogle: json['isGoogle'] as bool,
      advertisementType: json['advertisementType'] as String,
      minimumBudget: json['minimumBudget'] as int,
      disable: json['disable'] as bool,
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
    };
  }
}