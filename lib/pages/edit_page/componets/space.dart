import 'package:quotes/headers.dart';

Widget spacer({required String text}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 10,
      ),
      const Divider(
        color: Colors.black,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
    ],
  );
}
