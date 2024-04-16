// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChangePasswordModel {
  final String confirmPassword;
  final String newPass;
  final String oldPass;
  ChangePasswordModel({
    required this.confirmPassword,
    required this.newPass,
    required this.oldPass,
  });

  ChangePasswordModel copyWith({
    String? confirmPassword,
    String? newPass,
    String? oldPass,
  }) {
    return ChangePasswordModel(
      confirmPassword: confirmPassword ?? this.confirmPassword,
      newPass: newPass ?? this.newPass,
      oldPass: oldPass ?? this.oldPass,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'confirmPassword': confirmPassword,
      'newPass': newPass,
      'oldPass': oldPass,
    };
  }

  factory ChangePasswordModel.fromMap(Map<String, dynamic> map) {
    return ChangePasswordModel(
      confirmPassword: map['confirmPassword'] as String,
      newPass: map['newPass'] as String,
      oldPass: map['oldPass'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChangePasswordModel.fromJson(String source) => ChangePasswordModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ChangePasswordModel(confirmPassword: $confirmPassword, newPass: $newPass, oldPass: $oldPass)';

  @override
  bool operator ==(covariant ChangePasswordModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.confirmPassword == confirmPassword &&
      other.newPass == newPass &&
      other.oldPass == oldPass;
  }

  @override
  int get hashCode => confirmPassword.hashCode ^ newPass.hashCode ^ oldPass.hashCode;
}
