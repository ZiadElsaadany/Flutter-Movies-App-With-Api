// import 'package:flutter/material.dart';
// import 'package:movies_app/api/api.dart';
// import 'package:movies_app/view/search/movies_search.dart';
// import 'package:provider/provider.dart';
//
// class SearchScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           title: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
//             child: GestureDetector(
//               onTap: () {
//                 showSearch(context: context, delegate: MoviesSearch());
//               },
//               child: Container(
//                 width: double.infinity,
//                 height: MediaQuery.of(context).size.height * 0.06,
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Row(
//                   children: const [
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Icon(
//                       Icons.search,
//                       color: Colors.white,
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text(
//                       'Search',
//                       style: TextStyle(color: Colors.grey, fontSize: 18),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         body: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(
//                 child: Image.asset(
//                   'assets/image/drawable-xxxhdpi/Icon material-local-movies.png',
//                   width: 100,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Text(
//                 'No Movies Found',
//                 style: TextStyle(color: Colors.grey),
//               )
//             ],
//           ),
//         ));
//   }
// }
