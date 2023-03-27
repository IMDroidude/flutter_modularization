
import 'package:domain/domain/entities/article-entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class ArticleDao {
  @Query('SELECT * FROM ArticleEntity')
  Future<List<ArticleEntity>> getAllArticles();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertArticle(ArticleEntity article);

  @delete
  Future<void> deleteArticle(ArticleEntity article);
}
