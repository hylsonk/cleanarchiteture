import 'package:cleanarchiteture/features/data/models/space_media_model.dart';
import 'package:cleanarchiteture/features/domain/entities/space_media_entity.dart';

abstract class ISpaceMediaDatasource {
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date);
}
