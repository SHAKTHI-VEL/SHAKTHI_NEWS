import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shakthi_news/features/Home/models/responsemodel.dart';
import 'package:http/http.dart' as http;

class HomeRepo{
  static Future<ResponseModel> getNewspaper()async{
    var url = dotenv.env['API_URL'];
    var client = http.Client();
    final headers = {'Content-Type': 'application/json'};
    try {
      var response = await client.get(Uri.parse('$url/newspaper'),headers: headers);
      var decodeResponse=jsonDecode(response.body);
      return ResponseModel(success: decodeResponse['success'], message: decodeResponse['message'], data: decodeResponse['data']);
    } catch (e) {
      log(e.toString());
      return ResponseModel(success: false, message: 'Server Error', data: []);
    }
  }
}