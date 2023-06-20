import 'package:flutter/material.dart';
import 'package:newsapp/presentation/widgets/category_card.dart';
import 'package:newsapp/presentation/widgets/country_selector.dart';

class HomePage extends StatelessWidget {
  final category = [
    'Business',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0b4f7d),
        title: const Center(
          child: Text('News Category', style: TextStyle(color: Colors.white)),
        ),
        actions: const [
          CountrySelector(category: 'Business'),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemBuilder: (context, index) {
            return CategoryCard(category: category[index]);
          },
          itemCount: category.length,
        ),
      ),
    );
  }
}