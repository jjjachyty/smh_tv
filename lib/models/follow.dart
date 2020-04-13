import 'package:json_annotation/json_annotation.dart';
import 'package:smh_tv/common/dio.dart';

part 'follow.g.dart';

@JsonSerializable()
class Follow {
  String ID;
  String UserID;
  String FollowID;
  String FollowName;
  String FollowAvatar;
  String CreateAt;
  Follow(
      {this.ID,
      this.UserID,
      this.FollowID,
      this.FollowName,
      this.FollowAvatar,
      this.CreateAt});
  //不同的类使用不同的mixin即可
  factory Follow.fromJson(Map<String, dynamic> json) => _$FollowFromJson(json);
  Map<String, dynamic> toJson() => _$FollowToJson(this);
}

List<Follow> toFollowList(List list) {
  List<Follow> movies = new List();
  if (list != null) {
    list.forEach((e) {
      movies.add(Follow.fromJson(e));
    });
  }
  return movies;
}

Future<Response> addFollow(Follow follow) {
  return post("/user/followadd", follow.toJson());
}

Future<Response> removeFollow(String followID) {
  return post("/user/followremove", {"FollowID": followID});
}

Future<bool> checkFollow(String followID) async {
  var _resp =
      await get("/user/followcheck", parameters: {"FollowID": followID});
  if (_resp.State && Follow.fromJson(_resp.Data).ID != "") {
    return true;
  }
  return false;
}
