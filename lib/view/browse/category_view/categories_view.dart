import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:provider/provider.dart';

import '../../../model/popular/Results.dart';



class CategoriesView extends StatefulWidget {
 final int id;

 CategoriesView({required this.id });
  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
           Provider.of<ApiManager>(context,listen: false).getCategoryList(widget.id);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer<ApiManager>(
        builder: (context,provider,_) {
             if(provider.isLoadingCategoryList==true) {
               return const Center(
                 child: CircularProgressIndicator(
                   color: Colors.orange,
                 ),
               );
             }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20),
            child: ListView.separated(
                itemBuilder: (ctx,index) => SizedBox(
                  height: MediaQuery.of(context).size.height*0.2,
                  child: Row(
                    children: [
                       Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child:  FadeInImage(
                            fit: BoxFit.fill,
                              height: MediaQuery.of(context).size.height*0.18,
                              placeholder:const AssetImage(  'assets/loadingPicture.jpg'),
                              image:const AssetImage( 'assets/linkedinPicture2.jpg' )
                          ),
                        ),
                      ) ,
                      const SizedBox(width: 20,),
                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                     '${provider.resultsCategoryList[index].name}'   ,
                          style:  const TextStyle(
                            color: Colors.white
                          ),
                          ),
                          const SizedBox(height: 8,),
                          Text(
                     '${provider.resultsCategoryList[index].itemCount}'   ,
                          style:  const TextStyle(
                            color: Colors.white
                          ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                separatorBuilder: (ctx,index) => const SizedBox(height: 10,),
                itemCount:provider.resultsCategoryList.length
            ),
          );
        }
      ),
    );
  }
}
