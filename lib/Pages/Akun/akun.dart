import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociable/Pages/Forum/model/forum.dart';
import 'package:sociable/Pages/Forum/repository/forumRepo.dart';
import 'package:sociable/Pages/Forum/widget/forum_item.dart';
import 'package:sociable/Pages/Membership/membership.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/pref.dart';
import 'package:sociable/helper/route.dart';

class AkunPage extends StatefulWidget {
  final int idUser;
  AkunPage(this.idUser);

  @override
  _AkunPageState createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  String name = "Budi Hartono";
  String levelDiagnosa = "SAD Ringan";
  String memberShip = "false";
  String token = '';

  Future<List<Forum>> forumItem;
  ForumRepository repository = ForumRepository();
  bool load = true;

  void getData() async {
    setState(() {
      load = true;
    });
    print(load);
    forumItem = repository.historyForum();
    setState(() {
      load = false;
    });
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

  getInfo() async {
    var xnama = await Pref.getNama();
    var xlevel = await Pref.getLevel();
    var xtoken = await Pref.getToken();
    var xmember = await Pref.getMember();
    print('member ' + xmember);
    setState(() {
      name = xnama;
      levelDiagnosa = xlevel;
      name = xnama;
      token = xtoken;
      memberShip = xmember;
    });
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/bg.png",
                ),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20),
                // color: Color.fromRGBO(118, 171, 255, 1),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PROFIL",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
                          ),
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
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.green, image: DecorationImage(image: AssetImage("assets/images/avatar.png"), fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          if (memberShip == "true") {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return MemberShipPage();
                            }));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(name, style: TextStyle(color: Colors.black, fontSize: 25)),
                            SizedBox(
                              width: 5,
                            ),
                            if (memberShip == "true")
                              Icon(
                                Icons.payment,
                                color: Colors.amber,
                              )
                            else
                              Container()
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(23)),
                        child: Text(levelDiagnosa),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(13),
                      constraints: BoxConstraints(minHeight: 200, maxHeight: MediaQuery.of(context).size.height * 0.53),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(30))),
                      child: FutureBuilder(
                        future: forumItem,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Config.loader('Memuat data');
                          } else {
                            return snapshot.hasData
                                ? ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (BuildContext bc, int i) {
                                      return ForumItem(snapshot.data[i].id, snapshot.data[i].anonim, snapshot.data[i].content, Config.formatDateInput(snapshot.data[i].createdAt.toString()),
                                          snapshot.data[i].name.toString(), snapshot.data[i].topic, snapshot.data[i].likes, snapshot.data[i].likes, false);
                                    })
                                : Container(
                                    child: Config.emptyData('Belum ada forum', context),
                                  );
                          }
                        },
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
