import 'package:flutter/material.dart';
import 'package:news_app/category/categories_page.dart';
import 'package:news_app/news_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _screens = [
    NewsPage(
      url:
          'https://newsapi.org/v2/everything?q=apple&from=2022-05-08&to=2022-05-08&sortBy=popularity&apiKey=6d327406106e4a0aa2cbcebf7d2e5470',
    ),
    CategoriesPage()
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(''),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                _index = 0;
                setState(() {});
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Categories'),
              onTap: () {
                _index = 1;
                setState(() {});
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _screens[_index],
    );
  }
}
