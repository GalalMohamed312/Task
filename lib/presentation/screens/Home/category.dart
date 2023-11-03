
import 'package:flutter/material.dart';
import 'package:task/presentation/utils/assets.dart';
import '../../utils/values_manager.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //list of all category buttons
    List<Card> categoryModel=[
      Card(categoryModel: CategoryModel(title: "Construction", image: ImageAssets.construction)),
      Card(categoryModel:CategoryModel(title: "Insurance", image: ImageAssets.insurance)),
      Card(categoryModel:CategoryModel(title: "Legal", image: ImageAssets.legal)),
      Card(categoryModel:CategoryModel(title: "buy & sell", image: ImageAssets.buy)),
      Card(categoryModel:CategoryModel(title: "Acounting & Srevices", image: ImageAssets.services)),
    ];
    // category view
    return  Column(
      children: [
        const Row(
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
        const SizedBox(height: 16,),
        //view category buttons
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder:(context,index){
          return categoryModel[index];
        },
        itemCount: categoryModel.length,
          separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 16,);
          },

        ),

      ],
    );
  }
}
class Card extends StatelessWidget {
  const Card({Key? key, required this.categoryModel,}) : super(key: key);
  final CategoryModel categoryModel;

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
          Image.asset(categoryModel.image),
          const SizedBox(width: 4.0,),
          Text(categoryModel.title,style: const TextStyle(
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