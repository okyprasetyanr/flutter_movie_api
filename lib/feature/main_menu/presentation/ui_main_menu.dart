import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutte_movie_api/app_properties/app_properties_color.dart';
import 'package:flutte_movie_api/app_properties/app_properties_text_style.dart';
import 'package:flutte_movie_api/common_widget/row_content.dart';
import 'package:flutte_movie_api/common_widget/youtube_palyer.dart';
import 'package:flutte_movie_api/feature/main_menu/logic/main_menu_bloc.dart';
import 'package:flutte_movie_api/feature/main_menu/logic/main_menu_state.dart';
import 'package:flutte_movie_api/function/function.dart';
import 'package:flutte_movie_api/model_data/model_movie.dart';
import 'package:flutte_movie_api/request/fetch_data.dart';
import 'package:flutte_movie_api/request/fetch_image.dart';
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
        backgroundColor: AppPropertiesColor.white,
        body: Column(
          children: [
            Image.asset('assets/demoMovieLogo.png', height: 70),
            Expanded(
              child: BlocSelector<MainMenuBloc, MainMenuState, ModelMovie?>(
                selector: (state) =>
                    state is MainMenuLoaded ? state.dataMovie : null,
                builder: (context, state) {
                  if (state == null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return GridView.builder(
                    padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 1,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 380,
                          crossAxisSpacing: 5,
                        ),
                    itemCount: state.movieList.length,
                    itemBuilder: (context, index) {
                      final data = state.movieList[index];
                      return InkWell(
                        child: Card(
                          color: AppPropertiesColor.white,
                          elevation: 4,
                          child: Column(
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) {
                                  return LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppPropertiesColor.transparent,
                                      AppPropertiesColor.black,
                                      AppPropertiesColor.black,
                                      AppPropertiesColor.transparent,
                                    ],
                                    stops: [0, 0.02, 0.98, 1],
                                  ).createShader(bounds);
                                },
                                blendMode: BlendMode.dstIn,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fitWidth,
                                  imageUrl: getImage(data.posterPath),
                                  height: 150,
                                  width: double.infinity,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                color: AppPropertiesColor.primary,
                                child: Text(
                                  data.title,
                                  style: lv05TextStyleWhite,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                  vertical: 5,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    rowContent(
                                      icon: Icon(
                                        Icons.insights_rounded,
                                        color: AppPropertiesColor.secondPrimary,
                                        size: 15,
                                      ),
                                      text: data.popularity.toString(),
                                    ),
                                    rowContent(
                                      icon: Icon(
                                        Icons.star_border_rounded,
                                        color: AppPropertiesColor.secondPrimary,
                                        size: 15,
                                      ),
                                      text: data.voteAverage.toString(),
                                    ),
                                    rowContent(
                                      icon: Icon(
                                        Icons.how_to_vote_outlined,
                                        color: AppPropertiesColor.secondPrimary,
                                        size: 15,
                                      ),
                                      text: data.voteCount.toString(),
                                    ),
                                    rowContent(
                                      icon: Icon(
                                        Icons.date_range_outlined,
                                        color: AppPropertiesColor.secondPrimary,
                                        size: 15,
                                      ),
                                      text: data.releaseDate != null
                                          ? formatDate(
                                              date: data.releaseDate!,
                                              minute: false,
                                            )
                                          : "-",
                                    ),
                                    rowContent(
                                      icon: Icon(
                                        Icons.text_snippet_rounded,
                                        color: AppPropertiesColor.secondPrimary,
                                        size: 15,
                                      ),
                                      text: data.overview,
                                      align: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {
                          final dataTrailer = await fetchMovieTrailer(data.id);
                          if (dataTrailer == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Trailer tidak tersedia")),
                            );
                            return;
                          }
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return UIYoutubePlayer(
                                title: dataTrailer.name,
                                selectedData: data,
                                keyYoutube: dataTrailer.key,
                              );
                            },
                          );
                        },
                      );
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
