import 'package:flutter/material.dart';

/**
 * 自定义触摸回调组件
 */
class TouchCallBack extends StatefulWidget {
  //子组件
  final Widget child;
  final VoidCallback callback;
  final bool isfeed;

  //背景色
  final Color background;

  //构造列表
  TouchCallBack({
    Key key,
    @required this.child,
    @required this.callback,
    this.isfeed: true,
    this.background: const Color(0xffd88d8),
  }) : super(key: key);

  @override
  TouchState createState() {
    return TouchState();
  }
}

class TouchState extends State<TouchCallBack> {
  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: color,
        child: widget.child,
      ),
      onTap: widget.callback,
      onTapDown: (d) {
        if (widget.isfeed == false) {
          return;
        }
        setState(() {
          color = widget.background;
        });
      },
      onPanCancel: () {
        setState(() {
          color = Colors.transparent;
        });
      },
    );
  }
}
