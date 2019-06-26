import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/common/touch_callback.dart';
import 'package:flutter_chat/contacts/contacts_data.dart';

/**
 * 通信录信息项布局
 */
class ContactItem extends StatelessWidget {
  //通讯录item数据
  final ContactData data;

  //标题名
  final String titleName;

  //图片路径
  final String imagName;

  ContactItem({this.data, this.imagName, this.titleName});

  @override
  Widget build(BuildContext context) {
    //最外层容器
    return Container(
      //边框样式
      decoration: BoxDecoration(
        color: Colors.white,
        //每一条列表底部加一个边框线
        border: Border(
          bottom: BorderSide(width: 0.5, color: Color(0xffd9f9d9)),
        ),
      ),
      //
      height: 52,
      child: FlatButton(
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //头像
              imagName == null
                  ? Image.network(
                      data.titleUrl != ''
                          ? data.titleUrl
                          : 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4259300811,497831842&fm=26&gp=0.jpg',
                      width: 36,
                      height: 36,
                    )
                  : Image.asset(
                      imagName,
                      width: 36,
                      height: 36,
                    ),
              //展示名称或标题
              Container(
                margin: const EdgeInsets.only(left: 12),
                child: Text(
                  titleName == null ? data.name : '暂无名称',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  maxLines: 1,
                ),
              )
            ],
          )),
    );
  }
}
