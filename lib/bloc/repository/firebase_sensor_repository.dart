import 'dart:async';

import 'package:lecolombier/utils/materials.dart';

class FirebaseSensorRepository implements ISensorRepository {
  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  @override
  Future<HabitatLowTechModel> fetchSensors() async {
    final snapshot = await _db.child('sensors').get();
    if (snapshot.exists) {
      return HabitatLowTechModel.fromJson(
        Map<String, dynamic>.from(snapshot.value as Map),
      );
    } else {
      throw Exception('No data found');
    }
  }

  @override
  Future<void> updateActuator({
    required String actuator,
    required bool value,
  }) async {
    await _db.child('actuators/$actuator').set(value);
  }

  @override
  Future<String> capturePhoto({required String camera}) async {
    final completer = Completer<String>();

    final ref = _db.child('cameras/$camera');

    // On demande la capture
    await ref.child('capture').set(true);

    // On écoute le changement sur l'URL
    final subscription = ref.child('imageUrl').onValue.listen((event) {
      final imageUrl = event.snapshot.value as String?;
      if (imageUrl != null && imageUrl.isNotEmpty) {
        completer.complete(imageUrl);
      }
    });

    // Sécurité : timeout au bout de 10 secondes si rien
    Future.delayed(const Duration(seconds: 10), () {
      if (!completer.isCompleted) {
        completer.completeError(Exception('Timeout waiting for image URL'));
        subscription.cancel();
      }
    });

    final imageUrl = await completer.future;
    subscription.cancel(); // On arrête d'écouter après avoir reçu l'image
    return imageUrl;
  }

  @override
  Stream<HabitatLowTechModel> watchSensors() {
    return _db.child('sensors').onValue.map((event) {
      final snapshot = event.snapshot;
      if (snapshot.exists) {
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        return HabitatLowTechModel.fromJson(data);
      } else {
        throw Exception('No data found in realtime database');
      }
    });
  }
}
