import 'dart:convert';
import 'package:mwb_project/core/enums/request_type.dart';
import 'package:http/http.dart' as http;

class NetworkUtil {
  static String baseUrl = 'mwswmbhwf23.somee.com';
  static var client = http.Client();
  static bool online = true;
  // static Future<dynamic> sendRequest({
  //   required RequestType requestType,
  //   required String url,
  //   Map<String, String>? headers,
  //   Map<String, dynamic>? body,
  //   Map<String, dynamic>? params,
  // }) async {
  //   try {
  //     if (!online) {
  //       CustomToast.showMessage(
  //           message: tr("key_bot_toast_offline"),
  //           messageType: MessageType.WARNING);
  //       BotToast.closeAllLoading();
  //       return;
  //     }
  //     //!--- Required for request -----
  //     //*--- Make full api url -----
  //     var uri = Uri.https(baseUrl, url, params);

  //     //?--- To Save api response -----
  //     late http.Response response;

  //     //!--- Required convert api response to Map -----
  //     Map<String, dynamic> jsonResponse = {};

  //     //*--- Make call correct request type -----

  //     switch (requestType) {
  //       case RequestType.GET:
  //         response = await client.get(
  //           uri,
  //           headers: headers,
  //         );
  //         break;
  //       case RequestType.POST:
  //         response = await client.post(
  //           uri,
  //           headers: headers,
  //           body: jsonEncode(body),
  //         );
  //         break;
  //       case RequestType.PUT:
  //         response = await client.put(
  //           uri,
  //           headers: headers,
  //           body: jsonEncode(body),
  //         );
  //         break;
  //       case RequestType.DELETE:
  //         response = await client.delete(
  //           uri,
  //           headers: headers,
  //           body: jsonEncode(body),
  //         );
  //         break;
  //     }

  //     dynamic result;
  //     try {
  //       result = jsonDecode(Utf8Codec().decode(response.bodyBytes));
  //     } catch (e) {}

  //     jsonResponse.putIfAbsent('statusCode', () => response.statusCode);
  //     jsonResponse.putIfAbsent(
  //       'response',
  //       () => result ?? {'title': Utf8Codec().decode(response.bodyBytes)},
  //     );

  //     return jsonResponse;
  //   } catch (e) {
  //     print(e);
  //     CustomToast.showMessage(
  //       message: e.toString(),
  //       messageType: MessageType.WARNING,
  //     );
  //   }
  // }
  static Future<dynamic> sendRequest({
    required RequestType type,
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  }) async {
    try {

      //!--- Required for request ----
      //*--- Make full api url ------

      var uri = Uri.http(baseUrl, url,params);

      //To save api response
      late http.Response response;
      Map<String, dynamic> jsonResponse = {};
      switch (type) {
        case RequestType.GET:
          response = await client.get(uri, headers: headers);
          break;
        case RequestType.POST:
          response =
              await client.post(uri, body: jsonEncode(body), headers: headers);
          break;
        case RequestType.PUT:
          response =
              await client.put(uri, body: jsonEncode(body), headers: headers);
          break;
        case RequestType.DELETE:
          response = await client.delete(uri,
              body: jsonEncode(body), headers: headers);
          break;
      }
      dynamic result;
      try {
        result = jsonDecode(const Utf8Codec().decode(response.bodyBytes));
      } catch (e) {}
      jsonResponse.putIfAbsent(
          'response',
          () =>
              result ??
              {'title': const Utf8Codec().decode(response.bodyBytes)});
      jsonResponse.putIfAbsent('statusCode', () => response.statusCode);
      return jsonResponse;
    } catch (e) {
      print(e);
    }
  }


}


