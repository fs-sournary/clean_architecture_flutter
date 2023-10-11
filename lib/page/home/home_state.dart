part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.movie =  Result.loading<List<CategoryMovie>>,
  });

  final Result<List<CategoryMovie>> movie;

  @override
  List<Object> get props => [];
}
