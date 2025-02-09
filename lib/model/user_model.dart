import 'dart:convert';

class User {
  String? id;
  String? name;
  int? number;


  User({
    this.id,
    this.name,
    this.number,

  });

  // Convert a JSON map to a Product instance
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      number: json['number'] as int?,

    );
  }

  // Convert a Product instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': number,

    };
  }
}
