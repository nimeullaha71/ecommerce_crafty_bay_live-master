class ProductModel {
  final String id;
  final String title;
  final int currentPrice;
  final List<String> photoUrls;

  ProductModel({
    required this.id,
    required this.title,
    required this.currentPrice,
    required this.photoUrls,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['_id'] as String,
      title: jsonData['title'] as String,
      currentPrice: int.tryParse(jsonData['current_price'].toString()) ?? 0,
      photoUrls: List<String>.from(jsonData['photos'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'current_price': currentPrice,
      'photos': photoUrls,
    };
  }
}
