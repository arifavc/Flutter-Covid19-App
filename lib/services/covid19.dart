import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ulkeler.dart';
import 'package:covid19/models/Country.dart';




List<String> getAllCountries() {
  List<String> allCountries = [];
  countries.forEach((key, value) => allCountries.add(value));
  return allCountries;
}


String convertAlpha(var countryName) {
  for (var entry in countries.entries) {
    if (entry.value == countryName) {
      return entry.key;
    }
  }
} 


  Future<Country> fetchData(String countryName) async {
    String alphaCode = convertAlpha(countryName);
    var response = await http.get('https://corona-api.com/countries/'+alphaCode);

    if (response.statusCode == 200) {
      return Country.fromJson(countryName, json.decode(response.body));
    } else {
      throw Exception('Veri çekilemedi');
    }
  }




