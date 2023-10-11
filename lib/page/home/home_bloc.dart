import 'package:bloc/bloc.dart';
import 'package:clean_architecture_flutter/model/category_movie.dart';
import 'package:clean_architecture_flutter/util/result.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
