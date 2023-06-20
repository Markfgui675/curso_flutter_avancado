import 'package:curso_flutter_avancado/presentation/main/home_page.dart';
import 'package:curso_flutter_avancado/presentation/main/search_page.dart';
import 'package:curso_flutter_avancado/presentation/main/settings_page.dart';
import 'package:curso_flutter_avancado/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import 'notifications_pae.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  List<Widget> pages = [HomePage(),SearchPage(),NotificationsPage(),SettingsPage()];

  var _title = AppStrings.home;

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title, style: Theme.of(context).textTheme.headline2,),
        centerTitle: true,
      ),
      body: pages[_currentIndex]
    );
  }
}

