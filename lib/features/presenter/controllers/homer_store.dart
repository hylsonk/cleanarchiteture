import 'package:cleanarchiteture/core/usecase/errors/failures.dart';
import 'package:cleanarchiteture/features/domain/entities/space_media_entity.dart';
import 'package:cleanarchiteture/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends NotifierStore<Failure, SpaceMediaEntity> {
  final GetSpaceMediaFromDateUsecase usecase;

  HomeStore(this.usecase)
      : super(const SpaceMediaEntity(
          description: '',
          mediaType: '',
          title: '',
          mediaUrl: null,
        ));

  getSpaceMediaFromDate(DateTime? date) async {
    executeEither(() =>
        usecase(date) as Future<EitherAdapter<Failure, SpaceMediaEntity>>);
  }
}
