// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SendCodeModel {
  final String message;
  SendCodeModel({
    required this.message,
  });

  SendCodeModel copyWith({
    String? message,
  }) {
    return SendCodeModel(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
    };
  }

  factory SendCodeModel.fromMap(Map<String, dynamic> map) {
    return SendCodeModel(
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SendCodeModel.fromJson(String source) => SendCodeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SendCodeModel(message: $message)';

  @override
  bool operator ==(covariant SendCodeModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
