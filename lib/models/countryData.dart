import 'dart:convert';
import 'package:http/http.dart';

class CountryData {
  String name;
  String fullName;
  String code;
  List<String> languages;
  String currency;
  String travelAdvise;
  List<String> neighbors;

  CountryData({ this.code });

  Future<void> getData() async {

    try {
      // Get data
      Response response = await get('https://travelbriefing.org/' + code + '?format=json');
      Map data = jsonDecode(response.body);
      
      // Set fields to data values
      name = data["names"]["name"];

      fullName = data["names"]["full"];

      languages = List.generate(data["language"].length, 
        (index) => data["language"][index]["language"]
      );

      currency = data["currency"]["name"];

      neighbors = List.generate(data["neighbors"].length, 
        (index) => data["neighbors"][index]["name"]
      );
      
      travelAdvise = data["advise"]["CA"]["advise"];
      travelAdvise = travelAdvise.substring(travelAdvise.indexOf('>') + 1, travelAdvise.lastIndexOf('<'));
    } 
    catch(e) {
      print(e);
    }
    
  }
}