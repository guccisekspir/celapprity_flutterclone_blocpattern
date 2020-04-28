import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selapprity/bloc/userBloc/bloc.dart';
import 'package:selapprity/models/user.dart';



class GridViewWidget extends StatelessWidget{
  final String isim;
  bool axisScroll=true;

  GridViewWidget({@required this.isim});



  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc= BlocProvider.of<UserBloc>(context);
    if(isim=="Following") axisScroll=false;
    // TODO: implement build
    return BlocBuilder(
      bloc: _userBloc,
      builder: (context, UserState state){
        if(state is UserLoadedState){
          List<User> gelen;
          if(isim=="MostPopular"|| isim=="Following") gelen= state.user; //MostPopular veya Followingde sadece user olduğu için
          else if(isim=="QuickRead") gelen= state.quicKuser;


          return SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(60)),
                padding: EdgeInsets.all(0),
                child: GridView.builder(
                    scrollDirection: axisScroll?Axis.vertical:Axis.horizontal,
                    itemCount: gelen.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.2,
                        mainAxisSpacing: 0,
                        crossAxisCount: axisScroll?1:3),
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
                    })),
          );
        }
        else return Center(child: Text("Gelmedi"),);


      },

    );
  }


}