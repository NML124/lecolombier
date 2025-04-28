import '../../utils/materials.dart';

abstract class SensorEvent {}

class SensorStarted extends SensorEvent {}

class SensorDataChanged extends SensorEvent {
  final HabitatLowTechModel sensor;
  SensorDataChanged(this.sensor);
}

class LoadSensors extends SensorEvent {}

class SetValue extends SensorEvent {
  final String actuator;
  final bool value;

  SetValue({required this.actuator, required this.value});
}

class CapturePhoto extends SensorEvent {
  final String camera;

  CapturePhoto({required this.camera});
}

class SensorErrorOccurred extends SensorEvent {
  final String message;

  SensorErrorOccurred(this.message);
}
