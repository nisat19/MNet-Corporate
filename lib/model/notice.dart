import 'package:flutter/material.dart';

class Notice with ChangeNotifier {
  final String title;
  final String subTitle;

  Notice({required this.title, required this.subTitle});

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(title: json['quote'], subTitle: json['author']);
  }
}
