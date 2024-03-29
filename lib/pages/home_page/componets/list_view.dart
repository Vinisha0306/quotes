import 'package:quotes/headers.dart';

Widget List_View({required String? category}) {
  return Expanded(
    flex: 12,
    child: ListView.builder(
      itemCount: allQuotes.length,
      itemBuilder: (context, index) => category == null
          ? GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.editPage,
                    arguments: allQuotes[index]);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      allQuotes[index].quote,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Divider(),
                    Text("Author : ${allQuotes[index].author}"),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("Category : ${allQuotes[index].category}"),
                  ],
                ),
              ),
            )
          : category == allQuotes[index].category
              ? GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.editPage,
                        arguments: allQuotes[index]);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          allQuotes[index].quote,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Divider(),
                        Text("Author : ${allQuotes[index].author}"),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Category : ${allQuotes[index].category}"),
                      ],
                    ),
                  ),
                )
              : Container(),
    ),
  );
}
