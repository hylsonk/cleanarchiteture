import 'package:cleanarchiteture/features/domain/entities/space_media_entity.dart';
import 'package:cleanarchiteture/features/domain/repositories/space_media_repository.dart';
import 'package:cleanarchiteture/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:cleanarchiteture/core/usecase/errors/failures.dart';
import 'package:cleanarchiteture/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceMediaFromDateUsecase usecase;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaFromDateUsecase(repository);
  });

  final tSpaceMedia = SpaceMediaEntity(
    description:
        "Meteors can be colorful. While the human eye usually cannot discern many colors, cameras often can. Pictured is a Quadrantids meteor captured by camera over Missouri, USA, early this month that was not only impressively bright, but colorful. The radiant grit, likely cast off by asteroid 2003 EH1, blazed a path across Earth's atmosphere.  Colors in meteors usually originate from ionized elements released as the meteor disintegrates, with blue-green typically originating from magnesium, calcium radiating violet, and nickel glowing green. Red, however, typically originates from energized nitrogen and oxygen in the Earth's atmosphere.  This bright meteoric fireball was gone in a flash -- less than a second -- but it left a wind-blown ionization trail that remained visible for several minutes.   APOD is available via Facebook: in English, Catalan and Portuguese",
    mediaType: "image",
    title: "A Colorful Quadrantid Meteor  ",
    mediaUrl:
        "https://apod.nasa.gov/apod/image/2102/MeteorStreak_Kuszaj_1080.jpg",
  );

  final tDate = DateTime(2021, 02, 02);

  test('should get space media entity for a given date from the repository',
      () async {
    // Arrange
    when(() => repository.getSpaceMediaFromDate(any()))
        .thenAnswer((_) async => Right<Failure, SpaceMediaEntity>(tSpaceMedia));

    // Act
    final result = await usecase(tDate);

    // Assert
    expect(result, Right(tSpaceMedia));
    verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
  });

  test('should return a Failure when don\'t succed', () async {
    // Arrange
    when(() => repository.getSpaceMediaFromDate(any())).thenAnswer(
        (_) async => Left<Failure, SpaceMediaEntity>(ServerFailure()));

    // Act
    final result = await usecase(tDate);

    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
  });

  test('should return a NullParamFailure when receives a null param', () async {
    // Arrange
    // Act
    final result = await usecase(null);
    // Assert
    expect(result, Left(NullParamFailure()));
    verifyNever(() => repository.getSpaceMediaFromDate(tDate));
  });
}
