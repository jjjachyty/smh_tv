import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smh_tv/models/movie.dart';
import 'package:smh_tv/widgets/tv_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  List<Movie> movies;
  @override
  void initState() {
    newestMovie().then((resp) {
      if (resp.State) {
        setState(() {
          movies = resp.Data;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Row(
        children: <Widget>[
          Flexible(
            child: Column(
              children: <Widget>[
                _buildItem(0),
                _buildItem(1),
                _buildItem(2),
              ],
            ),
            flex: 1,
          ),
          Flexible(
            child: Column(
              children: <Widget>[
                _buildImageItem(0, 2),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        _buildImageItem(1, 1),
                        _buildImageItem(2, 1),
                      ],
                    )),
              ],
            ),
            flex: 4,
          ),
          Flexible(
            child: Column(
              children: <Widget>[
                _buildImageItem(3, 2),
                _buildImageItem(4, 1),
              ],
            ),
            flex: 2,
          ),
          Flexible(
            child: Column(
              children: <Widget>[
                _buildImageItem(3, 2),
                _buildImageItem(4, 1),
              ],
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  _buildItem(int index) {
    return Expanded(
      child: TVWidget(
          child: Container(
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          child: Card(
            elevation: 5,
            margin: EdgeInsets.all(0),
            color: _colors.elementAt(index),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("data"),
                ],
              ),
            ),
          ),
          onTap: () {
            _click(index);
          },
        ),
      )),
      flex: 1,
    );
  }

  _buildImageItem(int index, int flex) {
    return Expanded(
      child: TVWidget(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(0),
              color: _colors.elementAt(index),
              child: Container(
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    ClipRRect(
                      child: movies != null
                          ? Image.network(
                              movies[index].Cover,
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                            )
                          : Text(""),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            movies[index].Name,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          index == 3
                              ? Icon(
                                  Icons.search,
                                  size: 38,
                                  color: Colors.white,
                                )
                              : SizedBox(
                                  height: 0,
                                ),
                        ],
                      ),
                      color: _colors.elementAt(index).withAlpha(240),
                      padding: EdgeInsets.all(5),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              _click(index);
            },
          ),
        ),
        focusChange: (hasfocus) {
          print(hasfocus);
        },
        onclick: () {
          print("onclick");
        },
        // requestFocus: true,
        // hasDecoration: true,
        // decoration: BoxDecoration(color: Colors.yellow),
      ),
      flex: flex,
    );
  }

  void _click(int index) {
    switch (index) {
      case 0:
        break;
      case 4:
//        Navigator.push(context, MaterialPageRoute(builder: (context) {
//          return AboutPage();
//        }));
        break;
    }
  }

  List<Icon> _icons = [
    Icon(
      Icons.search,
      size: 38,
      color: Colors.white,
    ),
    Icon(
      Icons.history,
      size: 38,
      color: Colors.white,
    ),
    Icon(
      Icons.event,
      size: 38,
      color: Colors.white,
    ),
    Icon(
      Icons.share,
      size: 38,
      color: Colors.deepPurpleAccent,
    ),
    Icon(
      Icons.error_outline,
      size: 38,
      color: Colors.orange,
    ),
    Icon(
      Icons.settings,
      size: 38,
      color: Colors.red,
    )
  ];

  List<Color> _colors = [
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.orange,
    Colors.orange,
    Colors.orange,
    Colors.orange,
  ];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
