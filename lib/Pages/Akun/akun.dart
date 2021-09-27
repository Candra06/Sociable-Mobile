import 'package:flutter/material.dart';
import 'package:sociable/Pages/Forum/widget/forum_item.dart';
import 'package:sociable/Pages/Membership/membership.dart';
import 'package:sociable/helper/pref.dart';

class AkunPage extends StatefulWidget {
  final int idUser;
  AkunPage(this.idUser);

  @override
  _AkunPageState createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  String name = "Budi Hartono";
  String levelDiagnosa = "SAD Ringan";
  String memberShip = "Basic";
  String token = '';

  getInfo() async {
    var xnama = await Pref.getNama();
    var xlevel = await Pref.getLevel();
    var xtoken = await Pref.getToken();
    setState(() {
      name = xnama;
      levelDiagnosa = xlevel;
      name = xnama;
      token = xtoken;
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
          child: ListView(
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
                              onPressed: () {},
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
                          if (memberShip == "Basic") {
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
                            if (memberShip == "Premium")
                              Icon(
                                Icons.payment,
                                color: Colors.amber,
                              )
                            else
                              Icon(Icons.payment)
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
                    width: double.infinity,
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(30))),
                    child: Column(
                      children: [
                        for (int i = 0; i < 10; i++) ForumItem(i, "isiForum", "10 menit yang lalu", "penulis", "forumTopik", i * i * i, i * i, true)
                        // ForumItem(idForum, "isiForum", "waktuPosting", "penulis", "forumTopik", "jumlahLike", "jumlahKomentar", "isLike")
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
