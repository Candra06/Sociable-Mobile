import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociable/Pages/Forum/model/forum.dart';
import 'package:sociable/Pages/Forum/repository/forumRepo.dart';
import 'package:sociable/Pages/Forum/searchLayout.dart';
import 'package:sociable/Pages/Forum/widget/forum_item.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/pref.dart';
import 'package:sociable/helper/route.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  Future<List<Forum>> forumItem;
  ForumRepository repository = ForumRepository();
  bool load = true;
  String isMember = '';
  String searchString = "";

  void getData() async {
    var tmpMember = await Pref.getMember();
    setState(() {
      isMember = tmpMember;
      load = true;
    });
    print(isMember);
    forumItem = repository.listForum();
    setState(() {
      load = false;
    });
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //   return AddNewForum();
          // }));
          Navigator.pushNamed(context, Routes.ADD_FORUM);
        },
        child: Container(
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.blue,
          ),
          width: 150,
          height: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.white),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "FORUM",
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      if (isMember == 'true') {
                        Navigator.pushNamed(context, Routes.LIST_CHAT);
                      } else {
                        Navigator.pushNamed(context, Routes.MEMBERSHIP);
                      }
                    },
                    icon: Icon(
                      Icons.message,
                      color: Colors.black,
                      size: 30,
                    )),
              ],
            )
          ],
        ),
      ),
      body: load
          ? LinearProgressIndicator()
          : FutureBuilder<List<Forum>>(
              future: forumItem,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LinearProgressIndicator();
                } else {
                  return snapshot.hasData
                      ? SingleChildScrollView(
                          physics: ScrollPhysics(),
                          child: Container(
                            color: Config.textWhite,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                                  child: TextField(
                                    // textAlign: TextAlign.center,
                                    autofocus: true,
                                    // controller: topikInput,
                                    onChanged: (value) {
                                      setState(() {
                                        searchString = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(22), borderSide: BorderSide(color: Colors.grey, width: 0.5)),
                                      hintText: "Cari Topik",
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data.length,
                                    shrinkWrap: true,
                                    itemBuilder: (BuildContext bc, int i) {
                                      if (searchString != '') {
                                        return snapshot.data[i].topic.toString().toLowerCase().contains(searchString.toLowerCase())
                                            ? ForumItem(snapshot.data[i].id, snapshot.data[i].anonim, snapshot.data[i].content, Config.formatDateInput(snapshot.data[i].createdAt.toString()),
                                                snapshot.data[i].name.toString(), snapshot.data[i].topic, snapshot.data[i].likes, snapshot.data[i].replies, false)
                                            : Container();
                                      } else {
                                        return ForumItem(snapshot.data[i].id, snapshot.data[i].anonim, snapshot.data[i].content, Config.formatDateInput(snapshot.data[i].createdAt.toString()),
                                            snapshot.data[i].name.toString(), snapshot.data[i].topic, snapshot.data[i].likes, snapshot.data[i].replies, false);
                                      }
                                      // return snapshot.data[i].topic.toString().contains(searchString)
                                      //     ? ForumItem(snapshot.data[i].id, snapshot.data[i].anonim, snapshot.data[i].content, Config.formatDateInput(snapshot.data[i].createdAt.toString()),
                                      //         snapshot.data[i].name.toString(), snapshot.data[i].topic, snapshot.data[i].likes, snapshot.data[i].replies, false)
                                      //     : ForumItem(snapshot.data[i].id, snapshot.data[i].anonim, snapshot.data[i].content, Config.formatDateInput(snapshot.data[i].createdAt.toString()),
                                      //         snapshot.data[i].name.toString(), snapshot.data[i].topic, snapshot.data[i].likes, snapshot.data[i].replies, false);
                                    })
                              ],
                            ),
                          ),
                        )
                      : Container(
                          child: Config.emptyData('Belum ada forum', context),
                        );
                }
              },
            ),
    );
  }
}
