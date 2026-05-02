import 'dart:async';

import 'package:flutte_movie_api/feature/main_menu/logic/main_menu_event.dart';
import 'package:flutte_movie_api/feature/main_menu/logic/main_menu_state.dart';
import 'package:flutte_movie_api/model_data/model_movie_list.dart';
import 'package:flutte_movie_api/request/fetch_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainMenuBloc extends Bloc<MainMenuEvent, MainMenuState> {
  MainMenuBloc() : super(MainMenuInitial()) {
    on<MainMenuGetData>(_onGetData);
  }

  Future<void> _onGetData(
    MainMenuGetData event,
    Emitter<MainMenuState> emit,
  ) async {
    final currentState = state is MainMenuLoaded
        ? state as MainMenuLoaded
        : MainMenuLoaded();
    final dataMovie = await fetch_movie();
    List<ModelMovieList> dataMovieList = dataMovie != null
        ? dataMovie.movieList
        : [];
    emit(
      currentState.copyWith(dataMovie: dataMovie, dataMovieList: dataMovieList),
    );
  }
}
