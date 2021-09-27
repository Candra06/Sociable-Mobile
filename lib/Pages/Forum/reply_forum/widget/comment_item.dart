import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  final int idComment;
  CommentItem(this.idComment);
  // const CommentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String author = "Budi";
    String isiComment = "ini String komentar";
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Card(
            elevation: 0,
            margin: EdgeInsets.only(top:10,left: 10,right: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              padding: EdgeInsets.all(10),

              decoration: BoxDecoration(
                color: Color.fromRGBO(240, 240, 241, 100),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(author,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                  Text(isiComment),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
