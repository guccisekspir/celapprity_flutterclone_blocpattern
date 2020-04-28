import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selapprity/bloc/userBloc/bloc.dart';
import 'package:selapprity/widgets/gridViewWidget.dart';

final List<String> imgList = [
  'https://celapprity-bucket.s3.eu-central-1.amazonaws.com/cyGvgDiiwhy7Fee4pb8aFGCnyGJTefKW',
  'https://celapprity-bucket.s3.eu-central-1.amazonaws.com/LDdOEfhuC8fOKEs8RiYxkfSJfFuheluh',
  'https://celapprity-bucket.s3.eu-central-1.amazonaws.com/cyGvgDiiwhy7Fee4pb8aFGCnyGJTefKW',
  'https://celapprity-bucket.s3.eu-central-1.amazonaws.com/LDdOEfhuC8fOKEs8RiYxkfSJfFuheluh',
  'https://celapprity-bucket.s3.eu-central-1.amazonaws.com/cyGvgDiiwhy7Fee4pb8aFGCnyGJTefKW',
  'https://celapprity-bucket.s3.eu-central-1.amazonaws.com/LDdOEfhuC8fOKEs8RiYxkfSJfFuheluh',
];

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final _userBloc = BlocProvider.of<UserBloc>(context);
    return BlocBuilder(
      bloc: _userBloc,
      // ignore: missing_return
      builder: (context, UserState state) {
        if (state is UserLoadedState) {
          var gelen = state.user;
          var quickgelen = state.quicKuser;
          return SingleChildScrollView(
            child: Container(
              child: Column(children: [
                CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.map((url) {
                    int index = imgList.indexOf(url);
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Color.fromRGBO(0, 0, 0, 0.9)
                            : Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "En Popülerler",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.ltr,
                      ),
                    )), //En popülerler
                GridViewWidget(isim: "MostPopular",),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Hızlı Cevap Verenler",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.ltr,
                      ),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(60)),
                    padding: EdgeInsets.all(0),
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
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
                                        image: NetworkImage(
                                            quickgelen[index].image),
                                        fit: BoxFit.fill)),
                              ),
                              Text(
                                quickgelen[index].firstName,
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.start,
                                textDirection: TextDirection.ltr,
                              )
                            ],
                          );
                        })),
              ]),
            ),
          );
        }
        if (state is UserLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserErrorState) {
          return Center(child: RaisedButton(
            color: Colors.deepPurpleAccent,
            child: Text("Tekrar Dene...."),
            onPressed: (){
              _userBloc.add(FetchFollowing());
            },
          ),);
        }
        if (state is InitialUserState) {
          _userBloc.add(FetchDiscover());
          return Center(
            child: Text("yaya"),
          );
        }
      },
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
