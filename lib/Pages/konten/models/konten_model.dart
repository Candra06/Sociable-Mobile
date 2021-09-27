import 'package:flutter/material.dart';

class KontenModel {
  int id;
  String url;
  String title;
  int publisher;
  String description;
  String status;
  String thumbnail;
  dynamic createat;
  dynamic updateat;

  KontenModel({
    this.id,
    this.url,
    this.title,
    this.publisher,
    this.description,
    this.status,
    this.thumbnail,
    this.createat,
    this.updateat,
  });

  factory KontenModel.fromJson(Map<String, dynamic> json) => KontenModel(
        id: json['id'],
        url: json['url'],
        title: json['title'],
        publisher: json['publisher'],
        description: json['description'],
        status: json['status'],
        thumbnail: json['thumbnail'],
        createat:
            json['createat'] == null ? null : DateTime.parse(json['createat']),
        updateat:
            json['updateat'] == null ? null : DateTime.parse(json['updateat']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'title': title,
        'publisher': publisher,
        'description': description,
        'status': status,
        'thumbnail': thumbnail,
        'createat': createat.toString(),
        'updateat': updateat.toString(),
      };
}
