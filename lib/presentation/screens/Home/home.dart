import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/screens/Home/services.dart';
import 'package:task/presentation/screens/Home/slider.dart';
import 'package:task/presentation/utils/app_colors.dart';
import 'package:task/presentation/utils/app_strings.dart';
import 'package:task/presentation/utils/assets.dart';
import 'package:task/presentation/utils/values_manager.dart';

import '../../../Cubit/HomeCubit.dart';
import '../../../Cubit/home_states.dart';
import 'category.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  final List<Slide> slides = [
    Slide(
      image:ImageAssets.manPresenting,
      title: TextApp.multiService,
      buttonName: 'Order',
    ),
    Slide(
      image:ImageAssets.manPresenting,
      title: TextApp.multiService,
      buttonName: 'Order',
    ),
    Slide(
      image:ImageAssets.manPresenting,
      title: TextApp.multiService,
      buttonName: 'Order',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) =>HomeCubit(),
      child:BlocConsumer<HomeCubit,HomeStates>(
        listener: (BuildContext context,HomeStates state){},
        builder: (BuildContext context,HomeStates state){
          var cubit=HomeCubit.get(context);
          List<TabBar> tabBarList=[
            TabBar(cubit: cubit, index: 0, name: "Categories"),
            TabBar(cubit: cubit, index: 1, name: "Services"),
            TabBar(cubit: cubit, index: 2, name: "Order (0)"),
          ];
          return  Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: const Text(TextApp.home),
              leading: Image.asset(ImageAssets.list),
              centerTitle: true,
              shadowColor: AppColors.gray,
              // elevation: 0.8,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const  EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //hi ahmed view
                    Row(

                      children: [
                        Image.asset(ImageAssets.profile),
                        const Text(TextApp.hey),
                        Image.asset(ImageAssets.pray),
                      ],
                    ),
                    const SizedBox(height: AppSize.s16,),
                    const Text(TextApp.multiService,style: TextStyle(
                        fontSize: AppSize.s18
                    ),),
                    const Text(TextApp.explore,style: TextStyle(
                        color: AppColors.darkGray,
                        fontSize: AppSize.s14
                    ),),
                    const SizedBox(height: AppSize.s20,),
                    //slider view
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: PageView.builder( itemCount: slides.length,
                        onPageChanged: (value){
                        cubit.changePageViewIndex(value);
                        },
                        itemBuilder: (context, index) {
                          return SlideItem(slide: slides[index]);
                        },),
                    ),
                    const SizedBox(height:AppSize.s4),
                    //dot indicator
                    Center(
                      child: DotsIndicator(
                        dotsCount: slides.length,
                        position: cubit.currentPageIndex.toDouble(),
                        decorator: DotsDecorator(
                          color: Colors.grey[300]!, // Inactive dot color
                          activeColor: Colors.red, // Active dot color
                        ),
                      ),
                    ),
                    const SizedBox(height:AppSize.s24),
                    //tab bar
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(

                          color: Colors.grey.shade200,
                          width: 1.0,
                        ),
                      ),
                      //tabBAr
                      child: Row(
                        children: [
                          tabBarList[0],
                          tabBarList[1],
                          tabBarList[2],
                        ],
                      ),
                    ),
                    const SizedBox(height:AppSize.s16),
                    //every tab screen
                    cubit.tabBarCurrentIndex==0?const Categories():const SizedBox(),
                    cubit.tabBarCurrentIndex==1?const Services():const SizedBox(),
                    cubit.tabBarCurrentIndex==2?const Services():const SizedBox(),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}


class TabBar extends StatelessWidget {
  const TabBar({Key? key, required this.cubit, required this.index, required this.name}) : super(key: key);
  final HomeCubit cubit;
  final int index;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          cubit.changeTabBarIndex(index);
        },
        child: Container(
          width: double.infinity,
          decoration:BoxDecoration(
            color: cubit.tabBarCurrentIndex==index?AppColors.red: AppColors.lightGray,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color:cubit.tabBarCurrentIndex==index?AppColors.red: AppColors.lightGray
            ),
            // border: BoxBorder()
          ),
          child: Center(
            child: Text(name,
              style: TextStyle(
                fontSize: AppSize.s14,
                fontWeight: FontWeight.w400,
                color:cubit.tabBarCurrentIndex==index?AppColors.white: AppColors.black, ),),
          ),
        ),
      ),
    );
  }
}
