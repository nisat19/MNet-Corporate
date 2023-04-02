import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mnet_corporate/model/notice.dart';

class NoticeProvider with ChangeNotifier {
  List<Notice> notices = [];
  bool isLoading = false;
  bool isRequestError = false;

  Future<void> getNotices({bool isRefresh = false}) async {
    isLoading = true;
        if (isRefresh) notifyListeners();
    // notifyListeners();

    Uri uri = Uri.parse('https://dummyjson.com/quotes');
    try {
      final response = await http.get(uri);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      List quotes = extractedData['quotes'];
      notices = quotes
          .map((item) => Notice.fromJson(item))
          .toList()
         // .skip(1)
          .take(5)
          .toList();
    } catch (error) {
      isRequestError = true;
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
