
class Country {
  String name;
  String code;
  String lastUpdate;
  Map today;
  Map total;


  Country.fromJson(String countryName, Map<String, dynamic> map)
      : name = countryName,
        code = map['data']["code"],
        lastUpdate = map['data']["updated_at"],
        today = map['data']["today"],
        total = map['data']["latest_data"];
}

