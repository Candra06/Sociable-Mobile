import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociable/Pages/Forum/model/comment_model.dart';
import 'package:sociable/Pages/Forum/reply_forum/replyForum.dart';
import 'package:sociable/Pages/Forum/repository/forumRepo.dart';
import 'package:sociable/Pages/Forum/repository/item_repository.dart';
import 'package:sociable/helper/pref.dart';

class ForumItem extends StatefulWidget {
  // const ForumItem({Key? key}) : super(key: key);
  final int idForum;
  final String isiForum;
  final String waktuPosting;
  final String penulis;
  final String isAnonim;
  final forumTopik;
  int jumlahLike;
  int jumlahKomentar;
  bool isLike;
  ForumItem(
    this.idForum,
    this.isAnonim,
    this.isiForum,
    this.waktuPosting,
    this.penulis,
    this.forumTopik,
    this.jumlahLike,
    this.jumlahKomentar,
    this.isLike,
  );

  @override
  _ForumItemState createState() => _ForumItemState();
}

class _ForumItemState extends State<ForumItem> {
  ItemRepository itemRepository = ItemRepository();

  Future<List<CommentModel>> commentList;
  String like;
  Color likeColor = Colors.black;
  bool isLike;
  getisLike() async {
    isLike = await Pref.like(widget.idForum.toString());
  }

  setisLike(value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(widget.idForum.toString(), value);
    setState(() {
      isLike = value;
    });
  }

  changeColor() async {
    isLike = await Pref.like(widget.idForum.toString());
    setState(() {
      if (isLike == true) {
        likeColor = Colors.blue;
      } else {
        likeColor = Colors.black;
      }
    });
  }

  @override
  void initState() {
    getisLike();
    changeColor();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(like);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 30,
              offset: Offset(0, 6), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.isAnonim == 'true' ? 'Anonim' : widget.penulis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  padding: EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(230, 245, 245, 1)),
                  child: Text(
                    widget.forumTopik,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(widget.isiForum),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (isLike == null || isLike == false) {
                                print(isLike);
                                print(itemRepository.like(widget.idForum));
                                widget.jumlahLike += 1;
                                widget.isLike = true;
                                setisLike(true);
                                likeColor = Colors.blue;
                                // setLike('true');
                              } else {
                                print(isLike);

                                print(itemRepository.unlike(
                                    widget.idForum, widget.jumlahLike));
                                widget.jumlahLike -= 1;
                                widget.isLike = false;
                                setisLike(false);
                                likeColor = Colors.black;
                                // setLike('false');
                              }
                            });
                          },
                          icon: Icon(
                            Icons.thumb_up,
                            color: likeColor,
                          ),
                        ),
                        Text(
                          widget.jumlahLike.toString(),
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(width: 10),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ReplyForumPage(
                                idForum: widget.idForum.toString(),
                                conten: widget.isiForum,
                                waktu: widget.waktuPosting,
                                jumlahLike: widget.jumlahLike,
                                author: widget.penulis,
                                anonim: widget.isAnonim,
                              );
                            }));
                          },
                          icon: Icon(
                            Icons.messenger,
                            color: Colors.black,
                          ),
                        ),
                        Text(widget.jumlahKomentar.toString(),
                            style: TextStyle(color: Colors.black))
                      ],
                    ),
                  ],
                ),
                Text(widget.waktuPosting)
              ],
            )
          ],
        ),
      ),
    );
  }
}
