import 'package:quotes/headers.dart';

Widget List_View() {
  return Expanded(
    flex: 12,
    child: ListView.builder(
      itemCount: allQuotes.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ExpansionTile(
          title: Text(
            allQuotes[index].quote,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          children: [
            Text("Author : ${allQuotes[index].author}"),
            const SizedBox(
              height: 5,
            ),
            Text("Category : ${allQuotes[index].category}"),
          ],
        ),
      ),
    ),
  );
}
