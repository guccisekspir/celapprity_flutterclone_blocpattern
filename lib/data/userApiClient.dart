import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:selapprity/models/user.dart';

class UserApiClient {
  static const baseUrl = "http://apistage.celapprityapp.com/api/Discover";
  final http.Client httpClient = http.Client();
  String accesstoken="";
  Future<List<User>> getMostPopular() async {
    final mostPopularUrl = baseUrl +
        "/readMostPopular?access_token=$accesstoken";
    final response = await httpClient.get(mostPopularUrl);
    if (response.statusCode != 200) {
      throw Exception("Hava durumu Getirilemedi");
    }
    final gelenJson = jsonDecode(response.body);

    List<User> userList=[];
    int i =0;
    while(i<3){
      userList.add(User.fromJson(gelenJson[i]));
      i++;
    }
     return userList;
  }
  Future<List<User>> getQuickResponse() async {
    final mostPopularUrl = baseUrl +
        "/readQuickResponders?access_token=$accesstoken";
    final response = await httpClient.get(mostPopularUrl);
    if (response.statusCode != 200) {
      throw Exception("Hava durumu Getirilemedi");
    }
    final gelenJson = jsonDecode(response.body);
    var gelenJsonListlenght = gelenJson.toList().length;

    List<User> userList=[];
    int i =0;
    while(i<4){
      userList.add(User.fromJson(gelenJson[i]));
      i++;
    }
    return userList;
  }


  Future<List<User>> getFollowing() async {
    final fetchFollowing = baseUrl +
        "/readQuickResponders?access_token=$accesstoken"; //TODO Followinge göre düzenlenecek
    final response = await httpClient.get(fetchFollowing);
    if (response.statusCode != 200) {
      throw Exception("Hava durumu Getirilemedi");
    }
    final gelenJson = jsonDecode(response.body);
    var gelenJsonListlenght = gelenJson.toList().length;

    List<User> userList=[];
    int i =0;
    while(i<gelenJsonListlenght){
      userList.add(User.fromJson(gelenJson[i]));
      i++;
    }
    return userList;
  }

  Future<List<List<User>>> getCategories(List categories)async{ //TODO kategoriye göre while ile düzenle


  }

  /*Future<List<User>> fetchUsers(String fetchBrand)async{

    final fetchURL= baseUrl+fetchBrand+"?access_token=$accesstoken";
    final response = await httpClient.get(fetchURL);
    if(response.statusCode != 200){
      throw Exception("Hava Durumu Getirilemedi"+response.statusCode.toString());
    }
    final gelenJson= jsonDecode(response.body);
    int gelenJsonLength= gelenJson.toList().length;
    List<User> userList=[];
    int i =0;
    while(i<gelenJsonLength){
      userList.add(User.fromJson(gelenJson[i]));
      i++;
    }
    return userList;

  }*/
}




