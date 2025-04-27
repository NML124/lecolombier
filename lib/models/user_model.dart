import 'package:equatable/equatable.dart';

class UserModel extends Equatable{
  final String id;
  final String name;
  final String email;
  final bool notificationTemperature;
  final bool notificationWaterLevel;
  final bool notificationBirdhouse;
  final bool notificationSecurityCamera;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.notificationTemperature=false,
    this.notificationWaterLevel=false,
    this.notificationBirdhouse=false,
    this.notificationSecurityCamera=false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      notificationTemperature: json['notificationTemperature'],
      notificationWaterLevel: json['notificationWaterLevel'],
      notificationBirdhouse: json['notificationBirdhouse'],
      notificationSecurityCamera: json['notificationSecurityCamera'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'notificationTemperature': notificationTemperature,
      'notificationWaterLevel': notificationWaterLevel,
      'notificationBirdhouse': notificationBirdhouse,
      'notificationSecurityCamera': notificationSecurityCamera,
    };
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}