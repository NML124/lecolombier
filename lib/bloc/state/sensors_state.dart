import 'package:lecolombier/models/habitat_low_tech_model.dart';

abstract class SensorState {}

class SensorInitial extends SensorState {}

class SensorLoading extends SensorState {}

class SensorLoaded extends SensorState {
  final HabitatLowTechModel sensorModel;

  SensorLoaded({required this.sensorModel});
}

class SensorError extends SensorState {
  final String message;

  SensorError({required this.message});
}

class PhotoCaptured extends SensorState {
  final String imageUrl;

  PhotoCaptured({required this.imageUrl});
}
