import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  static Future<dynamic> get(String url, [String? token]) async {
    Uri uri = Uri.parse(url);
    final http.Response res = await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json',
      'token': (token != null) ? token : ''
    });
    return jsonDecode(res.body);
  }

  static Future<dynamic> post(String url, Map<String, dynamic> data,
      [String? token]) async {
    String body = json.encode(data);
    Uri uri = Uri.parse(url);
    final http.Response res = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'token': (token != null) ? token : ''
        },
        body: body);
    return jsonDecode(res.body);
  }

  static Future<dynamic> patch(String url, Map<String, dynamic> data,
      [String? token]) async {
    String body = json.encode(data);
    Uri uri = Uri.parse(url);
    final http.Response res = await http.patch(uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'token': (token != null) ? token : ''
        },
        body: body);
    return jsonDecode(res.body);
  }

  static Future<Map<String, dynamic>> put(String url, Map<String, dynamic> data,
      [String? token]) async {
    String body = json.encode(data);
    Uri uri = Uri.parse(url);
    final http.Response res = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'token': (token != null) ? token : '',
        },
        body: body);
    return jsonDecode(res.body);
  }
}
