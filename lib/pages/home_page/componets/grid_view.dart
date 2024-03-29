import 'package:quotes/headers.dart';

Widget Grid_view({required String? category}) {
  List l = [];

  if (category != null) {
    l = allQuotes.where((element) => element.category == category).toList();
  }

  return Expanded(
    flex: 12,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scrollbar(
        thickness: 10,
        interactive: true,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: category == null ? allQuotes.length : l.length,
          itemBuilder: (context, index) => category == null
              ? GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.editPage,
                        arguments: allQuotes[index]);
                  },
                  child: Card(
                    color: Colors.white.withOpacity(0.7),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            allQuotes[index].quote,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            maxLines: 8,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text("- ${allQuotes[index].author}"),
                        ],
                      ),
                    ),
                  ),
                )
              : category == l[index].category
                  ? GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.editPage,
                            arguments: l[index]);
                      },
                      child: Card(
                        color: Colors.white.withOpacity(0.7),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                l[index].quote,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                maxLines: 8,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text("- ${l[index].author}"),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Text(''),
        ),
      ),
    ),
  );
}
