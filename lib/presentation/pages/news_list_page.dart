import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsapp/data/controllers/news_controller.dart';
import 'package:newsapp/presentation/pages/home_page.dart';
import 'package:newsapp/presentation/widgets/country_selector.dart';
import 'package:newsapp/presentation/widgets/news_card.dart';

class NewsListPage extends StatelessWidget {
  final String category;

  NewsListPage({
    super.key,
    required this.category,
  });

  final newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    var countryBox = Hive.box<String>('countryBox');
    var selectedCountry = countryBox.get('selectedCountry');
    newsController.fetchNews(selectedCountry!, category);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0b4f7d),
        title: Center(
          child: Text('$category News', style: const TextStyle(color: Colors.white)),
        ),
        actions: [
          CountrySelector(category: category)
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        )
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search articles...',
                suffixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onSubmitted: (query) {
                if (query == '') {
                  newsController.fetchNews(selectedCountry, category);
                } else {
                  newsController.searchNews(selectedCountry, category, query);
                }
              },
            ),
          ),
          Obx(() {
            if (newsController.news.isEmpty) {
              return const Expanded(child: Center(child: CircularProgressIndicator()));
            } else {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsCard(news: newsController.news[index], category: category);
                  },
                  itemCount: newsController.news.length,
                ),
              );
            }
          },
          ),
        ],
      ),
    );
  }
}