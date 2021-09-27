import 'package:driverapp/models/driver-model.dart';

class LoginRequest {
  final String phoneNumber;
  final String password;
  LoginRequest({required this.phoneNumber, required this.password});
  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
      phoneNumber: json['phone_number'] as String,
      password: json['password'] as String);
}

class LoginResponse {
  final bool status;
  final String message;
  final Driver? driver;
  LoginResponse({required this.status, required this.message, this.driver});
  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
      driver: json['driver'] != null
          ? Driver.fromJson(json['driver'] as Map<String, dynamic>)
          : null);
}
