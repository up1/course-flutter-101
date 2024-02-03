class ProductFavotite {
  final int productId;
  final int isFav;
  final int userId;

  ProductFavotite(
      {required this.productId, required this.isFav, required this.userId});

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'isFav': isFav,
      'userId': userId,
    };
  }

  static ProductFavotite fromMap(Map<String, dynamic> map) {
    return ProductFavotite(
      productId: map['productId'],
      isFav: map['isFav'],
      userId: map['userId'],
    );
  }
}
