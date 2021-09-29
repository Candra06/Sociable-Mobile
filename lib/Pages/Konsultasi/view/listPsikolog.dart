import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/route.dart';

class ListPsikolog extends StatefulWidget {
  const ListPsikolog({Key key}) : super(key: key);

  @override
  _ListPsikologState createState() => _ListPsikologState();
}

class _ListPsikologState extends State<ListPsikolog> {
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
                        Text(
                          // kelas[i]['nama'],
                          'Dr. Deddy Corbuzier',
                          style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'deddy.corbuzier@gmail.com',
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
            icon: Icon(Icons.close, color: Config.textBlack)),
        title: Text(
          "DAFTAR PSIKOLOG",
          style: TextStyle(color: Colors.black, fontSize: 25),
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
