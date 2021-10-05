import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sociable/Pages/konten/detail_konten.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/pref.dart';
import 'package:sociable/helper/route.dart';
// import 'package:sociable/Pages/Membership/membership.dart';
// import 'package:sociable/Pages/konten/detail_kontent.dart';

class VideoContentItem extends StatefulWidget {
  String idVideo;
  String thumbnailVideo;
  String judulVideo;
  String description;
  bool typeVideo;

  VideoContentItem({
    this.idVideo,
    this.thumbnailVideo,
    this.judulVideo,
    this.description,
    this.typeVideo: true,
  });

  @override
  _VideoContentItemState createState() => _VideoContentItemState();
}

class _VideoContentItemState extends State<VideoContentItem> {
  String isPremium = '';
  void getInfo() async {
    var tmpMember = await Pref.getMember();
    setState(() {
      print(tmpMember);
      isPremium = tmpMember;
    });
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.typeVideo == true) {
          if (isPremium == 'false') {
            Config.alert(0, 'Anda belum upgrade Premium');
            Navigator.pushNamed(context, Routes.MEMBERSHIP);
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return DetailKonten(
                  idYoutube: widget.idVideo,
                  title: widget.judulVideo,
                  description: widget.description,
                );
              }),
            );
          }
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return DetailKonten(
                idYoutube: widget.idVideo,
                title: widget.judulVideo,
                description: widget.description,
              );
            }),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 7,
          horizontal: 35,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 13,
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
        child: Row(
          children: [
            Container(
              width: 92,
              height: 67,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(widget.thumbnailVideo),
                  fit: BoxFit.cover,
                ),
                color: Colors.amber,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                ),
                child: Icon(
                  widget.typeVideo ? Icons.lock : Icons.play_circle,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: widget.typeVideo ? Color(0xffFFC803) : Color(0xffF0F0F1),
                    ),
                    child: Text(
                      widget.typeVideo ? "Premium" : 'Basic',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Text(
                    widget.judulVideo,
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
