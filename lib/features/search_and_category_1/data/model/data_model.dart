class DataModel {
  final String id;
  final String image;
  final String location;
  final int numberOfBathrooms;
  final int numberOfBeds;
  final int price;
  final double reviewOverall;
  final String title;
  final int totalReviewCount;

  DataModel({
    required this.id,
    required this.image,
    required this.location,
    required this.numberOfBathrooms,
    required this.numberOfBeds,
    required this.price,
    required this.reviewOverall,
    required this.title,
    required this.totalReviewCount,
  });

  factory DataModel.fromJson(Map<String, dynamic> json, String documentId) {
    return DataModel(
      id: documentId,
      image: json['image'] as String,
      location: json['location'] as String,
      numberOfBathrooms: json['number_of_bathrooms'] as int,
      numberOfBeds: json['number_of_beds'] as int,
      price: json['price'] as int,
      reviewOverall: (json['review_overall'] as num).toDouble(),
      title: json['title'] as String,
      totalReviewCount: json['total_review_count'] as int,
    );
  }
}