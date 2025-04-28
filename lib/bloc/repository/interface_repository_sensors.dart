import 'package:lecolombier/models/habitat_low_tech_model.dart';

abstract class ISensorRepository {
  Future<HabitatLowTechModel> fetchSensors();
  Future<void> setValue({required String component, required bool value});
  Future<String> capturePhoto({required String camera});
  Stream<HabitatLowTechModel> watchSensors();
}
