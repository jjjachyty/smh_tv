// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchingHistory _$WatchingHistoryFromJson(Map<String, dynamic> json) {
  return WatchingHistory(
    UserID: json['UserID'] as String,
    MovieID: json['MovieID'] as String,
    MovieName: json['MovieName'] as String,
    MovieThumbnail: json['MovieThumbnail'] as String,
    MovieDuration: (json['MovieDuration'] as num)?.toDouble(),
    Progress: (json['Progress'] as num)?.toDouble(),
    ResourcesID: json['ResourcesID'] as String,
    ResourcesName: json['ResourcesName'] as String,
    Finish: json['Finish'] as bool,
    CreateAt: json['CreateAt'] as String,
  );
}

Map<String, dynamic> _$WatchingHistoryToJson(WatchingHistory instance) =>
    <String, dynamic>{
      'UserID': instance.UserID,
      'MovieID': instance.MovieID,
      'MovieName': instance.MovieName,
      'MovieThumbnail': instance.MovieThumbnail,
      'MovieDuration': instance.MovieDuration,
      'ResourcesID': instance.ResourcesID,
      'ResourcesName': instance.ResourcesName,
      'Progress': instance.Progress,
      'Finish': instance.Finish,
      'CreateAt': instance.CreateAt,
    };

Watching _$WatchingFromJson(Map<String, dynamic> json) {
  return Watching(
    MovieID: json['MovieID'] as String,
    MovieThumbnail: json['MovieThumbnail'] as String,
    Count: json['Count'] as int,
  );
}

Map<String, dynamic> _$WatchingToJson(Watching instance) => <String, dynamic>{
      'MovieID': instance.MovieID,
      'MovieThumbnail': instance.MovieThumbnail,
      'Count': instance.Count,
    };
