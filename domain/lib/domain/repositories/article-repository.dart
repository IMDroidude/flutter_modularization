import 'package:core/core/resources/date-state.dart';
import '../entities/article-entity.dart';
import 'article-request.dart';

abstract class ArticlesRepository {
  // API methods
  Future < DataState < List < ArticleEntity >>> getBreakingNewsArticles(ArticlesRequestParams params);
  // Database methods
  Future < List < ArticleEntity >> getSavedArticles();
  Future < void > saveArticle(ArticleEntity article);
  Future < void > removeArticle(ArticleEntity article);
}
