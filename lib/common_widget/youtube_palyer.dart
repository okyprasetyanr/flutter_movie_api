import 'package:flutte_movie_api/app_properties/app_properties_color.dart';
import 'package:flutte_movie_api/app_properties/app_properties_text_style.dart';
import 'package:flutte_movie_api/common_widget/row_content.dart';
import 'package:flutte_movie_api/function/function.dart';
import 'package:flutte_movie_api/model_data/model_movie_list.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class UIYoutubePlayer extends StatefulWidget {
  final String keyYoutube;
  final ModelMovieList selectedData;
  final String title;
  const UIYoutubePlayer({
    super.key,
    required this.keyYoutube,
    required this.selectedData,
    required this.title,
  });

  @override
  State<UIYoutubePlayer> createState() => _UIYoutubePlayerState();
}

class _UIYoutubePlayerState extends State<UIYoutubePlayer> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.selectedData;
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.3,
      maxChildSize: 0.8,
      expand: false,
      builder: (context, scrollController) => ListView(
        controller: scrollController,
        children: [
          YoutubePlayer(controller: controller),
          const SizedBox(height: 10),
          Text("${data.title}: ${widget.title}", style: subTitleTextStyleBold),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              rowContent(
                                icon: Icon(
                                  Icons.insights_rounded,
                                  color: AppPropertiesColor.secondPrimary,
                                  size: 15,
                                ),
                                text: data.popularity.toString(),
                              ),
                              const SizedBox(height: 10),
                              rowContent(
                                icon: Icon(
                                  Icons.star_border_rounded,
                                  color: AppPropertiesColor.secondPrimary,
                                  size: 15,
                                ),
                                text: data.voteAverage.toString(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              rowContent(
                                icon: Icon(
                                  Icons.how_to_vote_outlined,
                                  color: AppPropertiesColor.secondPrimary,
                                  size: 15,
                                ),
                                text: data.voteCount.toString(),
                              ),

                              const SizedBox(height: 10),
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text("Overview", style: subTitleTextStyle),
                Text(
                  data.overview,
                  style: lv05TextStyle,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void initController() async {
    controller = YoutubePlayerController(
      initialVideoId: widget.keyYoutube,
      flags: YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }
}
