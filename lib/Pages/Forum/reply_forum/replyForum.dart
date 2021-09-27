import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociable/Pages/Forum/model/detailForum.dart';
import 'package:sociable/Pages/Forum/reply_forum/widget/comment_item.dart';
import 'package:sociable/Pages/Forum/repository/forumRepo.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/route.dart';

class ReplyForumPage extends StatefulWidget {
  final String idForum;
  ReplyForumPage(this.idForum);

  @override
  _ReplyForumPageState createState() => _ReplyForumPageState();
}

class _ReplyForumPageState extends State<ReplyForumPage> {
  final String value =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error doloribus ullam rem maxime, voluptates placeat ipsum aperiam. Veritatis labore maxime, minima, consequatur tempora animi nobis praesentium temporibus a tenetur sapiente sunt cum? Tempora, voluptatem veritatis voluptatibus officiis eos consectetur soluta culpa, consequuntur quos nobis ut quas. Deleniti a dolor inventore pariatur, nemo corrupti quo molestias quam iure fuga porro odit at laborum officiis praesentium, necessitatibus, corporis labore asperiores sapiente? Nam distinctio ab ex impedit, aperiam vero voluptate in, vel modi molestias magni incidunt consectetur delectus porro, et pariatur doloribus recusandae! Saepe vel perspiciatis voluptatem. Id dicta optio ex quis ullam corrupti? Repellat magni atque possimus itaque assumenda consequatur excepturi voluptates nemo ea totam laudantium iste distinctio, voluptas incidunt, rerum illo?";
  int jumlahLike = 12;
  String waktuPost = "10 menit yang lalu";
  bool load = true;
  ForumRepository repository = ForumRepository();
  Future<DetailForum> detailForum;

  void getData() async {
    setState(() {
      load = true;
    });
    print(load);
    detailForum = repository.detailForum(widget.idForum);
    // if (detailForum.status == true) {
    setState(() {
      // detailForum = data;
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.HOME);
              },
              icon: Icon(Icons.arrow_back, color: Config.textBlack)),
          title: Text(
            "FORUM",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        body: FutureBuilder<DetailForum>(
          future: detailForum,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LinearProgressIndicator();
            } else {
              return snapshot.hasData
                  ? ListView(
                      padding: EdgeInsets.all(10),
                      children: [
                        Card(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      snapshot.data.data.anonim == 'true' ? 'Anonim' : snapshot.data.data.createdBy.toString(),
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 8),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(color: Color.fromRGBO(230, 245, 245, 1)),
                                      child: Text(
                                        snapshot.data.data.topic,
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(snapshot.data.data.content),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(primary: Colors.white),
                                            onPressed: () {
                                              setState(() {
                                                jumlahLike += 1;
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.thumb_up,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  snapshot.data.data.likes.toString(),
                                                  style: TextStyle(color: Colors.black),
                                                )
                                              ],
                                            )),
                                        SizedBox(width: 5),
                                      ],
                                    ),
                                    Text(waktuPost)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),

                        for (int i = 0; i < snapshot.data.reply.length; i++) CommentItem(20) // id item)
                      ],
                    )
                  : Container(
                      child: Config.emptyData('Gagal memuat data', context),
                    );
            }
          },
        ));
  }
}
