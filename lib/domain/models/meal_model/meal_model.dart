// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetChefMealModel {
  final String id;
  final String name;
  final String description;
  final int price;
  final String howToSell;
  final String category;
  final String chefId;
  final String status;
  final String createdAt;
  final String updatedAt;
  final List<String> images;
  GetChefMealModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.howToSell,
    required this.category,
    required this.chefId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });



  GetChefMealModel copyWith({
    String? id,
    String? name,
    String? description,
    int? price,
    String? howToSell,
    String? category,
    String? chefId,
    String? status,
    String? createdAt,
    String? updatedAt,
    List<String>? images,
  }) {
    return GetChefMealModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      howToSell: howToSell ?? this.howToSell,
      category: category ?? this.category,
      chefId: chefId ?? this.chefId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'description': description,
      'price': price,
      'howToSell': howToSell,
      'category': category,
      'chefId': chefId,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'images': images,
    };
  }

  factory GetChefMealModel.fromMap(Map<String, dynamic> map) {
    return GetChefMealModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as int,
      howToSell: map['howToSell'] as String,
      category: map['category'] as String,
      chefId: map['chefId'] as String,
      status: map['status'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      images: List.generate(map['images'].length,(index)=>map['images'][index],
    ));
  }

  String toJson() => json.encode(toMap());

  factory GetChefMealModel.fromJson(String source) => GetChefMealModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetChefMealModel(id: $id, name: $name, description: $description, price: $price, howToSell: $howToSell, category: $category, chefId: $chefId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, images: $images)';
  }

  @override
  bool operator ==(covariant GetChefMealModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.price == price &&
      other.howToSell == howToSell &&
      other.category == category &&
      other.chefId == chefId &&
      other.status == status &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      howToSell.hashCode ^
      category.hashCode ^
      chefId.hashCode ^
      status.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      images.hashCode;
  }
}
