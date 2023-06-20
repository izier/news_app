import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:newsapp/presentation/pages/news_list_page.dart';
import 'package:newsapp/presentation/widgets/country_selector.dart';

class NewsDetailPage extends StatefulWidget {
  final String url;
  final String category;

  const NewsDetailPage({
    super.key,
    required this.url,
    required this.category,
  });

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  late final WebViewController controller;
  
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(widget.url));
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0b4f7d),
        title: const Center(
          child: Text('Article Detail', style: TextStyle(color: Colors.white)),
        ),
        actions: [
          CountrySelector(category: widget.category)
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewsListPage(category: widget.category)));},
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
