class AdInterestModel {
  final bool success;
  final String message;
  final List<AdInterestData> data;AdInterestModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AdInterestModel.fromJson(Map<String, dynamic> json) {
    return AdInterestModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List)
          .map((item) => AdInterestData.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class AdInterestData {
  final String id;
  final String name;
  final int audienceSizeLowerBound;
  final int audienceSizeUpperBound;
  final List<String> path;
  final String description;
  final String topic;

  AdInterestData({
    required this.id,
    required this.name,
    required this.audienceSizeLowerBound,
    required this.audienceSizeUpperBound,
    required this.path,
    required this.description,
    required this.topic,
  });

  factory AdInterestData.fromJson(Map<String, dynamic> json) {
    return AdInterestData(
      id: json['id'] as String,
      name: json['name'] as String,
      audienceSizeLowerBound: json['audience_size_lower_bound'] as int,
      audienceSizeUpperBound: json['audience_size_upper_bound'] as int,
      path: (json['path'] as List).map((item) => item as String).toList(),
      description: json['description'] as String,
      topic: json['topic'] as String,
    );
  }
}