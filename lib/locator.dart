import 'package:get_it/get_it.dart';
import 'data/user_Repository.dart';
import 'data/userApiClient.dart';

GetIt getIt= GetIt.instance;


void setupLocator(){
  getIt.registerLazySingleton<UserRepository>(() =>UserRepository());
  getIt.registerLazySingleton<UserApiClient>(() =>UserApiClient());
}