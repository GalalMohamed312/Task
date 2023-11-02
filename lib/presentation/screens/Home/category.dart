import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task/presentation/utils/app_colors.dart';
import 'package:task/presentation/utils/assets.dart';

import '../../utils/values_manager.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Text("Categories view",
              style: TextStyle(
                  fontSize: AppSize.s14,
                  fontWeight: FontWeight.w400
              ),
            ),
            Spacer(),
            Text("see all",
              style: TextStyle(
                  fontSize: AppSize.s14,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.underline
              ),)
          ],
        ),
        SizedBox(height: 16,),
        Card(name: "Construction", image: ImageAssets.construction),
        SizedBox(height: 16,),
        Card(name: "Insurance", image: ImageAssets.insurance),
        SizedBox(height: 16,),
        Card(name: "Legal", image: ImageAssets.legal),
        SizedBox(height: 16,),
        Card(name: "buy & sell", image: ImageAssets.buy),
        SizedBox(height: 16,),
        Card(name: "Acounting & Srevices", image: ImageAssets.services),
        SizedBox(height: 16,),
      ],
    );
  }
}
class Card extends StatelessWidget {
  const Card({Key? key, required this.name, required this.image}) : super(key: key);
final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(

          color: Colors.white,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            // spreadRadius: 2,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(image),
          const SizedBox(width: 4.0,),
          Text(name,style: const TextStyle(
            fontSize: AppSize.s16,
            fontWeight: FontWeight.w400,
          ),),
          const SizedBox(width: AppSize.s8,),
          const Spacer(),
          const Icon(Icons.arrow_forward)
        ],
      ),
    );
  }
}

class CategoryModel {
  final String image;
  final String title;

  CategoryModel({required this.image, required this.title});
}