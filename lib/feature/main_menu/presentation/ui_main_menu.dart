import 'package:flutte_movie_api/feature/main_menu/logic/main_menu_bloc.dart';
import 'package:flutte_movie_api/feature/main_menu/logic/main_menu_state.dart';
import 'package:flutte_movie_api/model_data/model_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UiMainMenu extends StatefulWidget {
  const UiMainMenu({super.key});

  @override
  State<UiMainMenu> createState() => _UiMainMenuState();
}

class _UiMainMenuState extends State<UiMainMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: BlocSelector<MainMenuBloc, MainMenuState, ModelMovie?>(
                selector: (state) =>
                    state is MainMenuLoaded ? state.dataMovie : null,
                builder: (context, state) {
                  if (state == null) {
                    return CircularProgressIndicator();
                  }
                  return ListView.builder(
                    itemCount: state.movieList.length,
                    itemBuilder: (context, index) {
                      final data = state.movieList[index];
                      return Column(children: [Text("Judul: ${data.name}")]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
