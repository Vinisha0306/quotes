import 'package:quotes/headers.dart';
import 'package:quotes/pages/home_page/home_page.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.homePage,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Image(
          image: AssetImage("lib/assets/images/welcome.gif"),
        ),
      ),
    );
  }
}
