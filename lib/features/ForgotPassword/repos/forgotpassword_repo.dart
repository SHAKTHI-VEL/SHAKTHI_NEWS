import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shakthi_news/features/ForgotPassword/models/ResponseModel.dart';

import 'package:http/http.dart' as http;


class ForgotpasswordRepo{
  static Future<Responsemodel> requestotp(String email)async{
    var url = dotenv.env['API_URL'];
    var client = http.Client();
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {'email': email};
    String jsonBody = json.encode(body);
    try {
       var response=await client.post(Uri.parse('$url/user/requestotp'),
          headers: headers, body: jsonBody);
      var decodeResponse=jsonDecode(response.body);
      return Responsemodel(success: decodeResponse['success'], message: decodeResponse['message']);
    } catch (e) {
      return Responsemodel(success: false, message: 'Server Error');
    }
  }

  static Future<Responsemodel> authOtp(String email,String otp)async{
    var url = dotenv.env['API_URL'];
    var client = http.Client();
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {'email': email,'otp':otp};
    String jsonBody = json.encode(body);
    try {
      var response=await client.post(Uri.parse('$url/user/authotp'),
          headers: headers, body: jsonBody);
      var decodeResponse=jsonDecode(response.body);
      return Responsemodel(success: decodeResponse['success'], message: decodeResponse['message']);
    } catch (e) {
      return Responsemodel(success: false, message: 'Server Error');
    }
  }

  static Future<Responsemodel> newpassword(String email,String password,String otp)async{
    log(otp);
    var url = dotenv.env['API_URL'];
    var client = http.Client();
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {'email': email,'password':password,'otp':otp};
    String jsonBody = json.encode(body);
    try {
      var response=await client.put(Uri.parse('$url/user/reset'),
          headers: headers, body: jsonBody);
      var decodeResponse=jsonDecode(response.body);
      return Responsemodel(success: decodeResponse['success'], message: decodeResponse['message']);
    } catch (e) {
      return Responsemodel(success: false, message: 'Server Error');
    }
  }
}