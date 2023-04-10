import 'dart:convert';

import 'package:cleanarchiteture/core/usecase/errors/exceptions.dart';
import 'package:cleanarchiteture/core/utils/data_converter.dart';
import 'package:cleanarchiteture/features/data/datasources/endpoints/nasa_endpoints.dart';
import 'package:cleanarchiteture/features/data/datasources/space_media_datasource.dart';
import 'package:cleanarchiteture/features/data/models/space_media_model.dart';
import 'package:http/http.dart' as http;

class NasaDatasourceImplementation implements ISpaceMediaDatasource {
  final DateInputConverter converter;
  final http.Client client;

  NasaDatasourceImplementation({
    required this.client,
    required this.converter,
  });

  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) async {
    final dateConverted = converter.format(date);
    final response = await client.get(NasaEndpoints.getSpaceMedia(
      'DEMO_KEY',
      dateConverted,
    ));
    if (response.statusCode == 200) {
      return SpaceMediaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
