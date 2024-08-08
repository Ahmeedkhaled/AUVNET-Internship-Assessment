import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_auvnet/ui/tabs/home/cubit/home_screnn_states.dart';
import 'package:task_auvnet/ui/tabs/list/list_tab.dart';
import 'package:task_auvnet/ui/tabs/profile/profile_tab.dart';

class HomeScreenViewModel extends Cubit<HomeScreenState> {
  HomeScreenViewModel() : super(HomeScreenInitialState());
  int selectIndex = 0;
  List<Widget> tabs = [
    const ListTab(),
    const ProfileTab(),
  ];
  void changeBottomNavBar(int newSelectedIndex) {
    HomeScreenInitialState();
    selectIndex = newSelectedIndex;
    emit(ChangeNavigationBar());
  }
}
