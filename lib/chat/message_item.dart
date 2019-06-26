import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/common/touch_callback.dart';

import 'message_item_data.dart';

/**
 * 聊天信息项布局
 */
class MessageItem extends StatelessWidget {
  final MessageData message;

  MessageItem(this.message);

  @override
  Widget build(BuildContext context) {
    //最外层容器
    return Container(
      //边框样式
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Color(0xffd9f9d9)),
        ),
      ),
      //
      height: 64,
      child: TouchCallBack(
        callback: () {},
        //水平显示布局
        child: Row(
          //
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //展示头像
            Container(
              //边距
              margin: const EdgeInsets.only(left: 13, right: 13),
              child: Image.network(
                message.avatar,
                width: 48,
                height: 48,
              ),
            ),
            ////主标题和子标题
            Expanded(
              child: Column(
                //垂直方向居中
                mainAxisAlignment: MainAxisAlignment.center,
                //水平左对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    message.title,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    maxLines: 1,
                  ),
                  Padding(padding: const EdgeInsets.only(top: 8.0)),
                  Text(
                    message.subTitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    maxLines: 1,
                    //显示不完，省略号表示
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            //时间
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: const EdgeInsets.only(right: 12, top: 12),
              child: Text(
                //格式化时间
                formatDate(message.time, [HH, ':', nn, ':', 'ss']).toString(),
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
