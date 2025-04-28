class HabitatLowTechModel {
  final double temperature;
  final double humidity;
  final bool isTankFilled;
  final bool isBirdDetected;
  final double luminosity;
  final bool isLightOn;
  final bool isFanOn;
  final String? habitatCameraImageUrl;
  final String? birdHouseCameraImageUrl;
  final int numberOfPeopleInHabitatLowTech;
  final bool isHabitatLowTechCameraRecording;
  final bool isBirdCameraRecording;
  HabitatLowTechModel({
    required this.temperature,
    required this.humidity,
    required this.isTankFilled,
    required this.isBirdDetected,
    required this.luminosity,
    required this.isLightOn,
    required this.isFanOn,
    required this.numberOfPeopleInHabitatLowTech,
    required this.isBirdCameraRecording,
    required this.isHabitatLowTechCameraRecording,
    this.habitatCameraImageUrl,
    this.birdHouseCameraImageUrl,
  });

  factory HabitatLowTechModel.fromJson(Map<String, dynamic> json) {
    return HabitatLowTechModel(
      temperature: (json['temperature'] ?? 0).toDouble(),
      humidity: (json['humidity'] ?? 0).toDouble(),
      isTankFilled: json['isTankFilled'] ?? false,
      isBirdDetected: json['isBirdDetected'] ?? false,
      luminosity: (json['luminosity'] ?? 0).toDouble(),
      isLightOn: json['isLightOn'] ?? false,
      isFanOn: json['isFanOn'] ?? false,
      isBirdCameraRecording: json['isBirdHouseCameraRecording'] ?? false,
      isHabitatLowTechCameraRecording:
          json['isHabitatCameraRecording'] ?? false,
      numberOfPeopleInHabitatLowTech: json['peopleInColombier'] ?? 0,
      habitatCameraImageUrl: json['habitatCameraImageUrl'],
      birdHouseCameraImageUrl: json['birdHouseCameraImageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'humidity': humidity,
      'isTankFilled': isTankFilled,
      'isBirdDetected': isBirdDetected,
      'luminosity': luminosity,
      'isLightOn': isLightOn,
      'isFanOn': isFanOn,
      'habitatCameraImageUrl': habitatCameraImageUrl,
      'birdHouseCameraImageUrl': birdHouseCameraImageUrl,
      'isBirdHouseCameraRecording': isBirdCameraRecording,
      'isHabitatCameraRecording': isHabitatLowTechCameraRecording,
      'peopleInColombier': numberOfPeopleInHabitatLowTech,
    };
  }
}
