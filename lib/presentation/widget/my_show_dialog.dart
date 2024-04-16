import 'package:chef_app/presentation/bloc/menu_bloc/delete_meal_bloc/delete_meal_bloc.dart';
import 'package:chef_app/presentation/bloc/menu_bloc/delete_meal_bloc/delete_meal_event.dart';
import 'package:chef_app/utilities/colors.dart';
import 'package:chef_app/utilities/string.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> ShowDialog(BuildContext context) {
    return showDialog(
                 
                  context: context,
                  builder: (context) {
                     
    return AlertDialog(
                      
                      actionsOverflowDirection: VerticalDirection.down,
                      content: Text(AppStrings().contentDialog.tr(),style:Theme.of(context).textTheme.displayLarge!.
                      copyWith(color: AppColors.primary)),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: 
                      Text(AppStrings().cancel.tr(),style:Theme.of(context).textTheme.displayMedium),
                      ),
                      TextButton(onPressed: (){

                        
                                       
                      }, child: 
                      Text(AppStrings().ok.tr(),style:Theme.of(context).textTheme.displayMedium),
                      )
                      
                      
                      
                      ]
                    
                    );
                  }
    );
}
