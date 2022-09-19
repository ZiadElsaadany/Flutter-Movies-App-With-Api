import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/view/Home/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  static const String route_name=  'Splash' ;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer ;

  goNext( )=> Navigator.pushReplacementNamed(context,FirstScreen.route_name );

  startDelay(){
    timer=Timer(const Duration(
        milliseconds: 3000
    ), ()=> goNext()
    );
  }
  @override
  void initState() {
    super.initState();
    startDelay()  ;
  }
  @override
  void dispose() {
    timer.cancel() ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3,),
          Center(child: Image.asset('assets/image/movies.png',width: 180,height: 180,)),
          const SizedBox(height: 50,),
          const CircularProgressIndicator(color: Colors.orange),
          const Spacer(flex: 2,),
          const Padding(
            padding: EdgeInsets.only(bottom: 60.0),
            child: Text('Ziad Elsaadany',style:TextStyle(
                color:  Color(0xffFFBB3B) ,
            fontSize: 14,
              fontWeight: FontWeight.bold
            ),),
          )
        ],
      ),
    );
  }
}
