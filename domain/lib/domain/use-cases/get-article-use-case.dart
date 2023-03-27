
import 'package:core/core/resources/date-state.dart';
import 'package:core/core/use-case/use_case.dart';

import '../entities/article-entity.dart';
import '../repositories/article-repository.dart';
import '../repositories/article-request.dart';

class GetArticlesUseCase implements UseCase < DataState < List < ArticleEntity >> , ArticlesRequestParams > {
  final ArticlesRepository articlesRepository;

  GetArticlesUseCase(this.articlesRepository);

  @override
  Future < DataState < List < ArticleEntity >>> call({ ArticlesRequestParams ? params }) {
    return articlesRepository.getBreakingNewsArticles(params!);
  }
}
