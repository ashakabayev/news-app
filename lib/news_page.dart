import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/category/cubit/category_cubit.dart';
import 'package:news_app/detail_news.dart';
import 'package:news_app/news_model.dart';

class NewsPage extends StatefulWidget {
  String url;
  NewsPage({required this.url});
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final _cubit = CategoryCubit();

  bool _isLoading = false;

  NewsModel _newsModel = NewsModel();

  @override
  void initState() {
    _cubit.getNews(widget.url);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryCubit, CategoryState>(
      bloc: _cubit,
      listener: (context, state) {
        if (state is CategoryLoading) {
          _isLoading = true;
        } else {
          _isLoading = false;
        }
        if (state is CategoryLoaded) {
          _newsModel = state.newsModel;
        }
        setState(() {});
      },
      child: Scaffold(
        body: _body(),
      ),
    );
  }

  _body() {
    if (_isLoading == true) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (_isLoading == true) {
      return Center(
        child: Text('empty'),
      );
    }
    return ListView.builder(
      itemCount: _newsModel.articles?.length ?? 0,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.only(bottom: 10),
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailNews(
                            article: _newsModel.articles![index],
                          )));
              //to detail news
            },
            leading: Container(
              width: 100,
              child: _newsModel.articles![index].urlToImage != null
                  ? Image.network(_newsModel.articles![index].urlToImage ?? '')
                  : Container(),
            ),
            title: Text(_newsModel.articles![index].title ?? 'title'),
            subtitle: Text(_newsModel.articles![index].description ?? 'subtitle'),
          ),
        );
      },
    );
  }
}
