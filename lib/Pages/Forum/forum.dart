import 'package:flutter/material.dart';
import 'package:sociable/Pages/Forum/model/forum.dart';
import 'package:sociable/Pages/Forum/repository/forumRepo.dart';
import 'package:sociable/Pages/Forum/searchLayout.dart';
import 'package:sociable/Pages/Forum/widget/forum_item.dart';
import 'package:sociable/helper/config.dart';
import 'add_new_forum/add_new_forum.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  Future<List<Forum>> forumItem;
  ForumRepository repository = ForumRepository();
  bool load = true;

  void getData() async {
    setState(() {
      load = true;
    });
    print(load);
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AddNewForumPage();
          }));
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return SearchLayout();
                    }));
                  },
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_list_rounded,
                    size: 30,
                  ),
                  color: Colors.black,
                ),
                IconButton(
                    onPressed: () {},
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
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext bc, int i) {
                            return ForumItem(snapshot.data[i].id, snapshot.data[i].content, Config.formatDateInput(snapshot.data[i].createdAt.toString()), snapshot.data[i].name.toString(),
                                snapshot.data[i].topic, snapshot.data[i].likes, snapshot.data[i].likes, true);
                          })
                      : Container(
                          child: Config.emptyData('Belum ada forum', context),
                        );
                }
              },
            ),
    );
  }
}
