// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';


class UpdateProfileModel {
final String name;
final int phone;
final dynamic profilePic;
final String disc;
final int minCharge;
final String brandName;
final dynamic location;
  UpdateProfileModel({
    required this.name,
    required this.phone,
    required this.profilePic,
    required this.disc,
    required this.minCharge,
    required this.brandName,
    required this.location,
  });

  UpdateProfileModel copyWith({
    String? name,
    int? phone,
    dynamic profilePic,
    String? disc,
    int? minCharge,
    String? brandName,
    dynamic location,
  }) {
    return UpdateProfileModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      profilePic: profilePic ?? this.profilePic,
      disc: disc ?? this.disc,
      minCharge: minCharge ?? this.minCharge,
      brandName: brandName ?? this.brandName,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'profilePic': profilePic,
      'disc': disc,
      'minCharge': minCharge,
      'brandName': brandName,
      'location': location,
    };
  }

  factory UpdateProfileModel.fromMap(Map<String, dynamic> map) {
    return UpdateProfileModel(
      name: map['name'] as String,
      phone: map['phone'] as int,
      profilePic: map['profilePic'] as File,
      disc: map['disc'] as String,
      minCharge: map['minCharge'] as int,
      brandName: map['brandName'] as String,
      location: map['location'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateProfileModel.fromJson(String source) => UpdateProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UpdateProfileModel(name: $name, phone: $phone, profilePic: $profilePic, disc: $disc, minCharge: $minCharge, brandName: $brandName, location: $location)';
  }

  @override
  bool operator ==(covariant UpdateProfileModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.phone == phone &&
      other.profilePic == profilePic &&
      other.disc == disc &&
      other.minCharge == minCharge &&
      other.brandName == brandName &&
      other.location == location;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      phone.hashCode ^
      profilePic.hashCode ^
      disc.hashCode ^
      minCharge.hashCode ^
      brandName.hashCode ^
      location.hashCode;
  }
}
