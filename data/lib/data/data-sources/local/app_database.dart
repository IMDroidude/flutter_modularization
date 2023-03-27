// required package imports
import 'dart:async';
import 'package:domain/domain/entities/article-entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'DAOs/article-dao.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleEntity])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}
