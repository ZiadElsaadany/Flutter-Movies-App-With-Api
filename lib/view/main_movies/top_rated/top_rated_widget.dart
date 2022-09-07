import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:provider/provider.dart';

class TopRatedWidget extends StatelessWidget {
  String img ;
  TopRatedWidget(this.img);
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiManager>(builder: (context, provider, _) {
      return Stack(
        alignment: Alignment.topLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.assetNetwork(
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: 'assets/linkedinPicture2.jpg',
              image: img,
            ),
          ),
         const Image(image: AssetImage('assets/image/Group24.png'),height: 40,)
        ],
      );
    });
  }
}
