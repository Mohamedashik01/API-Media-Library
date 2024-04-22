import 'package:flutter/material.dart';
import 'package:gapopo_media/constants/app_constants.dart';
import 'package:gapopo_media/model/image_details.dart';


class BaseListProvider<T> extends ChangeNotifier {
  StateType _stateType = StateType.loading;
  bool _hasMore = true;
  String _message = '';
  bool _enableEdit = false;
  StateType get stateType => _stateType;
  bool get hasMore => _hasMore;
  String get message => _message;
  bool get enableEdit => _enableEdit;
  final List<T> _list = [];
  List<T> get list => _list;
  bool _disposed = false;

  void setStateType(StateType stateType) {
    _stateType = stateType;
    if (_disposed) return;
    notifyListeners();
  }

  String? _translatedText;
  String? get translatedText => _translatedText;

  void setTranslatedText(String data) {
    _translatedText = data;
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  void setHasMore(bool hasMore) {
    _hasMore = hasMore;
    notifyListeners();
  }

  void setEnableEdit(bool edit) {
    _enableEdit = edit;
    notifyListeners();
  }

  void setMessage(String msg) {
    _message = msg;
    notifyListeners();
  }

  void add(T data) {
    _list.add(data);
    notifyListeners();
  }

  void addAll(List<T> data) {
    _list.addAll(data);
    notifyListeners();
  }

  void insert(int i, T data) {
    _list.insert(i, data);
    notifyListeners();
  }

  void insertAll(int i, List<T> data) {
    _list.insertAll(i, data);
    notifyListeners();
  }

  void remove(T data) {
    _list.remove(data);
    notifyListeners();
  }

  void removeAt(int i) {
    _list.removeAt(i);
    notifyListeners();
  }

  void clear() {
    _list.clear();
    notifyListeners();
  }

  List<ImageDetails> _imageList = [];
  List<ImageDetails> get imageList => _imageList;

  void setImageDetails(List<ImageDetails> data) {
    _imageList = data;
    notifyListeners();
  }

}

