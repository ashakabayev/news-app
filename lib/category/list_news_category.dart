import 'package:flutter/material.dart';
import 'package:news_app/news_page.dart';

class ListNewsCateogry extends StatelessWidget {
  String url;
  ListNewsCateogry(this.url);

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(),
      body: NewsPage(
        url: url,
      ),
    );
  }
}
