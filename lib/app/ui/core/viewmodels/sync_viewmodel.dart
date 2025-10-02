import 'package:flutter/cupertino.dart';

class SyncViewModel<T> extends ChangeNotifier{
  bool _isLoading;
  String? _error;
  T _model;

  SyncViewModel({
    bool isLoading = false,
    String? error,
    required T model
  }) : _isLoading = isLoading,
       _error = error,
       _model = model;

  bool get isLoading => _isLoading;
  String? get error => _error;
  T get model => _model;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set error(String? value) {
    _error = value;
    notifyListeners();
  }

  set model(T value) {
    _model = value;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

}