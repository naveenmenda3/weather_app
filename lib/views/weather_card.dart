import 'package:flutter/material.dart';
import '../models/model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;

  const WeatherCard({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(weather.city, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Temperature: ${weather.temperature}°C'),
            Text('Condition: ${weather.description}'),
            Text('Wind speed: ${weather.windSpeed}'),
            Text('Last Updated: ${weather.lastUpdated}'),
          ],
        ),
      ),
    );
  }
}
