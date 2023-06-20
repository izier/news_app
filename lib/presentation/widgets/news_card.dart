import 'package:flutter/material.dart';
import 'package:newsapp/data/models/news.dart';
import 'package:newsapp/presentation/pages/news_detail_page.dart';

class NewsCard extends StatelessWidget {
  final News news;
  final String category;

  const NewsCard({
    super.key,
    required this.news,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailPage(url: news.url, category: category)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: const Color(0xfff0f1f3),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                news.author,
                style: const TextStyle(
                  color: Color(0xff0b4f7d),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                news.publishedAt,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}