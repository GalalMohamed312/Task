import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/screens/Home/services.dart';
import 'package:task/presentation/utils/app_colors.dart';
import 'package:task/presentation/utils/app_strings.dart';
import 'package:task/presentation/utils/assets.dart';
import 'package:task/presentation/utils/media_query_values.dart';
import 'package:task/presentation/utils/values_manager.dart';

import '../../../Cubit/HomeCubit.dart';
import '../../../Cubit/home_states.dart';
import 'category.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  final List<Slide> slides = [
    Slide(
      image:ImageAssets.manPresenting,
      title: 'Slide 1',
      buttonName: 'Description 1',
    ),
    Slide(
      image:ImageAssets.manPresenting,
      title: TextApp.multiService,
      buttonName: 'Order',
    ),
    Slide(
      image:ImageAssets.manPresenting,
      title: 'Slide 3',
      buttonName: 'Description 3',
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
          List listOfCategory=[
            Expanded(
              child: TextButton(
                onPressed: () {
                  cubit.changeTabBarIndex(0);
                },
                child: Container(
                  width: double.infinity,
                  decoration:BoxDecoration(
                    color: cubit.tabBarCurrentIndex==0?AppColors.red: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color:cubit.tabBarCurrentIndex==0?AppColors.red: AppColors.lightGray
                    ),
                    // border: BoxBorder()
                  ),
                  child: Center(
                    child: Text("Categories",
                      style: TextStyle(
                        fontSize: AppSize.s14,
                        fontWeight: FontWeight.w400,
                        color:cubit.tabBarCurrentIndex==0?AppColors.white: AppColors.black, ),),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  cubit.changeTabBarIndex(1);
                },
                child: Container(
                  width: double.infinity,
                  decoration:BoxDecoration(
                    color: cubit.tabBarCurrentIndex==1?AppColors.red: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color:cubit.tabBarCurrentIndex==1?AppColors.red: AppColors.lightGray
                    ),
                    // border: BoxBorder()
                  ),
                  child: Center(
                    child: Text("Services",
                      style: TextStyle(
                        fontSize: AppSize.s14,
                        fontWeight: FontWeight.w400,
                        color:cubit.tabBarCurrentIndex==1?AppColors.white: AppColors.black, ),),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  cubit.changeTabBarIndex(2);
                },
                child: Container(
                  width: double.infinity,
                  decoration:BoxDecoration(
                    color: cubit.tabBarCurrentIndex==2?AppColors.red: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                       color:cubit.tabBarCurrentIndex==2?AppColors.red: AppColors.lightGray
                    ),
                    // border: BoxBorder()
                  ),
                  child: Center(
                    child: Text("Orders (0)",
                      style: TextStyle(
                        fontSize: AppSize.s14,
                        fontWeight: FontWeight.w400,
                        color:cubit.tabBarCurrentIndex==2?AppColors.white: AppColors.black, ),),
                  ),
                ),
              ),
            ),
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
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(

                          color: Colors.grey.shade200,
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        children: [
                          listOfCategory[0],
                          listOfCategory[1],
                          listOfCategory[2],
                        ],
                      ),
                    ),
                    const SizedBox(height:AppSize.s16),
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

class Slide {
  final String image;
  final String title;
  final String buttonName;

  Slide({required this.image, required this.title, required this.buttonName});
}

class SlideItem extends StatelessWidget {
  final Slide slide;

  const SlideItem({Key? key, required this.slide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      color: AppColors.lightRed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 26.0),
                Text(
                  slide.title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {},

                  style: ButtonStyle(
                    // padding: EdgeInsets.symmetric(horizontal: 20.0),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      slide.buttonName,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
                // const SizedBox(height: 78.0),
              ],
            ),
          ),
          const SizedBox(width: 16.0,),
          Expanded(
            child: Image.asset(
              slide.image,
              // width: mediaQuery.size.width * 0.5,
              // height: mediaQuery.size.height * 0.5,
            ),
          ),


        ],
      ),
    );
  }
}
