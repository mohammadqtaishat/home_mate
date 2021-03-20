import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class DrawerNotifier extends ChangeNotifier {

  String userName = 'Mohammad';
  Image userImage = Image.network('assets/batman.png');
  double swipeOffset = 0;

  void setUserName(String value) {
    userName = value;
    notifyListeners();
  }

  void setUserImage(Image value) {
    userImage = value;
    notifyListeners();
  }

  void setSwipeOffset(double value) {
    swipeOffset = 0;
    notifyListeners();
  }

}
