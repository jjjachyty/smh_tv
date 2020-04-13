import 'package:json_annotation/json_annotation.dart';
import 'package:smh_tv/common/dio.dart';
import 'package:smh_tv/models/spiders/diaosidao.dart';

import 'movie.dart';
// user.g.dart 将在我们运行生成命令后自动生成
part 'resources.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class MovieResources {
  String ID;
  String Name;
  String MovieID;
  String MovieThumbnail;
  String URL;
  String ResourcesID;
  bool State;
  MovieResources(
      {this.ID,
      this.Name,
      this.MovieThumbnail,
      this.MovieID,
      this.URL,
      this.ResourcesID,
      this.State});
  //不同的类使用不同的mixin即可
  factory MovieResources.fromJson(Map<String, dynamic> json) =>
      _$MovieResourcesFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResourcesToJson(this);
}

List<MovieResources> toList(List list) {
  List<MovieResources> movieResourcess = new List();
  if (list != null) {
    list.forEach((e) {
      var _res = MovieResources.fromJson(e);
      movieResourcess.add(_res);
    });
  }
  return movieResourcess;
}

Future<Response> movieResources(String id) async {
  var resp = await get("/movie/resources/" + id);
  if (resp.State) {
    resp.Data = toList(resp.Data);
  }
  return resp;
}

Future<Response> addResources(MovieResources resources) async {
  return await post("/movie/addresources", resources.toJson());
}

Future<List<MovieResources>> getResources(Movie movie) async {
  List<MovieResources> list;
  if (movie.ID != null) {
    var _resp = await movieResources(movie.ID);
    if (_resp.State) {
      list = _resp.Data as List<MovieResources>;
    }
  }
  if (movie.DetailURL == null || movie.DetailURL == "") {
    return list;
  }

  List<MovieResources> onlineList;
  //从第三方来
  onlineList = (await resources(movie.DetailURL));
  if (list == null) {
    //本地没有 直接返回在线的
    return onlineList;
  }
  var _tmp = new List<MovieResources>();
  onlineList.forEach((f) {
    // var addFlag = false;
    list.forEach((e) {
      print("${e.Name}====${f.Name}");
      if (e.Name == f.Name) {
        f = e;
      }
    });
    // if (!addFlag) {
    //   _tmp.add(f);
    // }
  });
  // list.addAll(_tmp);
  return onlineList;
}
