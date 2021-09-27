import 'package:flutter/material.dart';
import 'package:sociable/Pages/Forum/model/forum.dart';
import 'package:sociable/Pages/Forum/repository/forumRepo.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/route.dart';

class AddNewForum extends StatefulWidget {
  const AddNewForum({Key key}) : super(key: key);

  @override
  _AddNewForumState createState() => _AddNewForumState();
}

class _AddNewForumState extends State<AddNewForum> {
  var obsuced = true, checkedValue = true;
  TextEditingController topikInput = new TextEditingController();
  TextEditingController forumInput = new TextEditingController();
  Forum forum = new Forum();
  ForumRepository repository = new ForumRepository();

  void saveForum() async {
    setState(() {
      Config.loading(context);
    });
    forum.topic = topikInput.text;
    forum.content = forumInput.text;
    forum.anonim = checkedValue.toString();

    bool respon = await repository.postForum(forum);
    if (respon) {
      Navigator.pop(context);
      Config.alert(1, 'Berhasil menambahka forum');
      Navigator.pushNamed(context, Routes.HOME);
    } else {
      Navigator.pop(context);
      Config.alert(0, 'Gagal menambahka forum');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Config.textBlack,
              )),
          title: Text(
            "ADD NEW FORUM",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        floatingActionButton: ElevatedButton(
            onPressed: () {
              if (topikInput.text.isEmpty) {
                return Config.alert(0, 'Topik tidak boleh kosong');
              } else if (forumInput.text.isEmpty) {
                return Config.alert(0, 'Konten Forum tidak boleh kosong');
              } else {
                saveForum();
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(132, 38),
            ),
            child: Text(
              "Unggah",
              style: TextStyle(fontSize: 20),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15, left: 15, bottom: 10),
                child: TextField(
                  // textAlign: TextAlign.center,
                  autofocus: true,
                  controller: topikInput,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(22), borderSide: BorderSide(color: Colors.grey, width: 0.5)),
                    hintText: "Topik Pembahasan",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15, left: 15, bottom: 10),
                child: TextField(
                  maxLines: 15,
                  // textAlign: TextAlign.center,
                  autofocus: true,
                  controller: forumInput,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.grey, width: 0.5)),
                    hintText: "Input Forum",
                  ),
                ),
              ),
              CheckboxListTile(
                title: Text("Is Anonim"),
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue = !checkedValue;
                    print(checkedValue);
                  });
                },
                controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
              )
            ],
          ),
        ));
  }
}
