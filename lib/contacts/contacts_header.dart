import 'package:flutter/material.dart';

import 'contact_item.dart';
import 'contacts_data.dart';

/**
 * 通讯录-添加好友，公共聊天功能(未使用)
 */
class ContactHeader extends StatelessWidget {
  //通讯录头部
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ContactItem(
          titleName: '添加好友',
          imagName: 'images/friends_all.png',
        ),
        ContactItem(
          titleName: '公共聊天',
          imagName: 'images/friends_all.png',
        ),
      ],
    );
  }
}
