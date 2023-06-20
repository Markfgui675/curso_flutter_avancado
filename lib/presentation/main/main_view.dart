import 'package:curso_flutter_avancado/presentation/main/home_page.dart';
import 'package:curso_flutter_avancado/presentation/main/search_page.dart';
import 'package:curso_flutter_avancado/presentation/main/settings_page.dart';
import 'package:curso_flutter_avancado/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';
import 'notifications_pae.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  List<Widget> pages = [HomePage(),SearchPage(),NotificationsPage(),SettingsPage()];
  List<String> titles = [
    AppStrings.home,
    AppStrings.search,
    AppStrings.notifications,
    AppStrings.settings
  ];

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_currentIndex], style: Theme.of(context).textTheme.headline2,),
        centerTitle: true,
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black, spreadRadius: AppSize.s1_5)
          ]
        ),
        child: BottomNavigationBar(
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.primary,
          currentIndex: _currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: ""),
          ],
        ),
      ),
    );
  }
  onTap(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}

