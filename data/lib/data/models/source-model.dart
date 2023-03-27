
import 'package:domain/domain/entities/source-entity.dart';

class SourceModel extends SourceEntity {

  const SourceModel ({ String ? id, String ? name, }) : super( id: id, name: name,);

  factory SourceModel.fromJson(Map < String, dynamic > json) {
    return SourceModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }
}
