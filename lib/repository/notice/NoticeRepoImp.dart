import 'package:mnet_corporate/data/remote/network/ApiEndPoints.dart';
import 'package:mnet_corporate/data/remote/network/BaseApiService.dart';
import 'package:mnet_corporate/data/remote/network/NetworkApiService.dart';
import 'package:mnet_corporate/model/notice.dart';
import 'package:mnet_corporate/repository/notice/NoticeRepo.dart';

class NoticeRepoImp implements NoticeRepo {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<NoticesMain?> getNoticeList() async {
    try {
      dynamic response =
          await _apiService.getResponse(ApiEndPoints().getNotices);
      final jsonData = NoticesMain.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }
}
