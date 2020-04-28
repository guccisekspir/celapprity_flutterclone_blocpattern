import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:selapprity/bloc/navBarBloc.dart';
import 'package:selapprity/pages/hommePage.dart';
import 'package:selapprity/pages/messagePage.dart';
import 'package:selapprity/pages/notificationPage.dart';
import 'package:selapprity/pages/profilePage.dart';
import 'package:selapprity/pages/searchPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BottomNavBarBloc _bottomNavBarBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bottomNavBarBloc = BottomNavBarBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bottomNavBarBloc.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    GlobalKey _curvedKey = GlobalKey();
    return Scaffold(
      body: StreamBuilder(   //bloc yapımızı seçimlerden haberdar etmek
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        // ignore: missing_return
        builder: (BuildContext context,AsyncSnapshot<NavBarItem> snapshot){
          switch(snapshot.data){
            case NavBarItem.PROFILE:
              return ProfilePage();
            case NavBarItem.NOTIFICATION:
              return NotificationPage();
            case NavBarItem.MESSAGE:
              return MessagePage();
            case NavBarItem.SEARCH:
              return SearchPage();
            case NavBarItem.HOME:
              return Homepage();
          }

        },
      ),
      bottomNavigationBar: SafeArea( //BottomNavBar'ı telefon ui'ı engellememesi için
        child: StreamBuilder(  //blocdaki streami dinlemek
          stream: _bottomNavBarBloc.itemStream,
          initialData: _bottomNavBarBloc.defaultItem,
          builder: (context, snapshot) {
            return CurvedNavigationBar(
              key: _curvedKey,
              index: 0,
              height: 50.0,
              items: <Widget>[
                Icon(LineIcons.home,color: Colors.deepPurple, size: 30),
                Icon(LineIcons.search,color: Colors.deepPurple, size: 30),
                Icon(LineIcons.wechat,color: Colors.deepPurple, size: 30),
                Icon(LineIcons.bell,color: Colors.deepPurple, size: 30),
                Icon(LineIcons.user,color: Colors.deepPurple, size: 30),
              ],
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.deepPurpleAccent,
              onTap: (index){
                _bottomNavBarBloc.pickItem(index);
              },
            );
          }
        ),
      ),
    );
  }
}
