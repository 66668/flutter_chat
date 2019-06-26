import 'package:flutter/material.dart';
import 'package:flutter_chat/persion/persion_main.dart';

import 'chat/message_main.dart';
import 'contacts/contacts_main.dart';
import 'loading.dart';

/**
 * 主程序入口
 */
class App extends StatefulWidget {
  @override
  AppState createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  //当前选中页面索引
  var _currentIndex = 0;

  //各个主界面
  //（1）聊天主界面
  MessagePage messagePage;

  //（2）好友主界面
  ContactsPage contactsPage;

  //（3）个人主界面
  PersionPage persionPage;

  /**
   * 根据当前索引返回不同界面
   */
  currentPage() {
    switch (_currentIndex) {
      case 0:
        if (messagePage == null) {
          messagePage = new MessagePage();
        }
        return messagePage;
      case 1:
        if (contactsPage == null) {
          contactsPage = new ContactsPage();
        }
        return contactsPage;
      case 2:
        if (persionPage == null) {
          persionPage = new PersionPage();
        }
        return persionPage;
      default:
        break;
    }
  }

  /**
   * 创建菜单选项
   */
  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
        child: Row(
      children: <Widget>[
        imagePath != null
            ? Image.asset(
                imagePath,
                width: 32,
                height: 32,
              )
            : SizedBox(
                width: 32,
                height: 32,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
        //显示菜单项文本内容
        Container(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('即时通讯'),
        actions: <Widget>[
          //搜索
          GestureDetector(
            child: Icon(Icons.search),
            onTap: () {
              //跳转至搜索界面
              Navigator.pushNamed(context, 'search');
            },
          ),
          //更多菜单项(统一用+表示)
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: GestureDetector(
              child: Icon(Icons.add),
              onTap: () {
                //弹窗
                showMenu(
                    context: context,
                    //弹窗定位
                    position: RelativeRect.fromLTRB(500, 76, 10, 0),
                    //展示所有子菜单
                    items: <PopupMenuEntry>[
                      _popupMenuItem('发起会话',
                          imagePath: 'images/message_ingroup.png'),
                      _popupMenuItem('添加好友',
                          imagePath: 'images/contacts_add.png'),
                      _popupMenuItem('联系客服', icon: Icons.person),
                    ]);
              },
            ),
          ),
        ],
      ),
      //底部导航按钮
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          //当前索引
          currentIndex: _currentIndex,
          onTap: ((index) {
            setState(() {
              _currentIndex = index;
            });
          }),
          //底部导航按钮
          items: [
            //聊天按钮
            BottomNavigationBarItem(
                title: Text(
                  '聊天',
                  style: TextStyle(
                      color:
                          _currentIndex == 0 ? Color(0xFF46c01b) : Colors.grey),
                ),
                icon: _currentIndex == 0
                    ? Image.asset(
                        'images/message_pressed.png',
                        width: 32,
                        height: 32,
                      )
                    : Image.asset(
                        'images/message_normal.png',
                        width: 32,
                        height: 32,
                      )),
            //好友按钮
            BottomNavigationBarItem(
                title: Text(
                  '通讯录',
                  style: TextStyle(
                      color:
                          _currentIndex == 1 ? Color(0xFF46c01b) : Colors.grey),
                ),
                icon: _currentIndex == 1
                    ? Image.asset(
                        'images/contact_pressed.png',
                        width: 32,
                        height: 32,
                      )
                    : Image.asset(
                        'images/contact_normal.png',
                        width: 32,
                        height: 32,
                      )),
            //个人按钮
            BottomNavigationBarItem(
                title: Text(
                  '个人',
                  style: TextStyle(
                      color:
                          _currentIndex == 2 ? Color(0xFF46c01b) : Colors.grey),
                ),
                icon: _currentIndex == 2
                    ? Image.asset(
                        'images/mine_pressed.png',
                        width: 32,
                        height: 32,
                      )
                    : Image.asset(
                        'images/mine_normal.png',
                        width: 32,
                        height: 32,
                      )),
          ]),
      body: currentPage(),
    );
  }
}
