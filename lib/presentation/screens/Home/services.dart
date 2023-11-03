import 'package:flutter/cupertino.dart';
import 'package:task/presentation/utils/app_colors.dart';
import 'package:task/presentation/utils/app_strings.dart';
import 'package:task/presentation/utils/assets.dart';
import 'package:task/presentation/utils/values_manager.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: 200,
              width: 200,
              color: AppColors.bgGray,
              child: Image.asset(ImageAssets.nothingFound)),
        ),
        const SizedBox(height: 16,),
        const Text(TextApp.noOrder,style: TextStyle(
          fontSize: AppSize.s22,
          fontWeight: FontWeight.w700,
        ),),
        const Center(
          child: Text(TextApp.placrorder,style: TextStyle(
            fontSize: AppSize.s20,
            fontWeight: FontWeight.w300,
            color: AppColors.darkGray
          ),),
        ),

      ],
    );
  }
}
