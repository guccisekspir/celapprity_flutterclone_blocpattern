import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

}

class FetchDiscover extends UserEvent{ // TODO: Fetch Discover Yapılacak
  @override
  // TODO: implement props
  List<Object> get props => null;
}


class FetchFollowing extends UserEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FetchCategories extends UserEvent{
  final List categories;
  FetchCategories({@required this.categories});
  @override
  // TODO: implement props
  List<Object> get props => [categories];

}