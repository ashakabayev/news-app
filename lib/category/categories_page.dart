import 'package:flutter/material.dart';
import 'package:news_app/category/list_news_category.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({Key? key}) : super(key: key);

  List<String> _urls = [
    'https://newsapi.org/v2/everything?q=apple&from=2022-05-08&to=2022-05-08&sortBy=popularity&apiKey=6d327406106e4a0aa2cbcebf7d2e5470',
    'https://newsapi.org/v2/everything?q=tesla&from=2022-04-09&sortBy=publishedAt&apiKey=6d327406106e4a0aa2cbcebf7d2e5470',
    'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6d327406106e4a0aa2cbcebf7d2e5470',
    'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=6d327406106e4a0aa2cbcebf7d2e5470',
    'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=6d327406106e4a0aa2cbcebf7d2e5470',
  ];

  bool isLoading = false;

  _toNews(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ListNewsCateogry(
                  _urls[index],
                )));
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => NewsPage(
    //               url: _urls[index],
    //             )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            onTap: () async {
              _toNews(context, 0);
            },
            title: Text('All articles mentioning Apple'),
          ),
          ListTile(
            onTap: () async {
              _toNews(context, 1);
            },
            title: Text('Tesla'),
          ),
          ListTile(
            onTap: () async {
              _toNews(context, 2);
            },
            title: Text('Top business headlines'),
          ),
          ListTile(
            onTap: () async {
              _toNews(context, 3);
            },
            title: Text('Top headlines from TechCrunch'),
          ),
          ListTile(
            onTap: () async {
              _toNews(context, 4);
            },
            title: Text('All articles published by the Wall Street Journal'),
          ),
        ],
      ),
    );
  }
}
