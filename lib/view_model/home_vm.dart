import 'package:flutter/cupertino.dart';

class HomeVm extends ChangeNotifier {
  int? currentIndex = 0;
  void onChanged(int value) {
    value = currentIndex!;
    notifyListeners();
  }
}
