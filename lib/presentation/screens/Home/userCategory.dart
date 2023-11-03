import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/utils/app_colors.dart';
import 'package:task/presentation/utils/assets.dart';

import '../../../Cubit/HomeCubit.dart';
import '../../../Cubit/home_states.dart';
import '../../utils/values_manager.dart';

class UserCategories extends StatelessWidget {
  final HomeCubit cubit;
  final HomeStates state;
  const UserCategories( {Key? key, required this.cubit, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(state is GetAllUserLoadingState) {
      return const Center(child: CircularProgressIndicator());
    }
    else {
      return Column(
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
            ListView.separated(
              shrinkWrap: true,
              physics:  const NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
              return  Card(model: CategoryModel(id: cubit.getAllUsersModel!.users[index].id,title: cubit.getAllUsersModel!.users[index].name),);
            }, separatorBuilder:(context,index){
              return const SizedBox(height: 16,);
            }
              ,
              itemCount
                  :cubit.getAllUsersModel!.users.length,
            ),
          ]
      );
    }

  }

}

class Card extends StatelessWidget {
  const Card({Key? key, required this.model, })
      : super(key: key);
  final CategoryModel model;

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
          Text("${model.id}"),
          const SizedBox(width: 4.0,),
          Text(model.title, style: const TextStyle(
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
  final int id;
  final String title;

  CategoryModel({required this.id, required this.title});
}