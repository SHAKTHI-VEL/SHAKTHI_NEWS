import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shakthi_news/features/Subscription/models/responseModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class SubscriptionRepo{
  static Future<ResponseModel> getSubscription()async{
    var url = dotenv.env['API_URL'];
    var client = http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token=prefs.getString('token');
    final headers = {'Content-Type': 'application/json','auth-token':token!};
    try {
      var response = await client.get(Uri.parse('$url/subscription'),headers: headers);
      var decodeResponse=jsonDecode(response.body);
      return ResponseModel(success: decodeResponse['success'], message: decodeResponse['message'], data: decodeResponse['result']);
    } catch (e) {
      return ResponseModel(success: false, message: 'Server Error', data: []);
    }
  }
}