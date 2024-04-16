abstract class AdminService{
  signIn();
  getMeal();
  getChef();
  dealWithChefReuest();
dealWithMealRequest();
logOut();
}
class AdminImpl extends AdminService{
  String url='https://food-api-omega.vercel.app/api/v1';
  @override
  dealWithChefReuest() {
    
    throw UnimplementedError();
  }

  @override
  dealWithMealRequest() {
   
    throw UnimplementedError();
  }

  @override
  getChef() {
    
    throw UnimplementedError();
  }

  @override
  getMeal() {
    
    throw UnimplementedError();
  }

  @override
  logOut() {
    
    throw UnimplementedError();
  }

  @override
  signIn() {
    
    throw UnimplementedError();
  }

}