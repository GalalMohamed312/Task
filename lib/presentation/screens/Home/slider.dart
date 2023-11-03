import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

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
    return Container(
      color: AppColors.lightRed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  //order button
                  ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.red),
                    ),
                    child: Container(
                      padding:const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        slide.buttonName,
                        style: const TextStyle(fontSize: 16.0,color: AppColors.white),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 78.0),
                ],
              ),
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