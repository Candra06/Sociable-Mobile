import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociable/Pages/Forum/model/comment_model.dart';
import 'package:sociable/Pages/Forum/reply_forum/widget/commentItem.dart';

import 'package:sociable/Pages/Forum/repository/forumRepo.dart';
import 'package:sociable/Pages/Forum/repository/item_repository.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/pref.dart';
import 'package:sociable/helper/route.dart';

class ReplyForumPage extends StatefulWidget {
  final String idForum;
  final String conten;
  final String waktu;
  int jumlahLike;
  final String author;
  final String anonim;
  ReplyForumPage(
      {this.idForum,
      this.conten,
      this.waktu,
      this.jumlahLike,
      this.author,
      this.anonim});

  @override
  _ReplyForumPageState createState() => _ReplyForumPageState();
}

class _ReplyForumPageState extends State<ReplyForumPage> {
  bool load = true;
  int jumlahLike;
  bool isLike;
  Color likeColor = Colors.black;
  ItemRepository itemRepository = ItemRepository();
  ForumRepository commentRepository = ForumRepository();
  Future<List<CommentModel>> commentModel;
  TextEditingController replyController = new TextEditingController();
  CommentModel comment = new CommentModel();
  void getData() async {
    setState(() {
      load = true;
    });
    commentModel = commentRepository.listComment(widget.idForum);
    setState(() {
      // detailForum = data;
      load = false;
    });
  }

  void saveForum() async {
    setState(() {
      Config.loading(context);
    });
    comment.conten = replyController.text;

    bool respon = await commentRepository
        .komen(widget.idForum, {'content': replyController.text});
    if (respon) {
      replyController.text = '';
      Navigator.pop(context);
      Config.alert(1, 'Berhasil menambahka forum');
      setState(() {
        getData();
      });
      // Navigator.pushNamed(context, Routes.HOME);
    } else {
      Navigator.pop(context);
      Config.alert(0, 'Gagal menambahka forum');
    }
  }

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

  actionLike() {
    setState(() {
      if (isLike == true) {
        widget.jumlahLike -= 1;
        setisLike(false);
        likeColor = Colors.black;
        itemRepository.unlike(widget.idForum, widget.jumlahLike);
      } else {
        widget.jumlahLike += 1;
        setisLike(true);
        likeColor = Colors.blue;
        itemRepository.like(widget.idForum);
      }
    });
  }

  @override
  void initState() {
    getData();
    getisLike();
    changeColor();

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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 35,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 17,
              horizontal: 22,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
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
                Text(
                  widget.anonim == 'true' ? 'Anonim' : widget.author,
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.conten,
                  style: GoogleFonts.poppins(),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              actionLike();
                            },
                            icon: Icon(
                              Icons.thumb_up,
                              color: likeColor,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.jumlahLike.toString(),
                          ),
                        ],
                      ),
                    ),
                    Text(widget.waktu),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: load
                ? CircularProgressIndicator()
                : FutureBuilder<List<CommentModel>>(
                    future: commentModel,
                    builder: (builder, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return snapshot.hasData
                            ? ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext bc, int i) {
                                  print(snapshot.data[i].name);
                                  return CommentItem(
                                    name: snapshot.data[i].name,
                                    content: snapshot.data[i].conten,
                                  );
                                },
                              )
                            : Container(
                                child: Config.emptyData(
                                    'Belum ada forum', context),
                              );
                      }
                    },
                  ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    // height: 45,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 17,
                    ),
                    decoration: BoxDecoration(
                      // color: bgColor4,
                      color: Color(0xffF0F0F1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: replyController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type Message...',
                          // hintStyle: subTitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    // color: primaryColor,++
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () {
                      saveForum();
                    },
                    icon: Image.asset(
                      'assets/images/send.png',
                      width: 21,
                      height: 19,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container boxComment(AsyncSnapshot<List<CommentModel>> snapshot, int i) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Budi",
            style: GoogleFonts.poppins().copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            snapshot.data[i].conten,
            style: GoogleFonts.poppins(),
          )
        ],
      ),
    );
  }

  Container cardComment() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 20,
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xffF0F0F1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'sdsd',
            style: GoogleFonts.poppins().copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('sdsd'),
        ],
      ),
    );
  }
}
