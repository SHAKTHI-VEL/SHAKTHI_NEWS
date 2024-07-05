import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shakthi_news/features/Signup/models/responseModel.dart';
import 'package:http/http.dart' as http;

class SignupRepo {
  static Future<Responsemodel> signup(String email, String password) async {
    var url = dotenv.env['API_URL'];
    var client = http.Client();
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {'email': email, 'password': password};
    String jsonBody = json.encode(body);
    try {
      var response = await client.post(Uri.parse('$url/user/signup'),
          headers: headers, body: jsonBody);
      var decodeResponse = jsonDecode(response.body);
      return Responsemodel(
          success: decodeResponse['success'],
          message: decodeResponse['message'],
          token: decodeResponse['token']);
    } catch (e) {
      return Responsemodel(success: false, message: 'Server error', token: '');
    }
  }
}
