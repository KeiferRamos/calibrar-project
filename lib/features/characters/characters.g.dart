// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      airDate: json['air_date'] as String? ?? "",
      episode: json['episode'] as String? ?? "",
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'air_date': instance.airDate,
      'episode': instance.episode,
    };

Origin _$OriginFromJson(Map<String, dynamic> json) => Origin(
      dimension: json['dimension'] as String? ?? "",
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$OriginToJson(Origin instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dimension': instance.dimension,
    };

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      gender: json['gender'] as String? ?? "",
      id: json['id'] as String? ?? "",
      image: json['image'] as String? ?? "",
      name: json['name'] as String? ?? "",
      species: json['species'] as String? ?? "",
      status: json['status'] as String? ?? "",
      episode: (json['episode'] as List<dynamic>?)
              ?.map((e) => Episode.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      location: json['location'] == null
          ? null
          : Origin.fromJson(json['location'] as Map<String, dynamic>),
      origin: json['origin'] == null
          ? null
          : Origin.fromJson(json['origin'] as Map<String, dynamic>),
      type: json['type'] as String? ?? "",
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'status': instance.status,
      'species': instance.species,
      'gender': instance.gender,
      'image': instance.image,
      'episode': instance.episode,
      'origin': instance.origin,
      'location': instance.location,
    };

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      count: (json['count'] as num?)?.toInt() ?? 0,
      next: (json['next'] as num?)?.toInt(),
      pages: (json['pages'] as num?)?.toInt() ?? 0,
      prev: (json['prev'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };

CharactersData _$CharactersDataFromJson(Map<String, dynamic> json) =>
    CharactersData(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactersDataToJson(CharactersData instance) =>
    <String, dynamic>{
      'results': instance.results,
      'info': instance.info,
    };
