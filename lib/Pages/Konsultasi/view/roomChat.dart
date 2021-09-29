import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/route.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({@required this.messageContent, @required this.messageType});
}

class RoomChat extends StatefulWidget {
  const RoomChat({Key key}) : super(key: key);

  @override
  _RoomChatState createState() => _RoomChatState();
}

class _RoomChatState extends State<RoomChat> {
  Timer timer;
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Selamat Siang dok?", messageType: "sender"),
    ChatMessage(messageContent: "Saya ingin berkonsultasi dengan dokter terkait permasalahan saya", messageType: "sender"),
    ChatMessage(messageContent: "Selamat siang.", messageType: "receiver"),
    ChatMessage(messageContent: "Silahkan ceritakan permasalahan anda.", messageType: "receiver"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.LIST_CHAT);
            },
            icon: Icon(Icons.arrow_back, color: Config.textBlack)),
        title: Text(
          "Dr. Deddy Corbuzier",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            // bottom: 10,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver" ? Alignment.topLeft : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messages[index].messageType == "receiver" ? Colors.grey.shade200 : Colors.blue[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          messages[index].messageContent,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: "Write message...", hintStyle: TextStyle(color: Colors.black54), border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
