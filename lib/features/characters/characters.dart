import 'package:json_annotation/json_annotation.dart';

part 'characters.g.dart';

@JsonSerializable()
class Episode {
  final String id;
  final String name;

  @JsonKey(name: "air_date")
  final String airDate;

  final String episode;

  Episode({
    this.airDate = "",
    this.episode = "",
    this.id = "",
    this.name = "",
  });

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}

@JsonSerializable()
class Origin {
  final String id;
  final String name;
  final String dimension;

  Origin({
    this.dimension = "",
    this.id = "",
    this.name = "",
  });

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);

  Map<String, dynamic> toJson() => _$OriginToJson(this);
}

@JsonSerializable()
class Character {
  final String id;

  final String name;

  final String type;

  final String status;

  final String species;

  final String gender;

  final String image;

  final List<Episode> episode;

  final Origin? origin;

  final Origin? location;

  Character({
    this.gender = "",
    this.id = "",
    this.image = "",
    this.name = "",
    this.species = "",
    this.status = "",
    this.episode = const [],
    this.location,
    this.origin,
    this.type = "",
  });

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable()
class Info {
  final int count;
  final int pages;
  final int? next;
  final int? prev;

  Info({
    this.count = 0,
    this.next,
    this.pages = 0,
    this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class CharactersData {
  final List<Character> results;
  final Info info;

  CharactersData({
    required this.info,
    required this.results,
  });

  factory CharactersData.fromJson(Map<String, dynamic> json) =>
      _$CharactersDataFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersDataToJson(this);
}
