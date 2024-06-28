class AdsPlan {
  final String advertisementTypeId;
  final String title;
  final int price;
  final int duration;final int dailySpendBudget;
  final int aiImageCount;
  final int instaBudget;
  final int googleBudget;
  final int facebookBudget;

  AdsPlan({
    required this.advertisementTypeId,
    required this.title,
    required this.price,required this.duration,
    required this.dailySpendBudget,
    required this.aiImageCount,
    required this.instaBudget,
    required this.googleBudget,
    required this.facebookBudget,
  });

  factory AdsPlan.fromJson(Map<String, dynamic> json) {
    return AdsPlan(
      advertisementTypeId: json['advertisementTypeId'] as String,
      title: json['title'] as String,
      price: json['price'] as int,
      duration: json['duretion'] as int, // Note: typo in JSONkey
      dailySpendBudget: json['dailySpendBudget'] as int,
      aiImageCount: json['aiImageCount'] as int,
      instaBudget: json['instaBudget'] as int,
      googleBudget: json['googleBudget'] as int,
      facebookBudget: json['facebookBudget'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'advertisementTypeId': advertisementTypeId,
      'title': title,
      'price': price,
      'duretion': duration, // Use the original typo for consistency
      'dailySpendBudget': dailySpendBudget,
      'aiImageCount': aiImageCount,
      'instaBudget': instaBudget,
      'googleBudget': googleBudget,
      'facebookBudget': facebookBudget,
    };
  }
}