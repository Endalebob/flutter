import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  Future<dynamic> getWeatherByCityName(cityName) async {
    NetworkHelper networkHelper = await NetworkHelper(
        '''https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=fee9b4c0b8bfdd7396b5a039e6ebec34&units=metric''');
    var networkData = await networkHelper.getData();
    return networkData;
  }

  Future<dynamic> getLocationData() async {
    Location locate = Location();
    await locate.getLocation();
    NetworkHelper networkHelper = NetworkHelper('''
https://api.openweathermap.org/data/2.5/weather?lat=${locate.latitude}&lon=${locate.logitude}&appid=fee9b4c0b8bfdd7396b5a039e6ebec34&units=metric''');

    var weatherdata = await networkHelper.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
