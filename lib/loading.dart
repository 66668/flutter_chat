import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingState createState() {
    return _LoadingState();
  }
}

class _LoadingState extends State<LoadingPage> {
  @override
  void initState() {
    //在加载界面停留3s
    new Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('app');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          //加载背景图
          Image.asset('images/bg_welcome.jpg',fit: BoxFit.fill,)
        ],
      ),
    );
  }
}
