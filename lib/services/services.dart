import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/model.dart';
import '../utils/constants.dart';

class WeatherService {
  Future<WeatherModel> fetchWeather(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      print('Request URL: $url');
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load weather data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error during API call: $e');
      throw Exception('Failed to load weather data');
    }
  }
}
