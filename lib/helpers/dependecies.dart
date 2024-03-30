// import 'package:food_app_part1/Utils/app_constants.dart';
// import 'package:food_app_part1/controllers/cart_controller.dart';
// import 'package:food_app_part1/controllers/popular_product_controller.dart';
// import 'package:food_app_part1/controllers/recommended_product_controller.dart';
// import 'package:food_app_part1/data/api/api_client.dart';
// import 'package:food_app_part1/data/repository/cart_repo.dart';
// import 'package:food_app_part1/data/repository/popular_product_repo.dart';
// import 'package:food_app_part1/data/repository/recommended_product_repo.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// Future<void> init() async {
//   final sharedPreferences = await SharedPreferences.getInstance();

//   Get.lazyPut(() => sharedPreferences);
//   // API client
//   Get.lazyPut(() => Apiclient(
//         appBaseUrl: AppConstants.BASE_URL,
//         token: '',
//       ));

//   // Repositories
//   Get.lazyPut(() => PopularProductRepo(apiclient: Get.find()));
//   Get.lazyPut(() => RecommendedProductRepo(apiclient: Get.find()));
//   Get.lazyPut(() => CartRepo(sharedPreferences:Get.find()));

//   //Controllers
//   Get.lazyPut(() => PopularProductController(
//       popularProductRepo: Get.find<PopularProductRepo>()));
//   Get.lazyPut(
//       () => RecommendedProductController(recommendedProductRepo: Get.find()));
//   Get.lazyPut(() => CartController(cartRepo: Get.find()));
// }
