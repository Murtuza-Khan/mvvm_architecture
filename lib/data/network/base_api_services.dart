import '../../resources/exports/index.dart';

abstract class BaseApiServices {
  Future getApi(String url, {Map<String, dynamic>? queryParameters});

  Future postApi(String url, Map<String, dynamic> body);
}
