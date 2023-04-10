import 'package:cleanarchiteture/features/domain/entities/space_media_entity.dart';
import 'package:cleanarchiteture/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ISpaceMediaRepository {
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(
      DateTime date);
}
