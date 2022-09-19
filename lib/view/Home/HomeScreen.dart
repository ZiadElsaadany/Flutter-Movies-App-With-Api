import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/view/browse/browse_screen.dart';
import 'package:movies_app/view/main_movies/popular/popular_screen.dart';
import 'package:movies_app/view/search/movies_search.dart';
import 'package:movies_app/view/search/search_screen.dart';
import 'package:movies_app/view/watch_list/watch_list.dart';
import 'package:provider/provider.dart';import
'../movie_details/movie_details_screen.dart';
import '../search/movie_test_search.dart';

class FirstScreen extends StatefulWidget {
  static const String route_name = 'FirstScreen';

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}
 
class _FirstScreenState extends State<FirstScreen> {
  List<Widget>  screens = [MainScreen(),const MovieTestSearch(), BrowseScreen(),const WatchList()] ;
   @override
  void initState() {
    Provider.of<ApiManager>(context,listen: false).getPopularMovies(1);
    Provider.of<ApiManager>(context,listen: false).getTopRatedMovies(1);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff121312) ,
      body : screens[Provider.of<ApiManager>(context).currentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          backgroundColor: const Color(0xff1A1A1A),
        selectedIconTheme: const IconThemeData(
          color: Color(0xffFFBB3B),
        ),
        selectedItemColor: const Color(0xffFFBB3B),
        onTap: (index){
      setState(() {
        if(index ==1 )
          Provider.of<ApiManager>(context,listen: false).resultsSearch = [] ;
        Provider.of<ApiManager>(context,listen: false).currentIndex = index ;
      });
        },
        items:  const [
          BottomNavigationBarItem(
              icon:Icon(Icons.home ,color: Colors.white),
              label: 'Home',
            activeIcon: Icon(Icons.home ,color: Color(0xffFFBB3B),),
            backgroundColor: Colors.black
   ) ,
          BottomNavigationBarItem(
              icon: Icon ( Icons.search  ,color: Colors.white),
              label: 'SEARCH',
            activeIcon: Icon(Icons.search ,color: Color(0xffFFBB3B),),
              backgroundColor: Colors.black

          ) ,
          BottomNavigationBarItem(
              icon:Icon(Icons.movie_creation ,color: Colors.white),
              label: 'BROWSE'
,            activeIcon: Icon(Icons.movie_creation ,color: Color(0xffFFBB3B),),
              backgroundColor: Colors.black

          ) ,
          BottomNavigationBarItem(
              icon:Icon(Icons.watch_later_outlined ,color: Colors.white),
              label: 'WATCHLIST',
            activeIcon: Icon(Icons.watch_later_outlined  ,color: Color(0xffFFBB3B),),

              backgroundColor: Colors.black

          ) ,
        ],
        currentIndex: Provider.of<ApiManager>(context).currentIndex,
        unselectedLabelStyle: const TextStyle(
          fontSize:20
        ),
        selectedLabelStyle: const TextStyle(
            fontSize:10
        ),
      ),
    );
  }
}
