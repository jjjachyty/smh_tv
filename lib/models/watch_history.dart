import 'package:json_annotation/json_annotation.dart';
import 'package:smh_tv/common/dio.dart';
import 'package:smh_tv/common/init.dart';

part 'watch_history.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class WatchingHistory {
  String UserID;
  String MovieID;
  String MovieName;
  String MovieThumbnail;
  double MovieDuration;
  String ResourcesID;
  String ResourcesName;

  double Progress;
  bool Finish;
  String CreateAt;
  WatchingHistory({
    this.UserID,
    this.MovieID,
    this.MovieName,
    this.MovieThumbnail,
    this.MovieDuration,
    this.Progress,
    this.ResourcesID,
    this.ResourcesName,
    this.Finish,
    this.CreateAt,
  });
  factory WatchingHistory.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$WatchingHistoryToJson(this);
}

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class Watching {
  String MovieID;
  String MovieThumbnail;
  int Count;
  Watching({
    this.MovieID,
    this.MovieThumbnail,
    this.Count,
  });
  factory Watching.fromJson(Map<String, dynamic> json) =>
      _$WatchingFromJson(json);
  Map<String, dynamic> toJson() => _$WatchingToJson(this);
}

List<Watching> toWatchingList(List list) {
  List<Watching> watchings = new List();
  if (list != null) {
    list.forEach((e) {
      watchings.add(Watching.fromJson(e));
    });
  }
  return watchings;
}

List<WatchingHistory> toList(List list) {
  List<WatchingHistory> movies = new List();
  if (list != null) {
    list.forEach((e) {
      movies.add(WatchingHistory.fromJson(e));
    });
  }
  return movies;
}

Future<Response> addWatch(WatchingHistory history) async {
  return post("/movie/addwatch", history.toJson());
}

Future<Response> updateWatch(WatchingHistory history) async {
  return post("/movie/updatewatch", history.toJson());
}

Future<Response> getResourceWatch(WatchingHistory history) async {
  return post("/movie/watch", history.toJson());
}

Future<Response> watchingList() async {
  var resp = await get("/movie/watching");
  if (resp.State) {
    resp.Data = toWatchingList(resp.Data);
  }
  return resp;
}

Future<Response> getResourceWatchs(int offset, String userid) async {
  var path =
      "/movie/watchs?offset=" + (offset * 15).toString() + "&userid=" + userid;

  var resp = await get(path);
  if (resp.State) {
    resp.Data = toList(resp.Data);
  }
  return resp;
}
