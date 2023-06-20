import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/data/models/news.dart';

class NewsController extends GetxController {
  final baseUrl = 'https://newsapi.org/v2';
  final apiKey = '711867cdd7b9401a95d0d6813171ef0a';
  final _news = [].obs;
  List get news => _news;

  Future<void> fetchNews(String country, String category) async {
    try {
      _news.value.clear();
      final response = await http.get(
        Uri.parse('$baseUrl/top-headlines?country=$country&category=$category&apiKey=$apiKey')
      );

      if (response.statusCode == 200) {
        _news.value = List.from(jsonDecode(response.body)['articles']).map((news) => News.fromJson(news)).toList();
      }
    } catch (e) {
      print('Error fetching news: $e');
    }
  }
  
  Future<void> searchNews (String country, String category, String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/top-headlines?country=$country&q=$query&category=$category&apiKey=$apiKey')
      );

      if (response.statusCode == 200) {
        _news.value = List.from(jsonDecode(response.body)['articles']).map((news) => News.fromJson(news)).toList();
      }
    } catch (e) {
      print('Error searching for news: $e');
    }
  }
}