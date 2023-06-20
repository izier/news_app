import 'package:flutter/material.dart';
import 'package:newsapp/presentation/pages/news_list_page.dart';

class CategoryCard extends StatelessWidget {
  final String category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsListPage(category: category)));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: const Color(0xff0b4f7d),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.article, color: Colors.white),
          ),
          const SizedBox(height: 2),
          Text(category),
        ],
      ),
    );
  }
}