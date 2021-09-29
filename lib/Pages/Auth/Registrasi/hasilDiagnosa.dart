import 'package:flutter/material.dart';
import 'package:sociable/MainPage.dart';
import 'package:sociable/Pages/Challenges/challengeRepository.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/route.dart';

class HasilDiagnosa extends StatefulWidget {
  final String nama;
  const HasilDiagnosa({Key key, this.nama}) : super(key: key);

  @override
  _HasilDiagnosaState createState() => _HasilDiagnosaState();
}

class _HasilDiagnosaState extends State<HasilDiagnosa> {
  void submit() async {
    setState(() {
      Config.loading(context);
    });
    ChallengeRepository repository = new ChallengeRepository();

    bool respon = await repository.insertChallenge();
    if (respon) {
      Navigator.pop(context);
      Navigator.pushNamed(context, Routes.HOME);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        title: Center(
            child: Text(
          "HASIL DIAGNOSA",
          style: TextStyle(fontSize: 20, color: Colors.black),
        )),
      ),
      body: Stack(
        children: [
          Container(
              margin: EdgeInsets.only(top: 40),
              child: Image.asset(
                "assets/images/joinAs.png",
                height: 280,
              )),
          Container(
            margin: EdgeInsets.only(left: 185, top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hai " + widget.nama,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  ""
                  "Berdasarkan hasil diagnosa kami, kamu bukan termasuk orang yang mengidap Social Anxiety Disorder (SAD) loh.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Flexible(
              fit: FlexFit.tight,
              child: Container(
                margin: EdgeInsets.only(top: 220),
                padding: EdgeInsets.only(right: 5, left: 5, top: 20),
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(46, 230, 255, 1),
                    // color:Colors.blue;
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    )),
                child: Column(
                  children: [
                    Text(
                      "Jangan Khawatir, Kamu Tetap Bisa Menggunakan Sociable",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      "Melalui fitur-fitur yang tersedia, kami yakin dapat menjauhkanmu dari penyakit Social Anxiety Disorder",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 110,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(image: AssetImage("assets/images/chalange.png"), fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          width: 110,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(image: AssetImage("assets/images/forum.png"), fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          width: 110,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(image: AssetImage("assets/images/konten.png"), fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                    Builder(
                      builder: (context) => Container(
                        width: 155,
                        height: 45,
                        margin: EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(53),
                        ),
                        child: FlatButton(
                          child: Text(
                            "Join Program",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          onPressed: () {
                            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                            //   return MainPage();
                            // }));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
