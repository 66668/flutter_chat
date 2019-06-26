import 'package:flutter/material.dart';

import 'message_item.dart';
import 'message_item_data.dart';

/**
 * 聊天主界面(列表)
 */
class MessagePage extends StatefulWidget {
  @override
  MessagepageState createState() {
    return MessagepageState();
  }
}

class MessagepageState extends State<MessagePage> {
  //假数据
  List<MessageData> messageData = [
    new MessageData(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561482152309&di=8901ecbf4035b3cb67ca19bece8750b2&imgtype=0&src=http%3A%2F%2Fm.360buyimg.com%2Fpop%2Fjfs%2Ft25522%2F10%2F238237751%2F22440%2Fe8ad1a31%2F5b696d01N81cf0413.jpg',
        '一休哥',
        '我是你爸爸',
        DateTime.now(),
        MessageType.CHAT),
    new MessageData(
        'http://5b0988e595225.cdn.sohucs.com/images/20171030/26ed195281334ba4b1752394b60eb29a.jpeg',
        '小可爱',
        '我是你爷爷',
        DateTime.now(),
        MessageType.CHAT),
    new MessageData(
        'http://5b0988e595225.cdn.sohucs.com/images/20171030/26ed195281334ba4b1752394b60eb29a.jpeg',
        '小可爱',
        '我是你爷爷',
        DateTime.now(),
        MessageType.CHAT),
    new MessageData(
        'http://5b0988e595225.cdn.sohucs.com/images/20171030/26ed195281334ba4b1752394b60eb29a.jpeg',
        '小可爱',
        '我是你爷爷',
        DateTime.now(),
        MessageType.CHAT),
    new MessageData(
        'http://5b0988e595225.cdn.sohucs.com/images/20171030/26ed195281334ba4b1752394b60eb29a.jpeg',
        '小可爱',
        '我是你爷爷',
        DateTime.now(),
        MessageType.CHAT),
    new MessageData(
        'http://5b0988e595225.cdn.sohucs.com/images/20171030/26ed195281334ba4b1752394b60eb29a.jpeg',
        '小可爱',
        '我是你爷爷',
        DateTime.now(),
        MessageType.CHAT),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MessageItem(messageData[index]);
        },
        itemCount: messageData.length,
      ),
    );
  }
}
