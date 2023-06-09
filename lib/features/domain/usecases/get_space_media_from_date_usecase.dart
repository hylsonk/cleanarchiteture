import 'package:cleanarchiteture/features/domain/entities/space_media_entity.dart';
import 'package:cleanarchiteture/core/usecase/errors/failures.dart';
import 'package:cleanarchiteture/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/space_media_repository.dart';

class GetSpaceMediaFromDateUsecase
    implements UseCase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaFromDateUsecase(this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime? date) async {
    return date != null
        ? await repository.getSpaceMediaFromDate(date)
        : Left(NullParamFailure());
  }
}
