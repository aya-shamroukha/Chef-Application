// ignore_for_file: avoid_print

import 'package:chef_app/config/api/end_points.dart';
import 'package:chef_app/config/error/exceptions.dart';
import 'package:chef_app/data/localSotrge/localStorage.dart';
import 'package:chef_app/domain/models/chef_model/change_passowrd.dart';
import 'package:chef_app/domain/models/chef_model/login_model.dart';
import 'package:chef_app/domain/models/chef_model/updateprofile.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
abstract class ChefService{
signup();
checkEmail();
  signIn(LogInModelRequest login);
forgetPassSendCode(String email);
forgetPassChange(String email,String newpassword,String confirmpassword,String code,);
changePassword(ChangePasswordModel changePasswordModel);
updateChef(UpdateProfileModel updateProfileModel);
deleteChef();
changeChefStatus();
getChefData();
logOut();
getChefMeal( id);
}
class ChefImpl extends ChefService{
  
   String url='https://food-api-omega.vercel.app/api/v1';
  @override
  changeChefStatus() {
    
    throw UnimplementedError();
  }

  @override
  changePassword(changePasswordModel) async{
   Dio dio=Dio();
   Response response=await dio.patch('https://food-api-omega.vercel.app/api/v1/chef/change-password',
   data: changePasswordModel,
    options: Options(
    sendTimeout: const Duration(seconds: 60),
        headers: {
         'Content-Type': 'application/json',
          "User-Agent":"PostmanRuntime/7.37.3",
          "Connection":"keep-alive",
          "token":getIt.get<SharedPreferences>().getString('token')
        }
      ),); print('----------------response');
      print(response);
     if(response.statusCode==202){
       print('---------response true');
      return response.data ;
     }else{
      return 'false';
     }
   
  }

  @override
  checkEmail() {
   
    throw UnimplementedError();
  }

  @override
  deleteChef() {
    
    throw UnimplementedError();
  }

  @override
    forgetPassChange(email,newpassword,confirmpassword,code) async{
    Dio dio=Dio();
    Response response =await dio.patch('https://food-api-omega.vercel.app/api/v1/chef/change-forgotten-password'
    ,data: {ApiKeys.email:email,
    ApiKeys.password:newpassword,
    ApiKeys.confirmPassword:confirmpassword,
    ApiKeys.code:code
    
    },
    options: Options(
    sendTimeout: const Duration(seconds: 60),
        headers: {
          "Content-Type":"application/json",
          "User-Agent":"PostmanRuntime/7.36.0",
          "Connection":"keep-alive"
        }
      ),);
        print(response);
    if(response.statusCode==202){
      print('--------trueeeee');
      return true;
    }else{
      print('-------false');
      return false;
    }
    
    
  }

  @override
  forgetPassSendCode(String email)async {
    Dio dio=Dio();
    Response response=await dio.post('https://food-api-omega.vercel.app/api/v1/chef/send-code',
    data:{ ApiKeys.email:email},
       options: Options(
    sendTimeout: const Duration(seconds: 60),
        headers: {
          "Content-Type":"application/json",
          "User-Agent":"PostmanRuntime/7.36.0",
          "Connection":"keep-alive"
        }
      ),);
      print(response);
    if(response.statusCode==200){
      print('--------trueeeee');
      return true;
    }else{
      print('-------false');
      return false;
    }
   
  }

  @override
  getChefData() {
   
    throw UnimplementedError();
  }

  getChefMeals() {
   
    throw UnimplementedError();
  }

  @override
  logOut() {
    
    throw UnimplementedError();
  }

  @override
  signIn(login)async { 
    Dio dio=Dio();
    //     FormData formData = 
    // new FormData.fromMap(logInModel.toMap());
    print('---------pefor response');
    try{Response response=await dio.post('https://food-api-omega.vercel.app/api/v1/chef/signin',data: login.toJson(),
     
    
    options: Options(
    sendTimeout: const Duration(seconds: 60),
        headers: {
          "Content-Type":"application/json",
          "User-Agent":"PostmanRuntime/7.36.0",
          "Connection":"keep-alive"
        }
      ),
      );
      print(response);
      print('---------response');
        if (response.statusCode==202){
          print('trueeeeeeeeeee');
    print(response.data['token']);
      getIt.get<SharedPreferences>().setString(
          'token', 'FOODAPI ${response.data['token']}');
   var mytoken= JwtDecoder.decode(getIt.get<SharedPreferences>().getString('token').toString());
          getIt.get<SharedPreferences>().setString('id', mytoken['id']);
          print('------------my id');
          print(mytoken);
      return true;
      
    }
else {          print('falseeeee');

  return 'false';}
} on ServerException catch( error){
return ServerException(error.errorModel);
}
  }

  @override
  signup() {
   
    throw UnimplementedError();
  }

  @override
  updateChef(updateProfileModel)async {
  FormData formData = 
     FormData.fromMap(updateProfileModel.toMap());
   Dio dio=Dio();
   try{Response response=await dio.patch('https://food-api-omega.vercel.app/api/v1/chef/update',data:formData ,
   options: Options(
    sendTimeout: const Duration(seconds: 60),
        headers: {
        'Content-Type': 'multipart/form-data',
        // "User-Agent":"PostmanRuntime/7.37.3",
          "Connection":"keep-alive",
          "token":getIt.get<SharedPreferences>().getString('token')
        }
      ),);
      print('----------------response');
      print(response);
     if(response.statusCode==202){
      print('---------response true');
      return true ;
     }else{
      return 'false';
     }}
     on ServerException catch (error){
        return error.errorModel.errorMessage;
      }
   
   
  }
  
  @override
  getChefMeal( id) async{
    Dio dio=Dio();
    Response response= await dio.get('https://food-api-omega.vercel.app/api/v1/chef/get-chef/$id/meals',
     options: Options(
    sendTimeout: const Duration(seconds: 60),
        headers: {
         'Content-Type': 'multipart/form-data',
          "User-Agent":"PostmanRuntime/7.36.0",
          "Connection":"keep-alive",
          "token":getIt.get<SharedPreferences>().getString('token')
        }
      ),);
     if(response.statusCode==200){

      return response.data
       ;
     }else{
      return 'false';
     }
    
    
    
  }

}