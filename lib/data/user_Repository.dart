import 'package:selapprity/data/userApiClient.dart';
import 'package:selapprity/locator.dart';
import 'package:selapprity/models/user.dart';


class UserRepository{
  UserApiClient userApiClient= getIt<UserApiClient>();

  Future<List<User>> getMostPopular()async{

    return await userApiClient.getMostPopular();

  }
  Future<List<User>> getQuickResponse()async{

    return await userApiClient.getQuickResponse();

  }

  Future<List<User>> getFollowing()async{

    return await userApiClient.getFollowing();

  }
  Future<List<List<User>>> getCategories(List categories)async{  //Kategoriye göre sıralanmış listenin içindeki userları döndüren fonksiyon
    return await userApiClient.getCategories(categories);
  }

  //Future<List<User>> fetchUsers(String fetchBrand)async{
  //  return await userApiClient.fetchUsers(fetchBrand);
  //}

}