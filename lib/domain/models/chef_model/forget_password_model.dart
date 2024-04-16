// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Forgetpassword {
  final String email;
final String password;
final String code;
final String confirmPassword;
  Forgetpassword({
    required this.email,
    required this.password,
    required this.code,
    required this.confirmPassword,
  });

  Forgetpassword copyWith({
    String? email,
    String? password,
    String? code,
    String? confirmPassword,
  }) {
    return Forgetpassword(
      email: email ?? this.email,
      password: password ?? this.password,
      code: code ?? this.code,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'code': code,
      'confirmPassword': confirmPassword,
    };
  }

  factory Forgetpassword.fromMap(Map<String, dynamic> map) {
    return Forgetpassword(
      email: map['email'] as String,
      password: map['password'] as String,
      code: map['code'] as String,
      confirmPassword: map['confirmPassword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Forgetpassword.fromJson(String source) => Forgetpassword.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Forgetpassword(email: $email, password: $password, code: $code, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(covariant Forgetpassword other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.password == password &&
      other.code == code &&
      other.confirmPassword == confirmPassword;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      password.hashCode ^
      code.hashCode ^
      confirmPassword.hashCode;
  }
}
