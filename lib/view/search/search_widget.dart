import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/popular/Popular_movies.dart';
import 'package:movies_app/view/movie_details/movie_details_screen.dart';

class SearchView extends StatelessWidget {
   final String img ;
   final String title ;
   final String date ;
   final String content ;
   final int id;
 SearchView({
     required this.img,
     required this.title,
     required this.date,
     required this.content,
     required this.id,

});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.2,
      child: SizedBox(
        child: Row(
          children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: GestureDetector(
               onTap: ( ) {

                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                 MovieDetailsView(id)
                 )) ;

               },
              child: FadeInImage.assetNetwork(
                width: MediaQuery.of(context).size.width*0.4,
                fit: BoxFit.cover,
                placeholder: 'assets/loadingPicture.jpg',
                image:
                'https://www.themoviedb.org/t/p/w600_and_h900_bestv2'
                    '${img ?? ''}',
                imageErrorBuilder: (x,c,v)=>Image.asset('assets/loadingPicture.jpg',fit: BoxFit.fill,),
              ),
            ),
          ),
            const SizedBox(width: 20,),
            Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: const TextStyle(color: Colors.white,fontSize: 18),
                  maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5,),
                  Text(date,style: const TextStyle(color: Colors.grey,fontSize: 18)),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      const Icon(Icons.star,color: Colors.yellow,),
                      const SizedBox(width: 10,),
                      Text(content,style: const TextStyle(color: Colors.grey,fontSize: 18),
                      maxLines: 3,overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ],
              ),
        )
          ],
        ),
      ),
    );
  }
}
