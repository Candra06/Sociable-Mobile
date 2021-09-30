import 'package:flutter/material.dart';
import 'package:sociable/Pages/Challenges/challengeRepository.dart';
import 'package:sociable/Pages/Challenges/model/challenge_model.dart';
import 'package:sociable/helper/config.dart';
import 'package:html/parser.dart' show parse;
import 'package:sociable/helper/route.dart';

class DetailChallenges extends StatefulWidget {
  final String idChallenges;
  const DetailChallenges({Key key, this.idChallenges}) : super(key: key);

  @override
  _DetailChallengesState createState() => _DetailChallengesState();
}

class _DetailChallengesState extends State<DetailChallenges> {
  Future<Challenge> detail;
  ChallengeRepository repository = new ChallengeRepository();

  void getData() async {
    detail = repository.detail(widget.idChallenges);
  }

  void finishChallenge() async {
    setState(() {
      Config.loading(context);
    });
    bool res = await repository.finish(widget.idChallenges);
    if (res) {
      setState(() {
        Navigator.pop(context);
        getData();
      });
    } else {
      setState(() {
        Navigator.pop(context);
        Config.alert(0, 'Gagal menyelesaikan challenge');
      });
    }
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
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
          backgroundColor: Colors.white,
          title: Text(
            "Detail Challenges",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.HOME);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Config.textBlack,
              )),
        ),
        body: FutureBuilder<Challenge>(
            future: detail,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LinearProgressIndicator();
              } else {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        margin: EdgeInsets.all(10),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                child: Container(
                                  color: Colors.white,
                                  child: Text(
                                    _parseHtmlString(snapshot.data.content),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              if (snapshot.data.status != 'Pending')
                                Icon(
                                  Icons.check_circle,
                                  size: 50,
                                  color: Colors.green,
                                )
                              else
                                InkWell(
                                  onTap: () {
                                    finishChallenge();
                                  },
                                  child: Icon(
                                    Icons.circle_outlined,
                                    size: 50,
                                    color: Colors.green,
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: Text(_parseHtmlString(snapshot.data.description)),
                      )
                    ],
                  ),
                );
              }
            }));
  }
}
