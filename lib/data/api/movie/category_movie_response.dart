import 'package:clean_architecture_flutter/model/category_movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_movie_response.g.dart';

@JsonSerializable()
class CategoryMoviePageResponse {
  const CategoryMoviePageResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  final int? page;
  final List<CategoryMovieResponse>? results;
  final int? totalPages;
  final int? totalResults;

  factory CategoryMoviePageResponse.fromJson(Map<String, dynamic> json) {
    return _$CategoryMoviePageResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryMoviePageResponseToJson(this);

  CategoryMoviePage toModel() {
    return CategoryMoviePage(
      page: page,
      results: results?.map((e) => e.toModel()).toList(),
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}

@JsonSerializable()
class CategoryMovieDateResponse {
  const CategoryMovieDateResponse({this.maximum, this.minimum});

  final String? maximum;
  final String? minimum;

  factory CategoryMovieDateResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryMovieDateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryMovieDateResponseToJson(this);
}

@JsonSerializable()
class CategoryMovieResponse {
  const CategoryMovieResponse({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  factory CategoryMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryMovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryMovieResponseToJson(this);

  CategoryMovie toModel() {
    final id = this.id;
    if (id == null) throw Exception("Create [CategoryMovie] with null [id]");
    return CategoryMovie(
      adult: adult,
      backdropPath: backdropPath,
      genreIds: genreIds,
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
