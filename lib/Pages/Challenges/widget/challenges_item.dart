import 'package:flutter/material.dart';

import 'package:html/parser.dart' show parse;
import 'package:sociable/helper/route.dart';

class ChallengesItem extends StatefulWidget {
  final String idChallenges;
  final String titleChallenges;
  final bool isDone;
  const ChallengesItem({Key key, this.idChallenges, this.titleChallenges, this.isDone}) : super(key: key);

  @override
  _ChallengesItemState createState() => _ChallengesItemState();
}

class _ChallengesItemState extends State<ChallengesItem> {
  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.white, onPrimary: Colors.grey),
        onPressed: () {
          Navigator.pushNamed(context, Routes.DETAIL_CHALLENGE, arguments: widget.idChallenges);
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //   return DetailChallanges(idChallenges: widget.idChallenges, titleChallenges:widget.titleChallenges, isDone:widget.isDone);
          // }));
        },
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    color: Colors.white,
                    child: Text(
                      _parseHtmlString(widget.titleChallenges),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                if (widget.isDone == true)
                  Icon(
                    Icons.check_circle,
                    size: 50,
                    color: Colors.green,
                  )
                else
                  Icon(
                    Icons.circle_outlined,
                    size: 50,
                    color: Colors.green,
                  )
              ],
            ),
          ),
        ));
  }
}
