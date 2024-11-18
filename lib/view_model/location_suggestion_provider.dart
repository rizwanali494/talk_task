import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LocationSuggestionProvider with ChangeNotifier {
  final String _apiKey = 'AIzaSyDO2VyNH8vC2ZhZX8BhwpkvzxKaSLAE0ic';
  List<dynamic> _suggestedLocations = [];
  List<dynamic> get suggestedLocations => _suggestedLocations;


  Future<void> fetchLocationSuggestions(String query) async {
    final url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$_apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          final predictions = data['predictions'] as List;
          _suggestedLocations = predictions;
          print(_suggestedLocations);
          notifyListeners();
        } else {
          throw Exception('Failed to fetch locations: ${data['status']}');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
