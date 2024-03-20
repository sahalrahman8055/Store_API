import 'dart:convert';

import 'package:cloths_list/models/store_model.dart';
import 'package:http/http.dart' as http;

class StoreService {
  final String url = "https://fakestoreapi.com/products";

  Future<List<StoreModel>> getStore() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      // Map each item in the JSON array to a StoreModel object
      final List<StoreModel> storeList =
          data.map((item) => StoreModel.fromJson(item)).toList();
      return storeList;
    } else {
      throw Exception("Failed to load");
    }
  }
}
