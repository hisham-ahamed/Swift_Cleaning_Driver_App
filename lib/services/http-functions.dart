import 'package:driverapp/models/login-data.dart';
import 'package:driverapp/models/order/order.dart';

import 'http-service.dart';

class DriverFunctions {
  static Future<LoginResponse> getStaffDetails(
      String url, LoginRequest request) async {
    Map<String, dynamic> _body = {
      "phone_number": request.phoneNumber,
      "password": request.password
    };
    dynamic _responseBody = await HttpService.post(url, _body);
    LoginResponse _response = LoginResponse.fromJson(_responseBody);
    return _response;
  }

  static Future<List<OrderData>> getOrders(String url) async {
    dynamic _responseBody = await HttpService.get(url);
    List<OrderData> _orderData = _responseBody
        .map((dynamic responseJsonData) => OrderData.fromJson(responseJsonData))
        .toList();
    return _orderData;
  }
}
