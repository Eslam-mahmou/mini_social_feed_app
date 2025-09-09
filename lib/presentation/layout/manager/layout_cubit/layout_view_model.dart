import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mini_social_feed/presentation/layout/tabs/homeTab.dart';

import '../../tabs/notificationTab.dart';
import '../../tabs/profileTab.dart';
import '../../tabs/vectorTab.dart';
import 'layout_state.dart';

class LayoutViewModel extends Cubit<LayoutState> {
  LayoutViewModel() : super(LayoutInitial());
  int currentIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    VectorTab(),
    NotificationTab(),
    ProfileTab(),
  ];
  void changeBottomNav(int index){
    emit(LayoutInitial());
    currentIndex = index;
    emit(LayoutChangeBottomNavState());
  }
}