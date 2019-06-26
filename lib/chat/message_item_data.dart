/**
 * 聊天信息数据
 */
class MessageData {
  //头像
  String avatar;

  //主标题
  String title;

  //子标题
  String subTitle;

//消失时间
  DateTime time;

//消息类型
  MessageType type;

  MessageData(this.avatar, this.title, this.subTitle, this.time, this.type);
}

/**
 * 消息类型
 */
enum MessageType { SYSTEM, PUBLIC, CHAT, GROUP }
