class SensorModel {
  final double temperature;
  final double humidity;
  final bool isTankFilled;
  final bool isBirdDetected;
  final double luminosity;
  final bool isLightOn;
  final bool isFanOn;
  final bool isPumpOn;
  final String? habitatCameraImageUrl;
  final String? birdHouseCameraImageUrl;

  SensorModel({
    required this.temperature,
    required this.humidity,
    required this.isTankFilled,
    required this.isBirdDetected,
    required this.luminosity,
    required this.isLightOn,
    required this.isFanOn,
    required this.isPumpOn,
    this.habitatCameraImageUrl,
    this.birdHouseCameraImageUrl,
  });

  factory SensorModel.fromJson(Map<String, dynamic> json) {
    return SensorModel(
      temperature: (json['temperature'] ?? 0).toDouble(),
      humidity: (json['humidity'] ?? 0).toDouble(),
      isTankFilled: json['isTankFilled'] ?? false,
      isBirdDetected: json['isBirdDetected'] ?? false,
      luminosity: (json['luminosity'] ?? 0).toDouble(),
      isLightOn: json['isLightOn'] ?? false,
      isFanOn: json['isFanOn'] ?? false,
      isPumpOn: json['isPumpOn'] ?? false,
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
      'isPumpOn': isPumpOn,
      'habitatCameraImageUrl': habitatCameraImageUrl,
      'birdHouseCameraImageUrl': birdHouseCameraImageUrl,
    };
  }
}
