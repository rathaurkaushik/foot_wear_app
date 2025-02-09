class Category {
  String? id;
  String? name;

  Category({this.id, this.name});

// Convert a JSON map to a Category instance
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json['id'] as String, name: json['name'] as String);
  }

  // Convert a Category instance to a JSON map
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
