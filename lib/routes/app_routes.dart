import 'package:quotes/headers.dart';
import '../pages/home_page/home_page.dart';
import '../pages/splesh_page/splesh_page.dart';

class AppRoutes {
  static String spleshScreen = '/';
  static String homePage = 'home_page';

  static Map<String, WidgetBuilder> routes = {
    spleshScreen: (context) => SpleshScreen(),
    homePage: (context) => HomePage(),
  };
}
