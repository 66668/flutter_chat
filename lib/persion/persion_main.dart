import 'package:flutter/material.dart';
import 'package:flutter_chat/common/touch_callback.dart';
import 'package:flutter_chat/persion/persion_item.dart';

/**
 * 个人主界面
 */
class PersionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //列表
      body: ListView(
        //列表开始：个人item项
        children: <Widget>[
          //头像部分
          Container(
            margin: const EdgeInsets.only(top: 20),
            color: Colors.white,
            height: 80,
            child: TouchCallBack(
                child: Row(
                  children: <Widget>[
                    //头像
                    Container(
                      margin: const EdgeInsets.only(left: 12, right: 15),
                      child: Image.asset(
                        'images/persion_img.jpg',
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ],
                ),
                callback: () {}),
          ),
          //用户名和账号
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '我是你爸爸',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Text(
                '账号 123456',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              )
            ],
          )),
          //二维码图片显示
          Container(
            margin: const EdgeInsets.only(left: 12, right: 15),
            child: Image.asset(
              'images/code.jpg',
              width: 24,
              height: 24,
            ),
          ),
          //其他列表项（使用PersonItem渲染）
          //好友动态item
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: PersionItem(
              title: '好友动态',
              imgPath: 'images/friends_all.png',
            ),
            color: Colors.white,
          ),
          //其他item
          Container(
            margin: EdgeInsets.only(top: 20),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                //消息管理item
                PersionItem(
                  title: '消息管理',
                  imgPath: 'images/manage_message.png',
                ),
                //横线
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Divider(
                    height: 0.5,
                    color: Colors.grey,
                  ),
                ),
                //我的相册item
                PersionItem(
                  title: '我的相册',
                  imgPath: 'images/photo.png',
                ),
                //横线
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Divider(
                    height: 0.5,
                    color: Colors.grey,
                  ),
                ),
                //我的文件item
                PersionItem(
                  title: '我的文件',
                  imgPath: 'images/file.png',
                ),
                //横线
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Divider(
                    height: 0.5,
                    color: Colors.grey,
                  ),
                ),
                //联系客服item
                PersionItem(
                  title: '联系客服',
                  imgPath: 'images/helper.png',
                ),
              ],
            ),
          ),
          //清理缓存item
          Container(
            margin: EdgeInsets.only(top: 20),
            color: Colors.white,
            child: PersionItem(
              title: '清理缓存',
              imgPath: 'images/clear_cache.png',
            ),
          )
        ],
      ),
    );
  }
}
