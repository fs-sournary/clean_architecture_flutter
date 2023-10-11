import 'package:clean_architecture_flutter/data/api/movie/movie_api.dart';
import 'package:clean_architecture_flutter/model/category_movie.dart';
import 'package:clean_architecture_flutter/usecase/async_use_case.dart';

class LoadCategoryMovieUseCase extends AsyncUseCase<int, CategoryMoviePage> {
  const LoadCategoryMovieUseCase({
    required this.category,
    required this.movieApi,
  });

  final String category;
  final MovieApi movieApi;

  @override
  Future<CategoryMoviePage> call(int params) async {
    final response =
        await movieApi.getCategoryMovies(page: params, category: category);
    return response.toModel();
  }
}
