class Product {
  String? name;
  String? category;
  double? price;
  String? imageUrl;
  bool? isFavorite;
  List<String>? availableSize;
  List<String>? detailImages;
  String? description;

  Product(
      {this.name,
      this.category,
      this.price,
      this.imageUrl,
      this.isFavorite = false,
      this.availableSize,
      this.detailImages,
      this.description});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    category = json['category'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    isFavorite = json['isFavorite'];
    availableSize = json['availableSize'];
    detailImages = json['detailImages'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
        "price": price,
        "imageUrl": imageUrl,
        "isFavorite": isFavorite,
        "availableSize": availableSize,
        "detailImages": detailImages,
        "description": description
      };
}
