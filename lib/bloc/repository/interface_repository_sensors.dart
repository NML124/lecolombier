import 'package:lecolombier/models/sensor_model.dart';

abstract class ISensorRepository {
  Future<SensorModel> fetchSensors();
  Future<void> updateActuator({required String actuator, required bool value});
  Future<String> capturePhoto({required String camera});
  Stream<SensorModel> watchSensors();
}