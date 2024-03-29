import 'package:quotes/headers.dart';
import '../pages/edit_page/edit_page.dart';
import '../pages/home_page/home_page.dart';
import '../pages/splesh_page/splesh_page.dart';

class AppRoutes {
  static String spleshScreen = '/';
  static String homePage = 'home_page';
  static String editPage = 'edit_page';

  static Map<String, WidgetBuilder> routes = {
    spleshScreen: (context) => const SpleshScreen(),
    homePage: (context) => const HomePage(),
    editPage: (context) => const EditPage(),
  };
}
