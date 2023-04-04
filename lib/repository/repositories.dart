import 'dart:convert';
import 'package:himani_logbinary/utils/app_constants.dart';
import 'package:http/http.dart';

import '../model/doctor_data_model.dart';

class OrderRepository {
  Future<List<Orders>> getOrders() async {
    Response response = await post(Uri.parse(AppConstants.baseUrl), body: {"restaurant_id":"1","status":"4","page":"1","search":"Sk"}); //static body because we dnt want pagination
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data']['orderInfo']['orders']; // directly took list from response as of now
      return result.map((e) => Orders.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}