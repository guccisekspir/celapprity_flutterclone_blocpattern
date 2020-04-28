import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:selapprity/data/user_Repository.dart';
import 'package:selapprity/models/user.dart';
import './bloc.dart';
import 'package:selapprity/locator.dart';


class UserBloc extends Bloc<UserEvent, UserState> {
  final userRepository= getIt<UserRepository>();
  @override
  UserState get initialState => InitialUserState();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if(event is FetchDiscover){
      yield UserLoadingState();
      try{
        List<User> user=await userRepository.getMostPopular();
        List<User> user2=await userRepository.getQuickResponse();

        yield UserLoadedState(user:user,quicKuser: user2);

      }catch(_){
        debugPrint(_.toString());
        yield UserErrorState();
      }

    }
    else if(event is FetchFollowing){
      yield UserLoadingState();
      try{
        List<User> user=await userRepository.getFollowing();

        yield UserLoadedState(user:user);

      }catch(_){
        debugPrint(_.toString());
        yield UserErrorState();
      }


    }

    else if(event is FetchCategories){
      yield UserLoadingState();
      try{
        List<List<User>> user=await userRepository.getCategories(event.categories);

        yield UserLoadedState(categoriesUser: user);

      }catch(_){
        debugPrint(_.toString());
        yield UserErrorState();
      }


    }

  }
}
