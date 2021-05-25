import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_test/Screens/7day.dart';
import 'package:weather_test/Screens/share.dart';
import 'package:weather_test/Screens/today.dart';
import 'package:weather_test/view_model/home_vm.dart';

final homeVm = ChangeNotifierProvider((_) => HomeVm());

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final model = watch(homeVm);
    final List<Widget> _children = [Today(), SevenDay(), Share()];
    return Scaffold(
        body: _children[model.currentIndex!],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.currentIndex!,
          onTap: (value) {
            model.onChanged(value);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined)),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_view_day_outlined)),
            BottomNavigationBarItem(icon: Icon(Icons.share_outlined))
          ],
        ));
  }
}
