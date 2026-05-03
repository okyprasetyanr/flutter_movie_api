import 'package:flutte_movie_api/feature/main_menu/logic/main_menu_bloc.dart';
import 'package:flutte_movie_api/feature/main_menu/logic/main_menu_event.dart';
import 'package:flutte_movie_api/feature/main_menu/presentation/ui_main_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainMenuBloc()..add(MainMenuGetData()),
        ),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: UiMainMenu());
  }
}
