import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sociable/Pages/Konsultasi/model/psikolog.dart';
import 'package:sociable/Pages/Konsultasi/repository/konsultasi_repository.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/route.dart';

class ListPsikolog extends StatefulWidget {
  const ListPsikolog({Key key}) : super(key: key);

  @override
  _ListPsikologState createState() => _ListPsikologState();
}

class _ListPsikologState extends State<ListPsikolog> {
  Future<List<Psikolog>> listPsikolog;
  KonsultasiRepository repository = new KonsultasiRepository();

  void getData() async {
    listPsikolog = repository.listPsikolog();
  }

  Widget itemChat(String nama, email, id) {
    return InkWell(
      onTap: () {
        var data = {'id_room': '-', 'id_receiver': id, 'nama_receiver': nama};
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
                        Text(
                          // kelas[i]['nama'],
                          nama,
                          style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              email,
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
        body: FutureBuilder<List<Psikolog>>(
            future: listPsikolog,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LinearProgressIndicator();
              } else {
                return snapshot.hasData
                    ? Container(
                        padding: EdgeInsets.all(8),
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext bc, int i) {
                              return itemChat(snapshot.data[i].username, snapshot.data[i].email, snapshot.data[i].id.toString());
                            }),
                      )
                    : Container();
              }
            }));
  }
}
