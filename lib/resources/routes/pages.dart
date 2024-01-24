import '../exports/index.dart';

class Pages {
  static Transition get _routeTransition => Transition.rightToLeft;

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Get.routing.args = settings.arguments;
    switch (settings.name) {
      case Routes.OFFLINE:
        return GetPageRoute(
          settings: settings,
          page: () => const OfflineScreen(),
          transition: _routeTransition,
        );
      case Routes.LOGIN:
        return GetPageRoute(
          settings: settings,
          page: () => const Login(),
          binding: LoginBinding(),
          transition: _routeTransition,
        );

      default:
        return null;
    }
  }
}
