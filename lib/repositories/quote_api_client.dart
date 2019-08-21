import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:qod/models/models.dart';

class QouteAPIClient {
   static const baseUrl = 'http://quotes.rest';
   final httpClient =  http.Client();
   
   Future<Quote> getQouteOfTheDay() async {
     final locationUrl = '$baseUrl/qod';
     Map<String, String> requestHeaders = {
       'Accept': 'application/json'
     };
     final response = await this.httpClient.get(locationUrl, headers: requestHeaders);

     if (response.statusCode != 200) {
       throw Exception('error getting qoute of the day');
     } 
      final json = jsonDecode(response.body);
      return Quote.fromJson(json);
   }
}