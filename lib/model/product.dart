import 'dart:convert';

class Product {
  String? id;
  String? name;
  String? description;
  String? category;
  String? image;
  double? price;
  String? brand;
  bool? offer;

  Product({
    this.id,
    this.name,
    this.description,
    this.category,
    this.image,
    this.price,
    this.brand,
    this.offer,
  });

  // Convert a JSON map to a Product instance
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      brand: json['brand'] as String?,
      offer: json['offer'] as bool?,
    );
  }

  // Convert a Product instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'image': image,
      'price': price,
      'brand': brand,
      'offer': offer,
    };
  }
}
