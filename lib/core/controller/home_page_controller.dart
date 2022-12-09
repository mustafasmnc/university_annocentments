import 'package:flutter/material.dart';

class HomePageNotifier extends ChangeNotifier {
  int? _newsImageIndex;
  int? _eventsImageIndex;

  int? get newsImageIndex => _newsImageIndex;
  int? get eventsImageIndex => _eventsImageIndex;

  // getNewsImageIndex() {
  //   return _newsImageIndex;
  // }

  void setNewsImageIndex(int index) {
    _newsImageIndex = index;
    notifyListeners();
  }

  void setEventsImageIndex(int index) {
    _eventsImageIndex = index;
    notifyListeners();
  }
  // }
}
