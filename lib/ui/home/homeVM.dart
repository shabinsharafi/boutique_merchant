// import 'package:flutter/cupertino.dart';
// import 'package:boutique_merchant/api/userApi.dart';
//
// class HomeScreenViewModel with ChangeNotifier {
//   DataResponse categoryResponse;
//   DataResponse carouselResponse;
//   DataResponse newlyAddedResponse;
//   DataResponse mostLikedResponse;
//   bool isCategoryLoading = false;
//   bool isCarouselLoading = false;
//   bool isNewlyAddedLoading = false;
//   bool isMostLikedLoading = false;
//
//   void getCategories() async {
//     isCategoryLoading = true;
//     notifyListeners();
//     DataResponse dataResponse = await CategoryApi.getInstance().getCategories();
//     categoryResponse = dataResponse;
//     isCategoryLoading = false;
//     notifyListeners();
//   }
//   void getCarousel() async {
//     isCarouselLoading = true;
//     notifyListeners();
//     DataResponse dataResponse = await CategoryApi.getInstance().getCarousel();
//     carouselResponse = dataResponse;
//     isCarouselLoading = false;
//     notifyListeners();
//   }
//
//   void getNewlyAddedPets() async {
//     isNewlyAddedLoading = true;
//     notifyListeners();
//     newlyAddedResponse =
//     await PetsApi.getInstance().getNewlyAddedPets();
//     isNewlyAddedLoading = false;
//     notifyListeners();
//   }
//   void getMostLikedPets() async {
//     isMostLikedLoading = true;
//     notifyListeners();
//     mostLikedResponse =
//     await PetsApi.getInstance().getMostLikedPets();
//     isMostLikedLoading = false;
//     notifyListeners();
//   }
// }
