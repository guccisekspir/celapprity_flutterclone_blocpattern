import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:selapprity/models/user.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class InitialUserState extends UserState {
  @override
  List<Object> get props => [];
}
class UserLoadingState extends UserState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class UserLoadedState extends UserState{
  final List<User> user;
  final List<User> quicKuser;
  final List<List<User>> categoriesUser;
  UserLoadedState({this.user,this.quicKuser,this.categoriesUser});
  @override
  // TODO: implement props
  List<Object> get props => [user,quicKuser,categoriesUser];
}

class UserErrorState extends UserState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}
