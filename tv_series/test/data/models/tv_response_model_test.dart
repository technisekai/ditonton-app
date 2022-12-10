import 'dart:convert';

import 'package:tv_series/tv_series.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  final tTvModel = TvModel(
    backdropPath: '/backdropPath.jpg',
    genreIds: [1, 2, 3],
    id: 1,
    overview: 'overview',
    popularity: 1,
    posterPath: '/posterPath.jpg',
    firstAirDate: '2010-06-08',
    name: 'name',
    originalName: 'originalName',
    voteAverage: 1,
    voteCount: 1,
  );
  final tTvResponseModel = TvResponse(tvList: <TvModel>[tTvModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/on_the_air.json'));
      // act
      final result = TvResponse.fromJson(jsonMap);
      // assert
      expect(result, tTvResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tTvResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": "/backdropPath.jpg",
            "genre_ids": [1, 2, 3],
            "id": 1,
            "original_name": "originalName",
            "overview": "overview",
            "popularity": 1.0,
            "poster_path": "/posterPath.jpg",
            "first_air_date": "2010-06-08",
            "name": "name",
            "vote_average": 1.0,
            "vote_count": 1,
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
