import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_chat/contacts/contacts_data.dart';

/**
 * 通信录列表
 */
class ContactSliderList extends StatefulWidget {
  //列表项
  final List<ContactData> items;

  //头部项构造
  final IndexedWidgetBuilder headerBuilder;

  //item构造
  final IndexedWidgetBuilder itemBuilder;

  //字母构造
  final IndexedWidgetBuilder keyBuilder;

  ContactSliderList(
      {this.items, this.headerBuilder, this.itemBuilder, this.keyBuilder});

  @override
  ContactSliderState createState() {
    return ContactSliderState();
  }
}

class ContactSliderState extends State<ContactSliderList> {
  //列表滚动控制
  final ScrollController _scrollController = new ScrollController();

  bool _onNotification(ScrollNotification notification) {
    return true;
  }

  //判断并显示头部视图或空
  _isShowHeaderView(index) {
    if (index == 0 && widget.headerBuilder != null) {
      return Offstage(
        offstage: false,
        child: widget.headerBuilder(context, index),
      );
    }
    return Container();
  }

  //根据定位判定是否显示好友列表头
  bool _shouldShowHeader(int pos) {
    if (pos <= 0) {
      return false;
    }
    if (pos != 0 && widget.items[pos].mykey != widget.items[pos - 1].mykey) {
      return false;
    }
    return true;
  }

  //渲染列表
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //列表加载更多
          NotificationListener(
            onNotification: _onNotification,
            child: ListView.builder(
                //滚动控制器
                controller: _scrollController,
                //支持列表滑动
                physics: const AlwaysScrollableScrollPhysics(),
                //列表长度
                itemCount: widget.items.length,
                //构造
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        //显示列表头
                        _isShowHeaderView(index),
                        //是否显示英文字母（OffStage）
                        Offstage(
                          offstage: _shouldShowHeader(index),
                          child: widget.headerBuilder(context, index),
                        ),
                        //显示item
                        Column(
                          children: <Widget>[
                            widget.itemBuilder(context, index)
                          ],
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
