import 'package:quotes/headers.dart';

AppBar appbar({required String title}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.black,
      ),
    ),
    backgroundColor: Colors.white.withOpacity(0.6),
  );
}
