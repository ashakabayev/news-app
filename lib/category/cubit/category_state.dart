part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final NewsModel newsModel;
  CategoryLoaded(this.newsModel);
}

class CategoryError extends CategoryState {}
