class Offering {
  final String title;
  final String image;
  final String description;
  final String planId;final bool disable;
  final String id;

  Offering({
    required this.title,
    required this.image,
    required this.description,
    required this.planId,
    required this.disable,
    required this.id,
  });

  factory Offering.fromJson(Map<String, dynamic> json) {
    return Offering(
      title: json['title'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      planId: json['planId'] as String,
      disable: json['disable'] as bool,
      id: json['_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'description': description,'planId': planId,
      'disable': disable,
      '_id': id,
    };
  }
}