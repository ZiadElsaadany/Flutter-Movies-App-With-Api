import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/view/browse/category_view/categories_view.dart';
import 'package:provider/provider.dart';

import '../../model/popular/Results.dart';

class BrowseScreen extends StatefulWidget {


  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {

  @override
  void initState() {
    Provider.of<ApiManager>(context,listen: false).getGenresMovies();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<ApiManager>(
          builder: (context,provider,_) {
            if(provider.genresLoading==true) {
              return const Center(child: CircularProgressIndicator( color: Colors.orange),);
            }
            return
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const  Text('Browse Category',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20,),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2 ,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 2
                      ) ,
                          itemBuilder:(ctx,index){
                         return Padding(
                           padding: const EdgeInsets.all(5.0),
                           child: GestureDetector(
                             onTap: ( )  {
                               provider.resultsCategoryList = [] ;
                              Navigator.push(context, MaterialPageRoute(builder:
                              (ctx) => CategoriesView(
                                  id: provider.genresResults[index].id!.toInt())
                               ));
                             },
                             child: Stack(
                               alignment: Alignment.center,
                               children: [
                                 Image.asset('assets/linkedinPicture2.jpg'),
                                  Text(
                                    '${provider.genresResults[index].name}',
                                    style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize:18),)
                               ],
                             ),
                           ),
                         );
                          } ,
                        itemCount: 19,
            ),
                    ),
                  ],
                );
          }
        ),
      ),
    );
  }
}
