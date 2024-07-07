import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shakthi_news/features/PaperShowcase/models/responseModel.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class PapershowcaseRepo{
  static Future<ResponseModel> addToCart(String id)async{
    var url = dotenv.env['API_URL'];
    var client = http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token=prefs.getString('token');
    final headers = {'Content-Type': 'application/json','auth-token':token!};
    Map<String, dynamic> body = {'paperId':id};
    String jsonBody = json.encode(body);
    try {
      var response = await client.post(Uri.parse('$url/cart'),
          headers: headers, body: jsonBody);
      var decodeResponse = jsonDecode(response.body);
      return ResponseModel(
          success: decodeResponse['success'],
          message: decodeResponse['message']
      );
    } catch (e) {
      return ResponseModel(success: false, message: 'Server error');
    }
  }
}