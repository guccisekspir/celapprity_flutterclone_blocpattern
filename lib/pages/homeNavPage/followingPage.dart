import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selapprity/bloc/userBloc/bloc.dart';
import 'package:selapprity/models/user.dart';

class FollowingPage extends StatefulWidget {
  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);
    return BlocBuilder(
        bloc: _userBloc,
        // ignore: missing_return
        builder: (context, UserState state) {
          if (state is UserLoadedState) {
            List<User> gelen = state.user;
            return SingleChildScrollView(
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(60)),
                    padding: EdgeInsets.all(0),
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: gelen.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.2,
                            mainAxisSpacing: 0,
                            crossAxisCount: 1),
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                        image: NetworkImage(gelen[index].image),
                                        fit: BoxFit.fill)),
                              ),
                              Text(
                                gelen[index].firstName,
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.start,
                                textDirection: TextDirection.ltr,
                              )
                            ],
                          );
                        })));
          } else if (state is UserLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is InitialUserState) {
            _userBloc.add(FetchFollowing());
          } else if (state is UserErrorState) {

            return Center(child: RaisedButton(
              color: Colors.deepPurpleAccent,
              child: Text("Tekrar Dene...."),
              onPressed: (){
                _userBloc.add(FetchFollowing());
              },
            ),);
            debugPrint("Error statee girdim");

          }
          return Center(child: Text("Normalde buraya girmemen gerek ama sen bilirsin ... :-( "),);
        });
  }
}
