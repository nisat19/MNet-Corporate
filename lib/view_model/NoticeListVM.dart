import 'package:flutter/material.dart';
import 'package:mnet_corporate/data/remote/response/ApiResponse.dart';
import 'package:mnet_corporate/model/notice.dart';
import 'package:mnet_corporate/repository/notice/NoticeRepoImp.dart';

class NoticeListVM extends ChangeNotifier {
  final _noticeRepo = NoticeRepoImp();

  ApiResponse<NoticesMain> notices = ApiResponse.loading();

  void _setNoticeMain(ApiResponse<NoticesMain> response) {
    notices = response;
    notifyListeners();
  }

  Future<void> fetchNotices() async {
    _setNoticeMain(ApiResponse.loading());
    _noticeRepo
        .getNoticeList()
        .then((value) => _setNoticeMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setNoticeMain(ApiResponse.error(error.toString())));
  }
}
