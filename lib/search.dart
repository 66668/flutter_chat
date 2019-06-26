import 'package:flutter/material.dart';

import 'common/touch_callback.dart';

/**
 * 搜索主界面
 * 功能点：输入焦点
 */
class SearchPage extends StatefulWidget {
  @override
  _SearchState createState() {
    return _SearchState();
  }
}

class _SearchState extends State<SearchPage> {
  //定义焦点节点
  FocusNode focusNode = new FocusNode();

  //获取焦点
  _requestFocus() {
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }

  //获取输入文本
  _getText(String text) {
    return TouchCallBack(
        isfeed: false,
        callback: () {},
        child: Text(
          text,
          style: TextStyle(fontSize: 14, color: Color(0xff1aad19)),
        ));
  }

  /**
   * 搜索页面渲染
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //顶部预留距离
        margin: const EdgeInsets.only(top: 25),
        //整体垂直布局
        child: Column(
          //水平方向居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //顶部导航栏：返回按钮，搜索框，其他按钮
            Stack(
              //<1>
              children: <Widget>[
                //（1）使用触摸回调组件
                TouchCallBack(
                  isfeed: false,
                  callback: () {
                    //使用导航器返回上一个界面
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 45,
                    margin: const EdgeInsets.only(left: 12, right: 10),
                    //添加返回按钮
                    child: Icon(Icons.chevron_left),
                    color: Colors.black,
                  ),
                ),
                //(2)搜索框容器
                Container(
                  alignment: Alignment.centerLeft,
                  height: 45,
                  margin: const EdgeInsets.only(left: 50, right: 10),
                  //设置边框样式
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.green)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //（1）
                      Expanded(
                        //输入框
                        child: TextField(
                          //请求焦点
                          focusNode: _requestFocus(),
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          onChanged: (String text) {},
                          //搜索框设置
                          decoration: InputDecoration(
                              hintText: '搜索', border: InputBorder.none),
                        ),
                      ),
                      //（2）
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.mic,
                          color: Color(0xffaaaaaa),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            //<2>
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Text(
                '常用搜索',
                style: TextStyle(fontSize: 16, color: Color(0xffb5b5b5)),
              ),
            ),
            //<3>
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                //对齐:均匀对齐
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //第一行搜索
                children: <Widget>[
                  _getText('朋友'),
                  _getText('聊天'),
                  _getText('群组'),
                ],
              ),
            ),
            //<4>
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                //对齐:均匀对齐
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //第2行搜索
                children: <Widget>[
                  _getText('Flutter'),
                  _getText('Dart'),
                  _getText('Android'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
