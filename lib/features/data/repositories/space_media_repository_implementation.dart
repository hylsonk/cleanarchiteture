import 'package:cleanarchiteture/core/usecase/errors/exceptions.dart';
import 'package:cleanarchiteture/core/usecase/errors/failures.dart';
import 'package:cleanarchiteture/features/domain/entities/space_media_entity.dart';
import 'package:cleanarchiteture/features/domain/repositories/space_media_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/space_media_datasource.dart';

class SpaceMediaRepositoryImplementation implements ISpaceMediaRepository {
  final ISpaceMediaDatasource datasource;

  SpaceMediaRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(
      DateTime date) async {
    try {
      final result = await datasource.getSpaceMediaFromDate(date);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
