import 'dart:io';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:weather_test/Network/request.dart';
import 'package:weather_test/Widgets/constant.dart';
import 'package:http/http.dart' as http;
import 'package:weather_test/model/weather.dart';

import 'res/resReader.dart';

final url = "api.openweathermap.org/data/2.5/weather?id=2332453&appid=$key";

class MockClient extends Mock implements http.Client {}

main() {
  RequestService service = RequestService();

  test('returns Weather', () async {
    final client = MockClient();

    when(client.get(Uri.parse(url))).thenAnswer((_) async =>
        Future.value(http.Response(resData('weather_res.json'), 200)));
    expect(await service.getCurrentWeather(), resData('weather_res.json'));
    // verify(client.get(Uri.parse(url))).called(2);
  });
}
