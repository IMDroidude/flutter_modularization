import 'dart:io';

import 'package:core/core/resources/date-state.dart';
import 'package:domain/domain/entities/article-entity.dart';
import 'package:domain/domain/repositories/article-repository.dart';
import 'package:domain/domain/repositories/article-request.dart';

import '../data-sources/local/app_database.dart';
import '../data-sources/remote/news_api_service.dart';
import '../models/article-model.dart';
import 'package:dio/dio.dart';


class ArticlesRepositoryImpl implements ArticlesRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;
  const ArticlesRepositoryImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<ArticleEntity>>> getBreakingNewsArticles(ArticlesRequestParams params)  async {
    try {
      final httpResponse = await _newsApiService.getBreakingNewsArticles(
        apiKey: params.apiKey,
        country: params.country,
        category: params.category,
        page: params.page,
        pageSize: params.pageSize,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles!);
      }
      return DataFailed(
        DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.badResponse,
            requestOptions: httpResponse.response.requestOptions
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

   @override
  Future<List<ArticleEntity>> getSavedArticles() async {
    return _appDatabase.articleDao.getAllArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) async {
    return _appDatabase.articleDao.deleteArticle(article);
  }

  @override
  Future<void> saveArticle(ArticleEntity article) async {
    return _appDatabase.articleDao.insertArticle(article);
  }
}
