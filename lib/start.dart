import 'package:flutter/material.dart';
import 'package:flutter_chat/search.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'loading.dart';
import 'main.dart';

/**
 * 主程序入口
 */
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '聊天程序',
      //自定义主题
      theme: mTheme,
      //设置路由
      routes: <String, WidgetBuilder>{
        "app": (BuildContext context) => new App(),
        "/friends": (_) => WebviewScaffold(
              //webview插件
              url: "https://flutter.io/",
              appBar: AppBar(
                title: Text('Flutter官网'),
              ),
              withZoom: true,
              withLocalStorage: true,
            ),
        //搜索
        'search': (BuildContext context) => new SearchPage(),
      },
      //默认首页
      home: new LoadingPage(),
    ));

final ThemeData mTheme = new ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Color(0xffebebeb),
    cardColor: Colors.green);
