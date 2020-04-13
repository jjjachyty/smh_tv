import 'package:json_annotation/json_annotation.dart';
import 'package:smh_tv/common/dio.dart';
import 'package:smh_tv/common/init.dart';
import 'package:smh_tv/models/spiders/diaosidao.dart';
// user.g.dart 将在我们运行生成命令后自动生成
part 'movie.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class Movie {
  String ID;
  String Name;
  String Cover;
  String Years;
  String Region;
  int ScoreDB;
  String Genre;
  String Director;
  String Actor;
  String CreateAt;
  String CreateBy;
  String UpdateAt;
  String playURL;
  String DetailURL;
  int pltform;
  Movie({
    this.ID,
    this.Name,
    this.Cover,
    this.Years,
    this.Region,
    this.ScoreDB,
    this.Director,
    this.Actor,
    this.CreateAt,
    this.UpdateAt,
    this.Genre,
    this.pltform,
    this.playURL,
    this.DetailURL,
    this.CreateBy,
  });
  //不同的类使用不同的mixin即可
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

List<Movie> toList(List list) {
  List<Movie> movies = new List();
  if (list != null) {
    list.forEach((e) {
      movies.add(Movie.fromJson(e));
    });
  }
  return movies;
}

Future<Response> newestMovie() async {
  var resp = await get("/movie/newest");
  if (resp.State) {
    resp.Data = toList(resp.Data);
  }
  return resp;
}

Future<Response> movieRecommend() async {
  var resp = await get("/movie/recommend");
  if (resp.State) {
    resp.Data = toList(resp.Data);
  }
  return resp;
}

Future<Response> movieList(int pageSize) async {
  var resp = await get("/movie/all?offset=" + pageSize.toString());
  if (resp.State) {
    resp.Data = toList(resp.Data);
  }
  return resp;
}

Future<Response> movieGet(String id) async {
  var resp = await get("/movie/get?id=" + id);
  if (resp.State) {
    resp.Data = Movie.fromJson(resp.Data);
  }
  return resp;
}

Future<Response> movieAdd(Movie movie) async {
  return await post("/movie/add", movie.toJson());
}

Future<Response> movieRemove(String id) async {
  return await delete("/movie/id/" + id);
}

Future<Response> serach(String key) async {
  var resp = await get("/movie/serach?key=" + key);
  List<Movie> locationList;
  if (resp.State) {
    locationList = toList(resp.Data);
    // 查询屌丝岛
  }

  var onlineList = await dsdSerach(key);
  if (onlineList.length > 0) {
    onlineList.forEach((f) {
      locationList.forEach((e) {
        // print("${e.Name} ==== ${f.Name} === ${e.Director}=== ${f.Director}");
        if (e.Name == f.Name && e.Director == f.Director) {
          f = e;
        }
      });
    });
  }
  resp.Data = onlineList;

  return resp;
}

Future<Response> userCreate(int offset, String userid) async {
  var path = "/user/moviecreate";

  var resp =
      await get(path, parameters: {"offset": (offset * 15), "userid": userid});
  if (resp.State) {
    resp.Data = toList(resp.Data);
  }
  return resp;
}
