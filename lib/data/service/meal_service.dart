import 'package:chef_app/config/error/exceptions.dart';
import 'package:chef_app/data/localSotrge/localStorage.dart';
import 'package:chef_app/domain/models/meal_model/add_meal_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MealService{

  addMeal(AddMealModel mealmodel);
  updateMeal();
  deleteMeal( id);
  getAllMeal();
}
class MealImpl extends MealService{
   String url='https://food-api-omega.vercel.app/api/v1';
   
     @override
     addMeal(mealmodel)async {
     
      FormData formData = 
     FormData.fromMap(mealmodel.toMap());
    
     Dio dio=Dio();
   try { Response response = await dio.post('https://food-api-omega.vercel.app/api/v1/meal/add-to-menu',
     data: formData,
     options: Options(
    sendTimeout: const Duration(seconds: 60),
        headers: {
          'Content-Type': 'multipart/form-data',
          "User-Agent":"PostmanRuntime/7.36.0",
          "Connection":"keep-alive",
          "token":getIt.get<SharedPreferences>().getString('token'),
          
        }
      ),);
      print('----------- $response');
     if(response.statusCode==202){
      return response.data as Map;
     }else{
      return 'false';
     }
      }on ServerException catch (error){
        return error.errorModel.errorMessage;
      }
   
     }
   
     @override
     deleteMeal(id)async {
      Dio dio=Dio(); 
      Response response =await dio.delete('https://food-api-omega.vercel.app/api/v1/meal/delete-meal/$id',
      options: Options(
    sendTimeout: const Duration(seconds: 60),
        headers: {
          "Content-Type":"application/json",
          "User-Agent":"PostmanRuntime/7.36.0",
          "Connection":"keep-alive",
          "token":getIt.get<SharedPreferences>().getString('token')
        }
      ),
      );

      if (response.statusCode==202){
        return true;
      }
    throw UnimplementedError();
     }
   
     @override
     getAllMeal() {
     
    throw UnimplementedError();
     }
   
     @override
     updateMeal() {
     
    throw UnimplementedError();
     }
}