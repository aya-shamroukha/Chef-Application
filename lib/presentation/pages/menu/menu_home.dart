// ignore_for_file: prefer_const_constructors
import 'package:chef_app/presentation/bloc/menu_bloc/delete_meal_bloc/delete_meal_bloc.dart';
import 'package:chef_app/presentation/bloc/menu_bloc/delete_meal_bloc/delete_meal_event.dart';
import 'package:chef_app/presentation/bloc/menu_bloc/delete_meal_bloc/delete_meal_state.dart';
import 'package:chef_app/presentation/bloc/menu_bloc/get_meal_bloc/get_meals_bloc.dart';
import 'package:chef_app/presentation/bloc/menu_bloc/get_meal_bloc/get_meals_event.dart';
import 'package:chef_app/presentation/bloc/menu_bloc/get_meal_bloc/get_meals_state.dart';
import 'package:chef_app/presentation/widget/my_network_image.dart';
import 'package:chef_app/presentation/widget/my_show_dialog.dart';
import 'package:chef_app/presentation/widget/mybutton.dart';
import 'package:chef_app/presentation/widget/mysizedbox.dart';
import 'package:chef_app/presentation/widget/shimmer_body.dart';
import 'package:chef_app/utilities/assets.dart';
import 'package:chef_app/utilities/colors.dart';
import 'package:chef_app/utilities/string.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MenuHomeScreen extends StatelessWidget {
  const MenuHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          SizedBox_Height(height: 20.h),
          MyButton(
              width: 327,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('addmeal');
              },
              text: AppStrings().addmeal.tr()),
          SizedBox_Height(height: 24.h),
          BlocBuilder<GetMealsBloc, GetMealsState>(builder: (context, state) {
            if (state is GetMealSuccessState) {
              // state.getChefMealModel.isEmpty?  Text('No Meal yet'):
              return Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 30.h,
                        );
                      },
                      itemCount: state.getChefMealModel.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                            title: Text(state.getChefMealModel[index].name),
                            titleTextStyle: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 16),
                            subtitleTextStyle: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    fontSize: 16, color: AppColors.grayText),
                            subtitle: SizedBox(
                              width: 180.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state
                                      .getChefMealModel[index].description),
                                  Text(state.getChefMealModel[index].price
                                      .toString())
                                ],
                              ),
                            ),
                            trailing:
                                BlocConsumer<DeleteMealBloc, DeleteMealState>(
                              builder: (context, stat) {
                                return SizedBox(
                                  width: 30.w,
                                  height: 30.h,
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                                actionsOverflowDirection:
                                                    VerticalDirection.down,
                                                content: Text(
                                                    AppStrings()
                                                        .contentDialog
                                                        .tr(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayLarge!
                                                        .copyWith(
                                                            color: AppColors
                                                                .primary)),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                        AppStrings()
                                                            .cancel
                                                            .tr(),
                                                        style: Theme.of(
                                                                context)
                                                            .textTheme
                                                            .displayMedium),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                              DeleteMealBloc>()
                                                          .add(DeleteMealSuccessEvent(
                                                              state
                                                                  .getChefMealModel[
                                                                      index]
                                                                  .id));
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                        AppStrings().ok.tr(),
                                                        style: Theme.of(
                                                                context)
                                                            .textTheme
                                                            .displayMedium),
                                                  )
                                                ]);
                                          });
                                    },
                                    child: Image.asset(
                                      AssetsImage().delete,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                              listener: (BuildContext context,
                                  DeleteMealState stat) {
                                if (stat is DeleteMealSuccessState) {
                                  context
                                      .read<GetMealsBloc>()
                                      .add(GetMealSuccessEvent());
                                }
                              },
                            ),
                            leading: MyNetworkImage(
                                imageUrl: state
                                    .getChefMealModel[index].images[0])
                                    );
                      })));
            } else {
              return Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: ((context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: ShimmerBodyForMenu(),
                      );
                    })),
              );
            }
          })
        ],
      )),
    );
  }
}
