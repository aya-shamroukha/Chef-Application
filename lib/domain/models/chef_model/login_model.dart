// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LogInModelRequest {
  final String  email;
  final String password;
  LogInModelRequest({
    required this.email,
    required this.password,
  });

  LogInModelRequest copyWith({
    String? email,
    String? password,
  }) {
    return LogInModelRequest(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LogInModelRequest.fromMap(Map<String, dynamic> map) {
    return LogInModelRequest(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LogInModelRequest.fromJson(String source) => LogInModelRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LogInModelRequest(email: $email, password: $password)';

  @override
  bool operator ==(covariant LogInModelRequest other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}

class LoginModelResponse {


  final String message;
  final String token;
  LoginModelResponse({
    required this.message,
    required this.token,
  });

  LoginModelResponse copyWith({
    String? message,
    String? token,
  }) {
    return LoginModelResponse(
      message: message ?? this.message,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'token': token,
    };
  }

  factory LoginModelResponse.fromMap(Map<String, dynamic> map) {
    return LoginModelResponse(
      message: map['message'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModelResponse.fromJson(String source) => LoginModelResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginModelResponse(message: $message, token: $token)';

  @override
  bool operator ==(covariant LoginModelResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message &&
      other.token == token;
  }

  @override
  int get hashCode => message.hashCode ^ token.hashCode;
}
