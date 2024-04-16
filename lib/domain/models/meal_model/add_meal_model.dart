// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';
import 'dart:io';

class AddMealModel {
final dynamic mealImages;
final String description;
final String name;
final double price;
final String category;
final String howToSell;  
  AddMealModel({
    required this.mealImages,
    required this.description,
    required this.name,
    required this.price,
    required this.category,
    required this.howToSell,
  });


  AddMealModel copyWith({
    dynamic mealImages,
    String? description,
    String? name,
    double? price,
    String? category,
    String? howToSell,
  }) {
    return AddMealModel(
      mealImages: mealImages ?? this.mealImages,
      description: description ?? this.description,
      name: name ?? this.name,
      price: price ?? this.price,
      category: category ?? this.category,
      howToSell: howToSell ?? this.howToSell,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mealImages': mealImages,
      'description': description,
      'name': name,
      'price': price,
      'category': category,
      'howToSell': howToSell,
    };
  }

  factory AddMealModel.fromMap(Map<String, dynamic> map) {
    return AddMealModel(
      mealImages: map['mealImages'] as File,
      description: map['description'] as String,
      name: map['name'] as String,
      price: map['price'] as double,
      category: map['category'] as String,
      howToSell: map['howToSell'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddMealModel.fromJson(String source) => AddMealModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddMealModel(mealImages: $mealImages, description: $description, name: $name, price: $price, category: $category, howToSell: $howToSell)';
  }

  @override
  bool operator ==(covariant AddMealModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.mealImages == mealImages &&
      other.description == description &&
      other.name == name &&
      other.price == price &&
      other.category == category &&
      other.howToSell == howToSell;
  }

  @override
  int get hashCode {
    return mealImages.hashCode ^
      description.hashCode ^
      name.hashCode ^
      price.hashCode ^
      category.hashCode ^
      howToSell.hashCode;
  }
}
