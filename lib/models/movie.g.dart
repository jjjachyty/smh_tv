// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    ID: json['ID'] as String,
    Name: json['Name'] as String,
    Cover: json['Cover'] as String,
    Years: json['Years'] as String,
    Region: json['Region'] as String,
    ScoreDB: json['ScoreDB'] as int,
    Director: json['Director'] as String,
    Actor: json['Actor'] as String,
    CreateAt: json['CreateAt'] as String,
    UpdateAt: json['UpdateAt'] as String,
    Genre: json['Genre'] as String,
    pltform: json['pltform'] as int,
    playURL: json['playURL'] as String,
    DetailURL: json['DetailURL'] as String,
    CreateBy: json['CreateBy'] as String,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'ID': instance.ID,
      'Name': instance.Name,
      'Cover': instance.Cover,
      'Years': instance.Years,
      'Region': instance.Region,
      'ScoreDB': instance.ScoreDB,
      'Genre': instance.Genre,
      'Director': instance.Director,
      'Actor': instance.Actor,
      'CreateAt': instance.CreateAt,
      'CreateBy': instance.CreateBy,
      'UpdateAt': instance.UpdateAt,
      'playURL': instance.playURL,
      'DetailURL': instance.DetailURL,
      'pltform': instance.pltform,
    };
