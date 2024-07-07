import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shakthi_news/features/Cart/model/SubscriptionRouteModel.dart';
import 'package:shakthi_news/features/Cart/model/cartDeleteModel.dart';
import 'package:shakthi_news/features/Cart/model/dataModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo{
  static Future<ResponseModel> getCart()async{
    var url = dotenv.env['API_URL'];
    var client = http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token=prefs.getString('token');
    final headers = {'Content-Type': 'application/json','auth-token':token!};
    try {
      var response = await client.get(Uri.parse('$url/cart'),headers: headers);
      var decodeResponse=jsonDecode(response.body);
      return ResponseModel(success: decodeResponse['success'], message: decodeResponse['message'], data: decodeResponse['data']);
    } catch (e) {
      return ResponseModel(success: false, message: 'Server Error', data: []);
    }
  }

  static Future<Cartdeletemodel> deleteCart(String id)async{
    var url = dotenv.env['API_URL'];
    var client = http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token=prefs.getString('token');
    final headers = {'Content-Type': 'application/json','auth-token':token!};
    Map<String, dynamic> body = {'cartId':id};
    String jsonBody = json.encode(body);
    try {
      var response = await client.delete(Uri.parse('$url/cart'),headers: headers,body: jsonBody);
      var decodeResponse=jsonDecode(response.body);
      return Cartdeletemodel(success: decodeResponse['success'], message: decodeResponse['message']);
    } catch (e) {
      log(e.toString());
      return Cartdeletemodel(success: false, message: 'Server Error');
    }
  }

  static Future<SubscriptionRouteModel> addToSubscription()async{
    var url = dotenv.env['API_URL'];
    var client = http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token=prefs.getString('token');
    final headers = {'Content-Type': 'application/json','auth-token':token!};
    try {
      var response = await client.post(Uri.parse('$url/subscription'),headers: headers);
      var decodeResponse=jsonDecode(response.body);
      log(decodeResponse.toString());
      return SubscriptionRouteModel(success: decodeResponse['success'], message: decodeResponse['message']);
    } catch (e) {
      return SubscriptionRouteModel(success: false, message: 'Server Error');
    }
  }
}