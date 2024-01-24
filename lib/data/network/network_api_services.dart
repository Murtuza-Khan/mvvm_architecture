import '../../resources/exports/index.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  Map<String, String> generateHeaders() {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'AppToken': FlutterConfig.get('appToken'),
      if (AuthManager.instance.session.value?.tokenId == null) ...{
        'UserID': "",
        'Authorization': 'Bearer ',
      } else ...{
        'UserID': AuthManager.instance.session.value!.user!.userID.toString(),
        'Authorization':
            'Bearer ${AuthManager.instance.session.value!.tokenId!}',
      },
    };
    return headers;
  }

  @override
  Future postApi(String url, Map<String, dynamic> body) async {
    try {
      http.Response response = await http
          .post(
            Uri.https(FlutterConfig.get('baseUrl'), url),
            headers: generateHeaders(),
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 10));

      ApiResponse data = ApiResponse.fromJson(validateResponse(response));

      return data.successContents;
    } on SocketException {
      return CustomSnackBar.offline;
    } catch (e) {
      return false;
    }
  }

  @override
  Future getApi(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Uri uri;
      ApiResponse data;

      if (queryParameters != null) {
        uri = Uri.https(
          FlutterConfig.get('baseUrl'),
          url,
          queryParameters.map((key, value) => MapEntry(key, value.toString())),
        );
      } else {
        uri = Uri.https(FlutterConfig.get('baseUrl'), url);
      }

      http.Response response =
          await http.get(uri, headers: generateHeaders()).timeout(
                const Duration(seconds: 10),
              );

      data = ApiResponse.fromJson(validateResponse(response));

      return data.successContents;
    } on SocketException {
      return CustomSnackBar.offline;
    } catch (e) {
      return false;
    }
  }

  dynamic validateResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        CustomSnackBar.errorSnackBar(message: InvalidUrlException().message);
        throw InvalidUrlException();
      case 403:
        CustomSnackBar.errorSnackBar(message: RestrictedAccess().message);
        throw RestrictedAccess();
      case 401:
        CustomSnackBar.errorSnackBar(message: UnauthorizedException().message);
        throw UnauthorizedException();
      case 305:
        CustomSnackBar.errorSnackBar(message: InvalidTokenException().message);
        throw InvalidTokenException();
      case 408:
        CustomSnackBar.errorSnackBar(message: RequestTimeout().message);
        throw RequestTimeout();
      case 500:
        CustomSnackBar.errorSnackBar(message: ServerException().message);
        throw ServerException();
      default:
        dynamic responseJson = jsonDecode(response.body);
        CustomSnackBar.errorSnackBar(message: responseJson['failreason']);
        throw UnknownError();
    }
  }
}
