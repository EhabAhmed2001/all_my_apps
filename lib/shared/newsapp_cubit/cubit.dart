import 'package:all_my_apps/modules/news_app/businees/business_screen.dart';
import 'package:all_my_apps/modules/news_app/science/science_screen.dart';
import 'package:all_my_apps/modules/news_app/settings/settings_screen.dart';
import 'package:all_my_apps/modules/news_app/sports/sports_screen.dart';
import 'package:all_my_apps/shared/newsapp_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class news_cubit extends Cubit<news_states>{
  news_cubit() : super(NewsInitialState());

  static news_cubit get(context) => BlocProvider.of(context);


  List<BottomNavigationBarItem> bottomNavBar =[
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'BUSINESS',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'SCIENCE',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_basketball),
      label: 'SPORTS',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'SETTINGS',
    ),
  ];

  List<Widget> screen = [
    business_screen(),
    science_screen(),
    sports_screen(),
    setting_screen(),
  ];

  int currentIndex = 0;

  void indexChange (int index)
  {
    currentIndex = index;
    emit(ChangeBottomNavBar());
  }
}