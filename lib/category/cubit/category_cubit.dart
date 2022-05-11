import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:news_app/news_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  Future<void> getNews(String url) async {
    final response = await http.get(Uri.parse(url)).catchError((e) {
      print(e.toString());
    });
    print(response.statusCode);
    print(response.body);
    NewsModel _newsModel = NewsModel.fromJson(json.decode(response.body));
    return emit(CategoryLoaded(_newsModel));
  }
}
