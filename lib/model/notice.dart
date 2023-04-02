import 'dart:convert';

import 'package:flutter/material.dart';

NoticesMain NoticesMainFromJson(String str) =>
    NoticesMain.fromJson(json.decode(str));

String NoticesMainToJson(NoticesMain data) => json.encode(data.toJson());

class NoticesMain {
  NoticesMain({
    this.notices,
  });

  List<Notice>? notices;

  factory NoticesMain.fromJson(Map<String, dynamic> json) => NoticesMain(
        notices: json["quotes"] == null
            ? null
            : List<Notice>.from(json["quotes"].map((x) => Notice.fromJson(x))).take(10).toList(),
      );

  Map<String, dynamic> toJson() => {
        "quotes": notices == null
            ? null
            : List<dynamic>.from(notices!.map((x) => x.toJson())),
      };
}

class Notice {
  final String title;
  final String subTitle;

  Notice({required this.title, required this.subTitle});

  factory Notice.fromJson(Map<String, dynamic> json) =>
      Notice(title: json['quote'], subTitle: json['author']);

  Map<String, dynamic> toJson() => {'title': title, 'subTitle': subTitle};
}
