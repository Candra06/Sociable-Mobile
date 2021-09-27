
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociable/Pages/Challenges/widget/challenges_item.dart';

class ChallengesPage extends StatelessWidget {
  List<Tab> myTab = [
    for(int i=1;i<=30;i++)
    Tab(
      text: i.toString(),
    ),
  ];
  // const ChallengesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          initialIndex: 1,
          length: myTab.length,
          child:Scaffold(
            appBar: AppBar(
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(225),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/bg.png",),fit: BoxFit.cover)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text("CHALlENGES",textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                            Stack(
                              children: [

                                Container(
                                  // margin: EdgeInsets.only(top: 50),
                                  padding: EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 90),
                                  margin: EdgeInsets.only(top: 90),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 0.50),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("Hai [ Nama User ]",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                      Text("Lakukanlah challanges tiap harinya untuk meningkatkan kemampuan bersosialmu",style: TextStyle(fontSize: 12,))
                                    ],
                                  ),
                                ),
                                Image.asset("assets/images/challenges.png",height: 160,),
                              ],
                            ),
                          ],
                        ),
                      ),
                      TabBar(

                          isScrollable: true,
                          unselectedLabelColor: Colors.black,
                          labelColor: Colors.white,
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                          indicator : BoxDecoration(
                              color: Colors.amber
                          ),
                          tabs: myTab
                      )
                    ],
                  ),
                ),
              ),
            ),


            body: TabBarView(children: [
              for(int i=0; i<myTab.length;i++)
                Center(child: ListView(
                  children: [
                    //id chalanges,title,isdone
                    ChallengesItem(1,"title challanges", false),
                    ChallengesItem(1,"title challanges", false),
                    ChallengesItem(1,"title challanges", true),
                    ChallengesItem(1,"title challanges", false),

                    ChallengesItem(1,"title challanges", true),
                    ChallengesItem(1,"title challanges", false),
                    ChallengesItem(1,"title challanges", true),
                    ChallengesItem(1,"title challanges", false),

                  ],
                ),
                ),
              ],
            ),
          ),
    ));
  }
}
