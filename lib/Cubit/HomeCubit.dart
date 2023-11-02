
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/screens/aseets.dart';
import 'package:task/presentation/screens/Home/home.dart';
import 'package:task/presentation/screens/profile.dart';
import 'package:task/presentation/screens/support.dart';
import 'package:task/presentation/utils/app_colors.dart';
import 'package:task/presentation/utils/assets.dart';

import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInitialStates());
  static HomeCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  int currentPageIndex = 0;
  int tabBarCurrentIndex=0;
  List<Widget> screens=[
      HomeScreen(),
    const AssetsScreen(),
    const SupportScreen(),
    const ProfileScreen(),
    // const Shop(),
  ];
  List<BottomNavigationBarItem> screenItems=[
     BottomNavigationBarItem(icon:Image.asset(ImageAssets.home),
        label:'Home', ),
    BottomNavigationBarItem(icon:Image.asset(ImageAssets.dashboardCustomize,color: AppColors.gray,),
        label:'Assets' ),
    BottomNavigationBarItem(icon:Image.asset(ImageAssets.supportAgent,color: AppColors.gray,),
        label:'Support' ),
    const BottomNavigationBarItem(icon:Icon(Icons.person_outline,color: AppColors.gray,),
        label:'Profile' ),

  ];
  // Image.asset("assets/images/quraniconimage.png"
void changeIndex(int index){
  currentIndex=index;
  emit(HomeChangeBottomNavBarState());
}
  void changePageViewIndex(int index){
    currentPageIndex=index;
    emit(HomeChangeBottomNavBarState());
  }
  void changeTabBarIndex(int index){
    tabBarCurrentIndex=index;
    emit(HomeChangeBottomNavBarState());
  }
}

