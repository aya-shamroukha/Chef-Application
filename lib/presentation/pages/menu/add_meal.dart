// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:chef_app/domain/models/meal_model/add_meal_model.dart';
import 'package:chef_app/presentation/bloc/auth_bloc/login_bloc/login_state.dart';
import 'package:chef_app/presentation/bloc/menu_bloc/add_meal_bloc/add_meal_bloc.dart';
import 'package:chef_app/presentation/bloc/menu_bloc/add_meal_bloc/add_meal_event.dart';
import 'package:chef_app/presentation/bloc/menu_bloc/add_meal_bloc/add_meal_state.dart';
import 'package:chef_app/presentation/widget/my_loading.dart';
import 'package:chef_app/presentation/widget/my_row_imagepiker.dart';
import 'package:chef_app/presentation/widget/my_skip_button.dart';
import 'package:chef_app/presentation/widget/my_toast.dart';
import 'package:chef_app/presentation/widget/mybutton.dart';

import 'package:chef_app/presentation/widget/mysizedbox.dart';
import 'package:chef_app/presentation/widget/mytextfield.dart';
import 'package:chef_app/utilities/assets.dart';
import 'package:chef_app/utilities/colors.dart';
import 'package:chef_app/utilities/string.dart';
import 'package:dio/dio.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  File? image;
  String? imagePath;
Dio dio=Dio();
  final imagepicker = ImagePicker();
  //! upload image from gallery
  uploadimagegallery() async {
    var pickedimage2 = await imagepicker.pickImage(source: ImageSource.gallery);
    Navigator.pop(context);

    if (pickedimage2 != null) {
      saveImage(pickedimage2.path.toString());
      setState(() {
        image = File(pickedimage2.path);
      });
    } else {}
  }

//! upload image from cameria
  uploadimagegallerycam() async {
    var pickedimage = await imagepicker.pickImage(source: ImageSource.camera);
    Navigator.pop(context);
    if (pickedimage != null) {
      saveImage(pickedimage.path.toString());
      setState(() {
        image = File(pickedimage.path);
      });
    } else {}
  }

//! save image with path
  saveImage(String val) async {
    final imageshared = await SharedPreferences.getInstance();
    imageshared.setString('path', val);
    getImage();
  }

//!get image from path
  getImage() async {
    final imageshared = await SharedPreferences.getInstance();
    setState(() {
      imagePath = imageshared.getString('path');
    });
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

//!delete image
  void deleteImage() async {
    final imageDel = await SharedPreferences.getInstance();
    imageDel.remove('path');
    getImage();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
         leading: skipButton(
          (){
            Navigator.of(context).pushReplacementNamed('menuScreen');
          }
        ),
        title: Text(AppStrings().addmeal.tr()),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: BlocConsumer<AddMealBloc, AddMealState>(
                listener: (context, state) {

                  if(state is AddMealSuccessState){
                    showTost(message: 'Add Meal', state: ToastState.success);
                    Navigator.of(context).pushReplacementNamed('menuScreen');
                  }
                  // else{
                  //    showTost(message: 'failed', state: ToastState.error);
                  // }
                },
                builder: (context, state) {
                  var mealBloc = BlocProvider.of<AddMealBloc>(context);

                  return Form(
                    key: mealBloc.addmeal,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 148.w,
                              height: 148.h,
                              child: imagePath == null
                                  ? Image.asset(AssetsImage().imagePicker)
                                  : CircleAvatar(
                                    radius: 75,
                                    backgroundImage: FileImage( File(imagePath!),),
                                    
                                  ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                  width: 31.67,
                                  height: 32.5,
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryBlod,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: IconButton(
                                          onPressed: () {
                                            showDialogForImage(context);
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            color: AppColors.white,
                                            size: 20,
                                          )))),
                            )
                          ],
                        ),
                        SizedBox_Height(height: 24.h),
                        Textfield(
                            labeltext: AppStrings().name.tr(),
                            controller: mealBloc.nameController,
                            textInputType: TextInputType.name),
                        Textfield(
                            labeltext: AppStrings().price.tr(),
                            controller: mealBloc.priceController,
                            textInputType: TextInputType.number),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: DropdownButtonFormField(
                              style: TextStyle(
                                  fontSize: 14.sp, color: AppColors.gray),
                              isExpanded: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              hint: Text(AppStrings().category.tr()),
                              value: mealBloc.firstitem,
                              items: mealBloc.categoryList
                                  .map((e) => DropdownMenuItem(
                                        // ignore: sort_child_properties_last
                                        child: Text(e), value: e,
                                      ))
                                  .toList(),
                              onChanged: (data) {
                                mealBloc.firstitem = data;
                              }),
                        ),
                        SizedBox_Height(height: 15.h),
                        Textfield(
                            labeltext: AppStrings().description.tr(),
                            controller: mealBloc.descriptionController,
                            textInputType: TextInputType.name),
                        Row(
                          children: [

                            Row(children: [
                              Radio(
                                activeColor: AppColors.primary,
                                
                                onChanged: (data){
                                   mealBloc.groupValue=data;
                                },groupValue: mealBloc.groupValue,
                               value: 'quantity',
                              ),
                              Text(AppStrings().quantity.tr())
                            ],),
                            const Spacer(),
                             Row(children: [
                              Radio(
                                activeColor: AppColors.primary,
                                
                                onChanged: (data){
                                  mealBloc.groupValue=data;
                                },groupValue: mealBloc.groupValue,
                               value: 'number',
                              ),
                              Text(AppStrings().number.tr())
                            ],)
                          ],
                        ),
                        SizedBox_Height(height: 15.h,),
                        state is AddMealLodingState? const Loading():
                        MyButton(
                            width: 327,
                            onPressed: () async{
                            
    
                              if(mealBloc.addmeal.currentState!.validate()){
                               context.read <AddMealBloc>().add(AddMealSuccess(
                                addMealModel:AddMealModel(
                                  mealImages:  
                                await MultipartFile.fromFileSync(image!.path,filename:imagePath!.split('/').last)
                                  //File(imagePath!), 
                                  ,description: mealBloc.descriptionController.text,
                                   name: mealBloc.nameController.text, price:
                                    double.parse(mealBloc.priceController.text),
                                     category: mealBloc.firstitem, howToSell: mealBloc.groupValue) ));
                              }
                            },
                            text: AppStrings().addmeal.tr()),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showDialogForImage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: SizedBox(
                  height: 110.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CoustomRow(
                        icon: Icons.photo,
                        fontStyle: FontStyle.italic,
                        string: AppStrings().fromGallery.tr(),
                        ontap: uploadimagegallery,
                      ),
                      SizedBox_Height(
                        height: 10.w,
                      ),
                      CoustomRow(
                        fontStyle: FontStyle.italic,
                        icon: Icons.camera_alt,
                        string: AppStrings().fromcamera.tr(),
                        ontap: uploadimagegallerycam,
                      ),
                      SizedBox_Height(
                        height: 10.w,
                      ),
                      CoustomRow(
                        fontStyle: FontStyle.italic,
                        icon: Icons.delete_forever,
                        string: AppStrings().deleteimage.tr(),
                        ontap: deleteImage,
                      ),
                    ],
                  )));
        });
  }
}
