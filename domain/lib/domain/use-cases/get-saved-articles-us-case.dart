
import 'package:core/core/use-case/use_case.dart';

import '../entities/article-entity.dart';
import '../repositories/article-repository.dart';

class GetSavedArticlesUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticlesRepository _articlesRepository;

  GetSavedArticlesUseCase(this._articlesRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articlesRepository.getSavedArticles();
  }
}
