import 'dart:async';

import '../../utils/materials.dart';

class SensorBloc extends Bloc<SensorEvent, SensorState> {
  final ISensorRepository repository;
  StreamSubscription<HabitatLowTechModel>? _sensorsSubscription;

  SensorBloc({required this.repository}) : super(SensorInitial()) {
    on<SensorStarted>(_onStarted);
    on<SensorDataChanged>(_onDataChanged);
    on<LoadSensors>(_onLoadSensors);
    on<ToggleActuator>(_onToggleActuator);
    on<CapturePhoto>(_onCapturePhoto);
    on<SensorErrorOccurred>(_onErrorOccurred);
  }

  Future<void> _onStarted(
    SensorStarted event,
    Emitter<SensorState> emit,
  ) async {
    emit(SensorLoading());

    await _sensorsSubscription?.cancel();
    _sensorsSubscription = repository.watchSensors().listen(
      (sensorData) {
        add(SensorDataChanged(sensorData));
      },
      onError: (error) {
        add(SensorErrorOccurred(error.toString()));
      },
    );
  }

  void _onDataChanged(SensorDataChanged event, Emitter<SensorState> emit) {
    emit(SensorLoaded(sensorModel: event.sensor));
  }

  Future<void> _onLoadSensors(
    LoadSensors event,
    Emitter<SensorState> emit,
  ) async {
    emit(SensorLoading());
    try {
      final sensors = await repository.fetchSensors();
      emit(SensorLoaded(sensorModel: sensors));
    } catch (e) {
      emit(SensorError(message: e.toString()));
    }
  }

  Future<void> _onToggleActuator(
    ToggleActuator event,
    Emitter<SensorState> emit,
  ) async {
    try {
      await repository.updateActuator(
        actuator: event.actuator,
        value: event.value,
      );
      add(LoadSensors());
    } catch (e) {
      emit(SensorError(message: e.toString()));
    }
  }

  Future<void> _onCapturePhoto(
    CapturePhoto event,
    Emitter<SensorState> emit,
  ) async {
    try {
      final imageUrl = await repository.capturePhoto(camera: event.camera);
      emit(PhotoCaptured(imageUrl: imageUrl));
    } catch (e) {
      emit(SensorError(message: e.toString()));
    }
  }

  Future<void> _onErrorOccurred(
    SensorErrorOccurred event,
    Emitter<SensorState> emit,
  ) async {
    emit(SensorError(message: event.message));
  }

  @override
  Future<void> close() {
    _sensorsSubscription?.cancel();
    return super.close();
  }
}
