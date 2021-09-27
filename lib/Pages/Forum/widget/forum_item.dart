import 'package:flutter/material.dart';
import 'package:sociable/Pages/Forum/reply_forum/replyForum.dart';

class ForumItem extends StatefulWidget {
  // const ForumItem({Key? key}) : super(key: key);
  final int idForum;
  final String isiForum;
  final String waktuPosting;
  final String penulis;
  final forumTopik;
  int jumlahLike;
  int jumlahKomentar;
  bool isLike;

  ForumItem(
    this.idForum,
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
  @override
  Widget build(BuildContext context) {
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
                  widget.penulis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Color.fromRGBO(230, 245, 245, 1)),
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
                        if (widget.isLike == false)
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (widget.isLike == false) {
                                    widget.jumlahLike += 1;
                                    widget.isLike = true;
                                  } else {
                                    widget.jumlahLike -= 1;
                                    widget.isLike = false;
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.thumb_up,
                                color: Colors.black,
                              ))
                        else
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (widget.isLike == false) {
                                    widget.jumlahLike += 1;
                                    widget.isLike = true;
                                  } else {
                                    widget.jumlahLike -= 1;
                                    widget.isLike = false;
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.thumb_up,
                                color: Colors.blue,
                              )),
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return ReplyForumPage(widget.idForum.toString());
                            }));
                          },
                          icon: Icon(
                            Icons.messenger,
                            color: Colors.black,
                          ),
                        ),
                        Text(widget.jumlahKomentar.toString(), style: TextStyle(color: Colors.black))
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
