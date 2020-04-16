import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class TVWidget extends StatefulWidget {
  TVWidget(
      {Key key,
      this.focusNode,
      @required this.child,
      @required this.focusChange,
      @required this.onclick,
      @required this.decoration,
      @required this.upNode,
      @required this.downNode,
      @required this.leftNode,
      @required this.rightNode,
      @required this.hasDecoration = true,
      @required this.requestFocus = false})
      : super(key: key);

  Widget child;
  FocusNode focusNode;
  onFocusChange focusChange;
  onClick onclick;
  bool requestFocus;
  BoxDecoration decoration;
  bool hasDecoration;
  FocusNode upNode;
  FocusNode leftNode;
  FocusNode downNode;
  FocusNode rightNode;

  @override
  State<StatefulWidget> createState() {
    return TVWidgetState(this.focusNode);
  }
}

typedef void onFocusChange(bool hasFocus);
typedef void onClick();

class TVWidgetState extends State<TVWidget> {
  FocusNode _focusNode;
  TVWidgetState(this._focusNode);

  bool init = false;
  var default_decoration = BoxDecoration(
      border: Border.all(width: 3, color: Colors.white),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ));
  var decoration = null;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) {
      _focusNode = FocusNode();
    }

    _focusNode.addListener(() {
      print("_focusNode.addListener");
      if (widget.focusChange != null) {
        widget.focusChange(_focusNode.hasFocus);
      }
      if (_focusNode.hasFocus) {
        setState(() {
          if (widget.hasDecoration) {
            decoration = widget.decoration == null
                ? default_decoration
                : widget.decoration;
          }
        });
      } else {
        setState(() {
          decoration = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.requestFocus && !init) {
      print("init--------------------0");
      FocusScope.of(context).requestFocus(_focusNode);
      init = true;
    }
    return RawKeyboardListener(
        focusNode: _focusNode,
        onKey: (event) {
          if (event is RawKeyDownEvent &&
              event.data is RawKeyEventDataAndroid) {
            RawKeyDownEvent rawKeyDownEvent = event;
            RawKeyEventDataAndroid rawKeyEventDataAndroid =
                rawKeyDownEvent.data;

            switch (rawKeyEventDataAndroid.keyCode) {
              case 19: //KEY_UP
                if (widget.upNode != null) {
                  FocusScope.of(context).requestFocus(widget.upNode);
                  return;
                }
                FocusScope.of(context).autofocus(_focusNode);

                break;
              case 20: //KEY_DOWN
                // FocusScope.of(context)
                //     .focusInDirection(TraversalDirection.down);
                // FocusScope.of(FocusManager.instance.primaryFocus.context)
                //   .focusInDirection(TraversalDirection.down);
                if (widget.downNode != null) {
                  FocusScope.of(context).requestFocus(widget.downNode);
                  return;
                }

                FocusScope.of(context).autofocus(_focusNode);
                break;
              case 21: //KEY_LEFT
                //  DefaultFocusTraversal.of(context).inDirection(
                //         FocusScope.of(context).focusedChild, TraversalDirection.left);
//                            FocusScope.of(context).requestFocus(focusNodeB0);
                if (widget.leftNode != null) {
                  FocusScope.of(context).requestFocus(widget.leftNode);
                  return;
                }
                FocusScope.of(context).autofocus(_focusNode);
                
                // 手动指定下一个焦点
                // FocusScope.of(context).requestFocus(focusNode);
                break;
              case 22: //KEY_RIGHT

                if (widget.rightNode != null) {
                  FocusScope.of(context).requestFocus(widget.rightNode);
                  return;
                }
                FocusScope.of(context).autofocus(_focusNode);

//                            FocusScope.of(context).requestFocus(focusNodeB1);
                // FocusScope.of(context)
                //     .focusInDirection(TraversalDirection.right);
//                DefaultFocusTraversal.of(context)
//                    .inDirection(_focusNode, TraversalDirection.right);
//                if(_focusNode.nextFocus()){
//                  FocusScope.of(context)
//                      .focusInDirection(TraversalDirection.right);
//                }
                break;
              case 23: //KEY_CENTER
                widget.onclick();
                break;
              case 66: //KEY_ENTER
                widget.onclick();
                break;
              default:
                break;
            }
          }
        },
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: decoration,
          child: widget.child,
        ));
  }
}
