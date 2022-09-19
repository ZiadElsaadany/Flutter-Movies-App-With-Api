import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:provider/provider.dart';

import '../../../model/popular/Results.dart';
import '../../movie_details/movie_details_screen.dart';

class TopRatedWidget extends StatefulWidget {
  String img;
  Results resultss;
  final bool check;

  TopRatedWidget(this.img, this.resultss, [this.check = false]);

  @override
  State<TopRatedWidget> createState() => _TopRatedWidgetState();
}

class _TopRatedWidgetState extends State<TopRatedWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiManager>(builder: (context, provider, _) {
      return Stack(
        alignment: Alignment.topLeft,
        children: [
          GestureDetector(
            onTap: () {
              if(!widget.check){
                Navigator.pop(context);
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailsView(
                    widget.resultss.id!.toInt(),
                  ),
                ),
              );
            },
            child: FadeInImage.assetNetwork(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              fit: BoxFit.fill,
              placeholder: 'assets/loadingPicture.jpg',
              image: widget.img,
              imageErrorBuilder: (c, e, r) => Image.asset(
                'assets/loadingPicture.jpg',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.fill,
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                print(widget.resultss.checkWatchOrnot);
                if (widget.resultss.checkWatchOrnot == false) {
                  Provider.of<ApiManager>(context, listen: false)
                      .getWatchList(widget.resultss);
                }
                widget.resultss.checkWatchOrnot = true;
                print(widget.resultss.checkWatchOrnot);
                setState(() {});
              },
              child: Stack(
                children: [
                  Image(
                    image: AssetImage(widget.resultss.checkWatchOrnot == false
                        ? 'assets/image/Group24.png'
                        : 'assets/image/drawable-xxxhdpi/Icon awesome-bookmark.png'),
                    height: 35,
                  ),
                  Icon(
                    widget.resultss.checkWatchOrnot == true
                        ? Icons.check
                        : null,
                    color: Colors.white,
                  ),
                ],
              ))
        ],
      );
    });
  }
}
