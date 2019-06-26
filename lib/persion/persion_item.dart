import 'package:flutter/material.dart';
import 'package:flutter_chat/common/touch_callback.dart';

/**
 * 个人-item的通用组件
 */
class PersionItem extends StatelessWidget {
  //标题
  final String title;

  //图片路径
  final String imgPath;

  //图标
  final Icon icon;

  PersionItem({Key key, @required this.title, this.imgPath, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new TouchCallBack(
      callback: () {
        switch (title) {
          case '好友动态':
            Navigator.pushNamed(context, '/friends');
            break;
          case '联系客服':
            break;
        }
      },
      child: Container(
        height: 50,
        child: Row(
          children: <Widget>[
            //图标或图片
            Container(
              child: imgPath != null
                  ? Image.asset(
                      imgPath,
                      width: 32,
                      height: 32,
                    )
                  : SizedBox(
                      child: icon,
                      width: 32,
                      height: 32,
                    ),
              margin: const EdgeInsets.only(left: 22, right: 20),
            ),
            //标题
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Color(0xff353535)),
            )
          ],
        ),
      ),
    );
  }
}
