import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociable/Pages/Auth/Diagnosa/diagnosa_repository.dart';
import 'package:sociable/Pages/Auth/Diagnosa/question_model.dart';
import 'package:sociable/Pages/Auth/Registrasi/hasilDiagnosaDua.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/pref.dart';

import 'hasilDiagnosa.dart';

class DiagnosaPage extends StatefulWidget {
  const DiagnosaPage({Key key}) : super(key: key);

  @override
  _DiagnosaPageState createState() => _DiagnosaPageState();
}

class _DiagnosaPageState extends State<DiagnosaPage> {
  Future<List<Question>> question;
  DiagnosaRepository repository = new DiagnosaRepository();
  bool load = true;
  List pertanyaan = [], nilai = [], id = [];
  int index = 0;

  void getData() async {
    setState(() {
      load = true;
    });
    question = repository.showQuestion();
    setState(() {
      load = false;
    });
  }

  void submitAnswer() async {
    setState(() {
      Config.loading(context);
    });
    var tmpNama = await Pref.getNama();
    Question model = new Question();
    String tmpID = '', tmpNilai = '';
    for (var i = 0; i < id.length; i++) {
      if (i == id.length - 1) {
        tmpID = tmpID + id[i].toString();
      } else {
        tmpID = tmpID + id[i].toString() + ',';
      }
    }
    for (var i = 0; i < id.length; i++) {
      if (i == id.length - 1) {
        tmpNilai = tmpNilai + nilai[i].toString();
      } else {
        tmpNilai = tmpNilai + nilai[i].toString() + ',';
      }
    }
    model.question = tmpID;
    model.point = tmpNilai;
    var data = await repository.answerQuestion(model);
    print(data['']);
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('level_diagnosa', data['data']);
    sp.setString('isDiagnosa', 'false');
    if (data['data'] == 'Bukan SAD') {
      print(data['data']);
      Navigator.pop(context);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return HasilDiagnosa(
          nama: tmpNama,
        );
      }));
    } else {
      Navigator.pop(context);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return HasilDiagnosaDua(
          nama: tmpNama,
          level: data['data'],
        );
      }));
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Widget buttnVal(int value, String valueString) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // print("hello");
            List tmpNilai = nilai;
            if (index == pertanyaan.length - 1) {
              tmpNilai[index] = value;
              nilai = tmpNilai;
              submitAnswer();
            } else {
              tmpNilai[index] = value;

              nilai = tmpNilai;
              setState(() {
                index += 1;
              });
            }
          },
          child: Text(
            value.toString(),
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),

            padding: EdgeInsets.all(15),
            primary: Colors.white, // <-- Button color
            onPrimary: Colors.blue, // <-- Splash color
          ),
        ),
        Container(
            width: 50,
            height: 90,
            margin: EdgeInsets.only(top: 10),
            child: Text(
              valueString,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            // color: Colors.blue[200],
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/bg.png",
                ),
                fit: BoxFit.cover),
          ),
          child: FutureBuilder<List<Question>>(
              future: question,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Config.loader('Memuat Data');
                } else {
                  for (var i = 0; i < snapshot.data.length; i++) {
                    if (index == 0) {
                      pertanyaan.add(snapshot.data[i].questions);
                      nilai.add(0);
                      id.add(snapshot.data[i].id);
                    }
                  }
                  print(nilai);
                  int ke = index + 1;
                  return ListView(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 160,
                              left: 58,
                              right: 58,
                            ),
                            width: 294,
                            height: 294,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26),
                                // color: Colors.blue
                                color: Color.fromARGB(50, 255, 255, 255)),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 121,
                              left: 46,
                              right: 46,
                            ),
                            width: 318,
                            height: 318,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26),
                                // color: Colors.blue
                                color: Color.fromARGB(100, 214, 243, 255)),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 81,
                              left: 35,
                              right: 35,
                            ),
                            width: 342,
                            height: 342,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26),
                                // color: Colors.blue
                                color: Colors.white),
                            child: Stack(
                              children: [
                                Container(
                                  width: 278,
                                  margin: EdgeInsets.only(left: 34, right: 34, top: 39),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Pertanyaan ke ' + ke.toString() + ' dari ' + snapshot.data.length.toString() + ' pertanyaan'),
                                    ],
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                    child: Center(
                                      child: Text(
                                        pertanyaan[index],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 24),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 28,
                          left: 34,
                          right: 34,
                        ),
                        padding: const EdgeInsets.only(top: 24),
                        // width: 400
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            // color: Colors.blue
                            color: Color.fromARGB(40, 255, 255, 255)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buttnVal(0, "Sangat Tidak Terganggu"),
                            buttnVal(1, "Tidak Terganggu"),
                            buttnVal(2, "biasa"),
                            buttnVal(3, "terganggu"),
                            buttnVal(4, "sangat terganggu"),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              })),
    );
  }
}

class ButtonInput extends StatelessWidget {
  int value;
  final String valueString;

  ButtonInput(this.value, this.valueString);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // print("hello");
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
              return HasilDiagnosa();
              // return MainPage();
            }));
          },
          child: Text(
            value.toString(),
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),

            padding: EdgeInsets.all(15),
            primary: Colors.white, // <-- Button color
            onPrimary: Colors.blue, // <-- Splash color
          ),
        ),
        Container(
            width: 50,
            height: 90,
            margin: EdgeInsets.only(top: 10),
            child: Text(
              valueString,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
            ))
      ],
    );
  }
}
