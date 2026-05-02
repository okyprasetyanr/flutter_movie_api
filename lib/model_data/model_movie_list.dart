import 'package:equatable/equatable.dart';

class ModelMovieList extends Equatable {
  final String description;
  final int favorite_count;
  final int id;
  final int item_count;
  final String iso;
  final String list_type;
  final String name;
  final String poster_path;

  ModelMovieList({
    required this.description,
    required this.favorite_count,
    required this.id,
    required this.item_count,
    required this.iso,
    required this.list_type,
    required this.name,
    required this.poster_path,
  });

  @override
  List<Object?> get props => [
    description,
    favorite_count,
    id,
    item_count,
    iso,
    list_type,
    name,
    poster_path,
  ];
}
