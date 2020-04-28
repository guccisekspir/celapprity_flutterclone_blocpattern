import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selapprity/bloc/userBloc/bloc.dart';
import 'package:selapprity/pages/homeNavPage/explorePage.dart';
import 'package:selapprity/pages/homeNavPage/followingPage.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(

      length: 3,
      child: Column(
        children: <Widget>[
          SafeArea(child: FlutterLogo(size: 70,)),
          Expanded(
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/14), // here the desired height

                child: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white10,
                  bottom: TabBar(

                    tabs: [
                      Tab(child: Text("Keşfet",style: TextStyle(color: Colors.black),),),
                      Tab(child: Text("Takiplerim",style: TextStyle(color: Colors.black)),),
                      Tab(child: Text("Kategoriler",style: TextStyle(color: Colors.black))),
                    ],
                  ),
                ),
              ),
              body: BlocProvider(
                create: (context)=> UserBloc(),
                child: TabBarView(
                  children: [
                    ExplorePage(),
                    FollowingPage(),
                    Icon(Icons.directions_bike),
                  ],
                ),
              ),

            ),
          ),


        ],
      ),
    );
  }
}

