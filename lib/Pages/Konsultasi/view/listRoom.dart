import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sociable/Pages/Konsultasi/view/listPsikolog.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/route.dart';

class ListRoomChar extends StatefulWidget {
  const ListRoomChar({Key key}) : super(key: key);

  @override
  _ListRoomCharState createState() => _ListRoomCharState();
}

class _ListRoomCharState extends State<ListRoomChar> {
  Widget itemChat() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.ROOM_CHAT);
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
                              'Dr. Deddy Corbuzier',
                              style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '2 September 2021',
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
                              'Silahkan ceritakan apa keluhan anda  ',
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext bc, int i) {
              return itemChat();
            }),
      ),
    );
  }
}