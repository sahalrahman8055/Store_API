import 'package:cloths_list/models/store_model.dart';
import 'package:cloths_list/services/store_service.dart';
import 'package:flutter/material.dart';

class StoreProvider extends ChangeNotifier {
  final StoreService _service = StoreService();
  List<StoreModel> _storeList = [];

  bool _isLoading = false;
  String _error = "";

  List<StoreModel> get storeList => _storeList;
  bool get isloading => _isLoading;
  String get error => _error;

  StoreProvider() {
    fetchStore();
  }

  Future<void> fetchStore() async {
    try {
      _isLoading = true;
      _error = '';
      notifyListeners();

      final List<StoreModel> storeData = await _service.getStore();
      // print(storeData);
      _storeList = storeData;
    } catch (e) {
      _error = "Failed to Load Data $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
