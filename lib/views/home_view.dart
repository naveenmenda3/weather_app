import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';
import 'weather_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WeatherController());
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(title: const Text('Weather App',style: TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.bold,
      ),),
      backgroundColor: Colors.blue,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
        controller.currentWeather.value != null
        ? WeatherCard(weather: controller.currentWeather.value!)
            : const Center(child: Text('No weather data available')),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: controller.otherCitiesWeather.length,
                itemBuilder: (context, index) {
                  return WeatherCard(weather: controller.otherCitiesWeather[index]);
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}

