import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociable/Pages/Challenges/challengeRepository.dart';
import 'package:sociable/Pages/Challenges/model/challenge_model.dart';
import 'package:sociable/Pages/Challenges/widget/challenges_item.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/pref.dart';

class ChallengesPage extends StatefulWidget {
  const ChallengesPage({Key key}) : super(key: key);

  @override
  _ChallengesPageState createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> with SingleTickerProviderStateMixin {
  String name = "Budi Hartono";
  String levelDiagnosa = "SAD Ringan";
  String memberShip = "false";
  String token = '', tabs = "";
  Future<List<Challenge>> listChallenge;
  List<Challenge> tmpList;
  ChallengeRepository repository = new ChallengeRepository();

  TabController _controller;

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

  void getData() async {
    listChallenge = repository.list();
  }

  List<Tab> myTab = [
    for (int i = 1; i <= 30; i++)
      Tab(
        text: i.toString(),
      ),
  ];

  @override
  void initState() {
    getInfo();
    getData();
    _controller = TabController(vsync: this, length: myTab.length);

    _controller.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    if (_controller.indexIsChanging) {
      int tmpI = _controller.index + 1;
      setState(() {
        tabs = tmpI.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: myTab.length,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(225),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/bg.png",
                        ),
                        fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "CHALLENGE",
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Stack(
                            children: [
                              Container(
                                // margin: EdgeInsets.only(top: 50),
                                padding: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 90),
                                margin: EdgeInsets.only(top: 90),
                                decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.50), borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Hai $name",
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    Text("Lakukanlah challanges tiap harinya untuk meningkatkan kemampuan bersosialmu",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))
                                  ],
                                ),
                              ),
                              Image.asset(
                                "assets/images/challenges.png",
                                height: 160,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    TabBar(
                        controller: _controller,
                        isScrollable: true,
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.white,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                        indicator: BoxDecoration(color: Colors.amber),
                        tabs: myTab)
                  ],
                ),
              ),
            ),
          ),
          body: FutureBuilder<List<Challenge>>(
              future: listChallenge,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Config.loader('Memuat data');
                } else {
                  return snapshot.hasData
                      ? TabBarView(
                          controller: _controller,
                          children: [
                            for (int i = 0; i < myTab.length; i++)
                              Center(
                                child: ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (BuildContext context, int x) {
                                      int y = i + 1;
                                      return snapshot.data[x].day.toString().contains(y.toString())
                                          ? ChallengesItem(
                                              idChallenges: snapshot.data[x].id.toString(), titleChallenges: snapshot.data[x].content, isDone: snapshot.data[x].status == 'Pending' ? false : true)
                                          : Container();
                                    }),
                              ),
                          ],
                        )
                      : Container(
                          child: Config.emptyData('Challenge belum tersedia', context),
                        );
                }
              }),
        ));
  }
}
