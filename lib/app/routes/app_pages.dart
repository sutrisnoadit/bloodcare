import 'package:get/get.dart';

import '../modules/bloodsearch/bindings/bloodsearch_binding.dart';
import '../modules/bloodsearch/views/bloodsearch_view.dart';
import '../modules/detailDonateur/bindings/detail_donateur_binding.dart';
import '../modules/detailDonateur/views/detail_donateur_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/more/bindings/more_binding.dart';
import '../modules/more/views/more_view.dart';
import '../modules/onboard/bindings/onboard_binding.dart';
import '../modules/onboard/views/onboard_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARD,
      page: () => OnboardView(),
      binding: OnboardBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.MORE,
      page: () => const MoreView(),
      binding: MoreBinding(),
    ),
    GetPage(
      name: _Paths.BLOODSEARCH,
      page: () => const BloodsearchView(),
      binding: BloodsearchBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_DONATEUR,
      page: () => const DetailDonateurView(),
      binding: DetailDonateurBinding(),
    ),
  ];
}
