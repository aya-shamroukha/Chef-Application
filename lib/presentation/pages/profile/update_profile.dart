import 'dart:io';

import 'package:chef_app/domain/models/chef_model/updateprofile.dart';

import 'package:chef_app/presentation/bloc/profile_bloc/update_profile/bloc/update_profile_bloc.dart';
import 'package:chef_app/presentation/bloc/profile_bloc/update_profile/bloc/update_profile_state.dart';



import 'package:chef_app/presentation/widget/my_loading.dart';
import 'package:chef_app/presentation/widget/my_row_imagepiker.dart';
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

import '../../bloc/profile_bloc/update_profile/bloc/update_profile_event.dart';


class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  File? _image;
  String? _imagePath;

  final imagepicker = ImagePicker();
  //! upload image from gallery
  uploadimagegallery() async {
    var pickedimage2 = await imagepicker.pickImage(source: ImageSource.gallery);
    Navigator.pop(context);

    if (pickedimage2 != null) {
      saveImage(pickedimage2.path.toString());
      setState(() {
        _image = File(pickedimage2.path);
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
        _image = File(pickedimage.path);
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
      _imagePath = imageshared.getString('path');
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
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text(AppStrings().editprofile.tr()),
        ),
        body: SizedBox(
          child: SingleChildScrollView(
            child: BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
              builder: (context, state) {
                return Form(
                  key: BlocProvider.of<UpdateProfileBloc>(context).update,
                  child: Column(children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 148.w,
                          height: 148.h,
                          child: _imagePath == null
                              ? Image.asset(AssetsImage().imagePicker)
                              : CircleAvatar(
                                  radius: 75,
                                  backgroundImage: FileImage(
                                    File(_imagePath!),
                                  ),
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
                      controller: nameprofileController,
                      labeltext: AppStrings().name.tr(),
                      textInputType: TextInputType.name,
                    ),
                    Textfield(
                      controller: numberprofileontroller,
                      labeltext: AppStrings().number.tr(),
                      textInputType: TextInputType.number,
                    ),
                    Textfield(
                      controller: minimumChargecontroller,
                      labeltext: AppStrings().minimumCharge.tr(),
                      textInputType: TextInputType.name,
                    ),
                    Textfield(
                      controller: brandNamecontroller,
                      labeltext: AppStrings().brandName.tr(),
                      textInputType: TextInputType.name,
                    ),
                    Textfield(
                      controller: discrptionprofileController,
                      labeltext: AppStrings().description.tr(),
                      textInputType: TextInputType.name,
                    ),
                      state is UpdateProfileLodingState? const Loading():
                    MyButton(
                      width: 327,
                      onPressed: ()async {
          
                        if(BlocProvider.of<UpdateProfileBloc>(context).update.currentState!.validate()){
                             context.read<UpdateProfileBloc>().add(UpdateProfileSuccessEvent(
                              updateProfileModel: 
                              UpdateProfileModel(brandName:brandNamecontroller.text
                               ,disc: discrptionprofileController.text,
                               location: {"name":"Egypt","address":"meet halfa","coordinates":[1214451511,12541845]},
                               minCharge: int.parse(minimumChargecontroller.text),
                               name:nameprofileController.text ,
                               phone: int.parse(numberprofileontroller.text),
                               profilePic:  MultipartFile.fromFileSync(_image!.path,filename:_imagePath!.split('/').last))
                            
                           )
                          );
                            print('------------------true');
                             
                            }
                      },
                      text: AppStrings().update.tr(),
                    )
                  ]),
                );
              }, listener: (BuildContext context, UpdateProfileState state) {  
                  if(state is UpdateProfileSuccessState){
                      showTost(message: AppStrings().update.tr(), state: ToastState.success);
                     
                    }
                    else if(state is UpdateProfileFailedState){
                       showTost(message: 'failed', state: ToastState.error);
                    }
              },
            ),
          ),
        ));
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
