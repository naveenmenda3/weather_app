class WeatherModel {
  final String city;
  final double temperature;
  final String description;
  final DateTime lastUpdated;
  final double windSpeed;

  WeatherModel({
    required this.city,
    required this.temperature,
    required this.description,
    required this.lastUpdated,
    required this.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['name'],
      temperature: json['main']['temp'],
      description: json['weather'][0]['description'],
      lastUpdated: DateTime.now(),
      windSpeed: json['wind']['speed'],
    );
  }
}