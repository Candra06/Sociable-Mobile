import 'package:flutter/material.dart';

class Forum_Item_Model{
  final int idForum;
  final String isiForum;
  final String waktuPosting;
  final String penulis;
  final forumTopik;
  int jumlahLike;
  int jumlahKomentar;
  bool isLike;
  Color iconColor;

  Forum_Item_Model(
    this.idForum,
    this.isiForum,
    this.waktuPosting,
    this.penulis,
    this.forumTopik,
    this.jumlahLike,
    this.jumlahKomentar,
    this.isLike,
    this.iconColor,
  );

  get_icon_color(isLike){
    if(isLike == false){
      return Colors.black;
    }
    else{
      return Colors.red;
    }
  }
}