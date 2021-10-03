import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentItem extends StatefulWidget {
  final String name;
  final String content;
  CommentItem({this.name, this.content});

  @override
  _CommentItemState createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name.toString(),
            style: GoogleFonts.poppins().copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.content,
            style: GoogleFonts.poppins(),
          )
        ],
      ),
    );
  }
}
