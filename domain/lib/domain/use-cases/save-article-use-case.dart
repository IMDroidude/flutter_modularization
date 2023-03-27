
import 'package:core/core/use-case/use_case.dart';

import '../entities/article-entity.dart';
import '../repositories/article-repository.dart';

class SaveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticlesRepository _articlesRepository;

  SaveArticleUseCase(this._articlesRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articlesRepository.saveArticle(params!);
  }
}
