import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/model.dart';
import '../services/services.dart';

class WeatherController extends GetxController {
  var currentWeather = Rxn<WeatherModel>();
  var otherCitiesWeather = <WeatherModel>[].obs;
  var isLoading = true.obs;

  final WeatherService _weatherService = WeatherService();

  @override
  void onInit() {
    super.onInit();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    isLoading.value = true;

    try {
      final localWeather = await _weatherService.fetchWeather('Mumbai');
      currentWeather.value = localWeather;

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('cached_weather', localWeather.city);
    } catch (e) {
      print('Error fetching local weather: $e');

      final prefs = await SharedPreferences.getInstance();
      final cachedCity = prefs.getString('cached_weather');
      if (cachedCity != null) {
        currentWeather.value = WeatherModel(
          city: cachedCity,
          temperature: 0.0,
          description: 'No internet connection',
          lastUpdated: DateTime.now(),
          windSpeed: 0.0,
        );
      }
    }

    // Fetch weather for other cities
    List<String> cities = ['New York', 'Singapore', 'Mumbai', 'Delhi', 'Sydney', 'Melbourne'];
    for (var city in cities) {
      try {
        final weather = await _weatherService.fetchWeather(city);
        otherCitiesWeather.add(weather);
      } catch (e) {
        print('Error fetching city $city: $e');
      }
    }

    isLoading.value = false;
  }
}
