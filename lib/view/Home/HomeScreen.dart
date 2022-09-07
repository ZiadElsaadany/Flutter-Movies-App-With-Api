import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/view/main_movies/popular/popular_screen.dart';
import 'package:provider/provider.dart';import
'../movie_details/movie_details_screen.dart';

class FirstScreen extends StatefulWidget {
  static const String route_name = 'FirstScreen';

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}
 
class _FirstScreenState extends State<FirstScreen> {
  List<Widget>  screens = [MainScreen(),MovieDetailsView()] ;
  int currentIndex =0  ;
   @override
  void initState() {
    Provider.of<ApiManager>(context,listen: false).getPopularMovies(1);
    Provider.of<ApiManager>(context,listen: false).getTopRatedMovies(1);
    Provider.of<ApiManager>(context,listen: false).getMoviesDetails(
      278
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff121312) ,
      body : screens[currentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          backgroundColor: const Color(0xff1A1A1A),
        selectedIconTheme: const IconThemeData(
          color: Color(0xffFFBB3B)
        ),
        onTap: (index){
          currentIndex = index ;
      setState(() {  });
        },
        items: const [

          BottomNavigationBarItem(
              icon:Icon(Icons.home ,color: Colors.white),
              label: 'Home',
   ) ,
          BottomNavigationBarItem(
              icon:Icon(Icons.home ,color: Colors.white),
              label: 'Home'

          ) ,
        ],
      ),
    );
  }
}
