import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sociable/Pages/Konsultasi/model/detailRoom.dart';
import 'package:sociable/Pages/Konsultasi/repository/konsultasi_repository.dart';
import 'package:sociable/Pages/Konsultasi/view/listRoom.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/pref.dart';
import 'package:sociable/helper/route.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({@required this.messageContent, @required this.messageType});
}

class RoomChat extends StatefulWidget {
  final String idRoom;
  final String idReceiver;
  final String nameReeiver;
  const RoomChat({Key key, this.idRoom, this.idReceiver, this.nameReeiver}) : super(key: key);

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

  Future<List<DetailRoom>> detail;
  KonsultasiRepository repository = new KonsultasiRepository();
  TextEditingController txtMessage = new TextEditingController();
  String room = '', idSender = '';
  bool load = false;

  void getInfo() async {
    setState(() {
      load = true;
    });
    String sender = await Pref.getID();

    if (widget.idRoom == '-') {
      print(idSender);
      setState(() {
        room = widget.idRoom;
        idSender = sender;
        load = false;
      });
    } else {
      print(idSender);
      setState(() {
        room = widget.idRoom;
        idSender = sender;
        getData(room);
        load = false;
      });
    }
  }

  void getData(idRoom) async {
    setState(() {
      detail = repository.detailRoom(idRoom);
    });
  }

  void send() async {
    String sender = await Pref.getID();
    print(sender);
    DetailRoom body = new DetailRoom();
    body.sender = int.parse(sender);
    body.receiver = int.parse(widget.idReceiver);
    body.message = txtMessage.text;
    dynamic data = await repository.send(body);
    if (data['status'] == true) {
      setState(() {
        room = data['data']['id_room'].toString();
        getData(room);
        txtMessage.clear();
      });
    } else {
      Config.alert(0, 'Gagal mengirim pesan');
    }
  }

  @override
  void initState() {
    if (widget.idRoom != '-' || room != '-') {
      getInfo();
      timer = Timer.periodic(Duration(seconds: 10), (Timer t) {
        setState(() {
          getData(widget.idRoom);
        });
      });
      // getData(widget.idRoom);
    } else {
      getInfo();
    }
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, PageTransition(child: ListRoomChar(), type: PageTransitionType.leftToRight));
            },
            icon: Icon(Icons.arrow_back, color: Config.textBlack)),
        title: Text(
          widget.nameReeiver,
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            // bottom: 10,
            child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: load
                    ? Config.loader('Memuat data')
                    : room == '-'
                        ? Container()
                        : FutureBuilder<List<DetailRoom>>(
                            future: detail,
                            builder: (context, snapshot) {
                              return ListView.builder(
                                itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                // physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                                    child: Align(
                                      alignment: (snapshot.data[index].sender.toString() != idSender ? Alignment.topLeft : Alignment.topRight),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: (snapshot.data[index].sender.toString() != idSender ? Colors.grey.shade200 : Colors.blue[200]),
                                        ),
                                        padding: EdgeInsets.all(16),
                                        child: Text(
                                          snapshot.data[index].message,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          )),
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
                      controller: txtMessage,
                      decoration: InputDecoration(hintText: "Write message...", hintStyle: TextStyle(color: Colors.black54), border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      if (txtMessage.text.isNotEmpty) {
                        send();
                      }
                    },
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
