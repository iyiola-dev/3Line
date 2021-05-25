import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_test/Widgets/constant.dart';
import 'package:weather_test/model/weather.dart';

class RequestService {
  Future<Weather> getCurrentWeather() async {
    try {
      var response = await http.get(Uri.parse(
          "api.openweathermap.org/data/2.5/weather?id=2332453&appid=$key&units=metric"));
      final body = json.decode(response.body);
      var data = Weather.fromJson(body);

      return data;
    } catch (e) {
      throw e;
    }
  }
}
