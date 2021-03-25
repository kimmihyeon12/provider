import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providermovie/provider/countprovider.dart';
import 'package:providermovie/provider/bottom_provider.dart';
import 'package:providermovie/screen/count_home_widget.dart';
import 'package:providermovie/screen/movie_widget.dart';


class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  CountProvider _countProvider;
  BottomNavigationProvider _bottomNavigationProvider;

  Widget _navigationBody(){
    switch(_bottomNavigationProvider.currentPage){
      case 0:
        return CountHomeWidget();
        break;
      case 1:
        return MovieListWidget();
        break;
    }

    return Container();
  }

  Widget _bottomNavigationBarWidget(){
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Count"),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movie")
      ],
      currentIndex: _bottomNavigationProvider.currentPage,
      selectedItemColor: Colors.red,
      onTap: (index){
        print(index);
        _bottomNavigationProvider.updateCurrentPage(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);
    _countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(), 
    );
  }
}


