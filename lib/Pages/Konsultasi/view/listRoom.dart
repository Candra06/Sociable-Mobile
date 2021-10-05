import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociable/Pages/Konsultasi/model/room.dart';
import 'package:sociable/Pages/Konsultasi/repository/konsultasi_repository.dart';
import 'package:sociable/Pages/Konsultasi/view/listPsikolog.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/pref.dart';
import 'package:sociable/helper/route.dart';

class ListRoomChar extends StatefulWidget {
  const ListRoomChar({Key key}) : super(key: key);

  @override
  _ListRoomCharState createState() => _ListRoomCharState();
}

class _ListRoomCharState extends State<ListRoomChar> {
  Future<List<Room>> room;
  KonsultasiRepository repository = new KonsultasiRepository();
  String role = '';

  void getData() async {
    var tmpRole = await Pref.getRole();
    room = repository.listRoom();
    setState(() {
      role = tmpRole;
      print(role);
    });
  }

  Widget itemChat(String idRoom, username, idReceiver, date, message) {
    return InkWell(
      onTap: () {
        var data = {'id_room': idRoom, 'id_receiver': idReceiver, 'nama_receiver': username};
        Navigator.pushNamed(context, Routes.ROOM_CHAT, arguments: data);
      },
      child: Card(
        child: Container(
            margin: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Container(
                    constraints: BoxConstraints(minWidth: 200, maxWidth: 335),
                    // width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 8, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              // kelas[i]['nama'],
                              username,
                              style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              Config.formatDateInput(date),
                              // kelas[i]['mapel'],
                              style: GoogleFonts.lato(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              message,
                              style: TextStyle(fontFamily: 'AirbnbMedium', fontSize: 12, color: Config.textGrey),
                            )
                          ],
                        ))
                      ],
                    )),
              ],
            )),
      ),
    );
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void logout() async {
    showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Apakah anda yakin?'),
        content: new Text('Ingin keluar dari akun ini.'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('Tidak'),
          ),
          new FlatButton(
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              await pref.clear();
              Navigator.pushNamed(context, Routes.LOGIN);
            },
            child: new Text('Iya'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: role == 'Psikolog'
            ? AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                title: Text(
                  "CHAT",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        logout();
                      },
                      icon: Icon(
                        Icons.logout,
                        color: Colors.black,
                        size: 30,
                      ))
                ],
              )
            : AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.HOME);
                    },
                    icon: Icon(Icons.arrow_back, color: Config.textBlack)),
                title: Text(
                  "CHAT",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //   return AddNewForum();
            // }));
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) {
                  return ListPsikolog();
                },
                fullscreenDialog: true));
          },
          child: IconButton(
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ListPsikolog();
                  },
                  fullscreenDialog: true));
            },
            icon: Icon(Icons.chat),
          ),
        ),
        body: FutureBuilder<List<Room>>(
            future: room,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LinearProgressIndicator();
              } else {
                if (snapshot.data.length > 0) {
                  return snapshot.hasData
                      ? Container(
                          padding: EdgeInsets.all(8),
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext bc, int i) {
                                return itemChat(snapshot.data[i].idRoom.toString(), snapshot.data[i].username, snapshot.data[i].receiver.toString(), snapshot.data[i].createdAt.toString(),
                                    snapshot.data[i].message);
                              }),
                        )
                      : Container(child: Config.emptyData('Belum ada konsultasi', context));
                } else {
                  return Container(child: Config.emptyData('Belum ada konsultasi', context));
                }
              }
            }));
  }
}
