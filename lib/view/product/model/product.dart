class Product {
  int? id;
  String? name;
  String? category;
  double? price;
  String? imageUrl;
  bool? isFavorite;
  List<String>? availableSize;
  List<String>? detailImages;
  String? description;
  double? rates;

  Product(
      {this.id,
      this.name,
      this.category,
      this.price,
      this.imageUrl,
      this.isFavorite = false,
      this.availableSize,
      this.detailImages,
      this.description,
      this.rates = 0});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    isFavorite = json['isFavorite'];
    availableSize = json['availableSize'];
    detailImages = json['detailImages'];
    description = json['description'];
    rates = json['rates'];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "price": price,
        "imageUrl": imageUrl,
        "isFavorite": isFavorite,
        "availableSize": availableSize,
        "detailImages": detailImages,
        "description": description,
        "rates": rates
      };
}
