import 'package:flutter/material.dart';
import 'package:mnet_corporate/views/tabs/apps.dart';
import 'package:mnet_corporate/views/tabs/directory.dart';
import 'package:mnet_corporate/views/tabs/home.dart';
import 'package:mnet_corporate/views/tabs/profile.dart';
import 'package:mnet_corporate/views/tabs/search.dart';

class AppConstant {
  static final pages = [
    const Home(),
    const Directory(),
    const Search(),
    const Apps(),
    const Profile(),
  ];
}
