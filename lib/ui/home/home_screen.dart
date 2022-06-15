// import 'dart:convert';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:boutique_merchant/api/remote_config_service.dart';
// import 'package:boutique_merchant/configuration.dart';
// import 'package:boutique_merchant/utilities.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:loader_overlay/loader_overlay.dart';
//
// import 'mostLikedPets.dart';
//
// class HomeScreen extends StatefulWidget {
//   HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   double xOffset = 0;
//   double yOffset = 0;
//   double scaleFactor = 1;
//   bool showDrawer = false;
//
//   int _current = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     /*Provider.of<HomeScreenViewModel>(context, listen: false).getCarousel();
//     Provider.of<HomeScreenViewModel>(context, listen: false).getCategories();
//     Provider.of<HomeScreenViewModel>(context, listen: false).getMostLikedPets();
//     Provider.of<HomeScreenViewModel>(context, listen: false)
//         .getNewlyAddedPets();*/
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     return WillPopScope(
//       onWillPop: onBackPressed, child: Container(),
//       /*child: Consumer<HomeScreenViewModel>(builder: (context, value, child) {
//         return GestureDetector(
//           onTap: () {
//             if (showDrawer) {
//               setState(() {
//                 xOffset = 0;
//                 yOffset = 0;
//                 scaleFactor = 1;
//                 showDrawer = false;
//               });
//             }
//           },
//           child: AnimatedContainer(
//             duration: Duration(
//               milliseconds: 250,
//             ),
//             transform: Matrix4.translationValues(xOffset, yOffset, 0)
//               ..scale(scaleFactor)
//               ..rotateY(showDrawer ? -0.2 : 0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: showDrawer
//                   ? BorderRadius.circular(40)
//                   : BorderRadius.circular(0),
//             ),
//             child: Container(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           IconButton(
//                               icon: showDrawer
//                                   ? Icon(CupertinoIcons.chevron_left)
//                                   : Icon(Icons.menu),
//                               onPressed: () {
//                                 setState(() {
//                                   if (!showDrawer) {
//                                     xOffset = size.width * 0.6; //280;
//                                     yOffset = size.height / 5;
//                                     scaleFactor = 0.6;
//                                     showDrawer = true;
//                                   } else {
//                                     xOffset = 0;
//                                     yOffset = 0;
//                                     scaleFactor = 1;
//                                     showDrawer = false;
//                                   }
//                                 });
//                               }),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Location',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w300,
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.location_pin,
//                                     color: primaryGreen,
//                                     size: 16,
//                                   ),
//                                   // Text('Hello'),
//                                   RichText(
//                                     text: TextSpan(
//                                         text: 'Delhi, ',
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.bold),
//                                         children: [
//                                           TextSpan(
//                                             text: 'India',
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.normal,
//                                               fontSize: 16,
//                                             ),
//                                           ),
//                                         ]),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           CircleAvatar(
//                             backgroundImage: AssetImage('images/profile.jpg'),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     SearchBar(onTap: () {
//                       showProgress();
//                       // hideProgress();
//                     }),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     if (value.isCarouselLoading)
//                       Shimmer.fromColors(
//                         child: Container(
//                           height: 120,
//                           color: Colors.black54,
//                         ),
//                         baseColor: Colors.grey[200],
//                         highlightColor: Colors.grey[300],
//                       )
//                     else
//                       carousel(value.carouselResponse.data),
//                     if (value.isCategoryLoading)
//                       Shimmer.fromColors(
//                         child: getPetCategoriesShimmer(),
//                         baseColor: Colors.grey[200],
//                         highlightColor: Colors.grey[300],
//                       )
//                     else
//                       PetCategories(value.categoryResponse.data),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     Container(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: NewlyAddedPetsWidget(value)),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: MostLikedPetsWidget(value))
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       }),*/
//     );
//   }
//
//   @override
//   void showProgress() {
//     //Utilities.showToast(context, "message");
//     context.loaderOverlay.show();
//   }
//
//   @override
//   void hideProgress() {
//     // Navigator.of(context, rootNavigator: false).pop();
//     context.loaderOverlay.hide();
//   }
//
//   carousel(List value) {
//     return Stack(
//       children: [
//         Container(
//           //height: 100,
//           //color: Colors.red,
//           child: CarouselSlider(
//             items: value.map<Widget>((dat) => banner(dat)).toList(),
//             options: CarouselOptions(
//                 viewportFraction: 1,
//                 height: 120,
//                 autoPlay: true,
//                 autoPlayInterval: Duration(seconds: 5),
//                 onPageChanged: (value, ab) {
//                   // print(value);
//                   //_current=value;
//                   setState(() {
//                     _current = value;
//                   });
//                 }),
//           ),
//         ),
//         Positioned(
//           right: 0,
//           left: 0,
//           bottom: 5,
//           child: Center(
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.black38,
//                   borderRadius: BorderRadius.circular(5)),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: getIndicatorList(value),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget indicatorDot(int position) {
//     return Container(
//       width: 6.0,
//       height: 6.0,
//       margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4),
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: _current == position ? Colors.white : Colors.white60,
//       ),
//     );
//   }
//
//   List<Widget> getIndicatorList(value) {
//     List<Widget> indicators = List<Widget>();
//     for (int i = 0; i < value.length; i++) {
//       indicators.add(indicatorDot(i));
//     }
//     return indicators;
//   }
//
//   Future<bool> onBackPressed() {
//     if (showDrawer) {
//       setState(() {
//         xOffset = 0;
//         yOffset = 0;
//         scaleFactor = 1;
//         showDrawer = false;
//       });
//       return Future.value(false);
//     } else {
//       return Future.value(true);
//     }
//   }
//
//   banner(Map<String, dynamic> data) {
//     return Container(
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(8.0),
//         child: CachedNetworkImage(
//           imageUrl: data["image"],
//           placeholder: (context, url) => Image.asset(
//             "assets/dog.png",
//           ),
//           fit: BoxFit.cover,
//         ),
//       ),
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.symmetric(horizontal: 20),
//     );
//   }
// }
