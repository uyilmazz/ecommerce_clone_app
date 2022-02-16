class Category {
  String? name;
  String? image;
  bool? isSelected;

  Category({this.name, this.image, this.isSelected = false});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "isSelected": isSelected,
      };
}
