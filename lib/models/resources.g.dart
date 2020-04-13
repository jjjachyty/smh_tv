// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResources _$MovieResourcesFromJson(Map<String, dynamic> json) {
  return MovieResources(
    ID: json['ID'] as String,
    Name: json['Name'] as String,
    MovieThumbnail: json['MovieThumbnail'] as String,
    MovieID: json['MovieID'] as String,
    URL: json['URL'] as String,
    ResourcesID: json['ResourcesID'] as String,
    State: json['State'] as bool,
  );
}

Map<String, dynamic> _$MovieResourcesToJson(MovieResources instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'Name': instance.Name,
      'MovieID': instance.MovieID,
      'MovieThumbnail': instance.MovieThumbnail,
      'URL': instance.URL,
      'ResourcesID': instance.ResourcesID,
      'State': instance.State,
    };
