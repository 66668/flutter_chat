import 'package:flutter/material.dart';

import 'contact_item.dart';
import 'contact_list.dart';
import 'contacts_data.dart';

/**
 * 好友主界面
 */
class ContactsPage extends StatefulWidget {
  @override
  ContactsPageState createState() {
    return ContactsPageState();
  }
}

class ContactsPageState extends State<ContactsPage> {
  //假数据
  List<ContactData> itemData = [
    new ContactData(
      'A',
      "adjgj",
      'http://5b0988e595225.cdn.sohucs.com/images/20171030/26ed195281334ba4b1752394b60eb29a.jpeg',
    ),
    new ContactData(
      'A',
      "abbbbd",
      'http://5b0988e595225.cdn.sohucs.com/images/20171030/26ed195281334ba4b1752394b60eb29a.jpeg',
    ),
    new ContactData(
      'A',
      "abbbbd",
      'http://5b0988e595225.cdn.sohucs.com/images/20171030/26ed195281334ba4b1752394b60eb29a.jpeg',
    ),
    new ContactData(
      'A',
      "abbbbd",
      'http://5b0988e595225.cdn.sohucs.com/images/20171030/26ed195281334ba4b1752394b60eb29a.jpeg',
    ),
    new ContactData(
      'A',
      "abbbbd",
      'http://5b0988e595225.cdn.sohucs.com/images/20171030/26ed195281334ba4b1752394b60eb29a.jpeg',
    ),
    new ContactData(
      's',
      "sdjgj",
      'http://5b0988e595225.cdn.sohucs.com/images/20171030/26ed195281334ba4b1752394b60eb29a.jpeg',
    ),
    new ContactData(
      's',
      "sdjgj",
      'http://5b0988e595225.cdn.sohucs.com/images/20171030/26ed195281334ba4b1752394b60eb29a.jpeg',
    ),
    new ContactData(
      's',
      "sdjgj",
      'http://5b0988e595225.cdn.sohucs.com/images/20171030/26ed195281334ba4b1752394b60eb29a.jpeg',
    ),
    new ContactData(
      's',
      "sdjgj",
      'http://5b0988e595225.cdn.sohucs.com/images/20171030/26ed195281334ba4b1752394b60eb29a.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      body: ContactSliderList(
        items: itemData,
        //头部构造
        headerBuilder: (BuildContext context, int index) {
          return Container();
        },
        //好友列表构造
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: ContactItem(data: itemData[index]),
          );
        },
        //字母构造
        keyBuilder: (BuildContext context, int index) {
          return Container(
            height: 32,
            padding: EdgeInsets.only(left: 14),
            color: Colors.grey,
            alignment: Alignment.centerLeft,
            child: Text(
              itemData[index].mykey,
              style: TextStyle(fontSize: 14, color: Color(0xff909090)),
            ),
          );
        },
      ),
    );
  }
}
