import 'dart:math';
import 'dart:ui';

import 'package:quotes/headers.dart';
import 'package:quotes/modals/quote_modal.dart';
import 'package:quotes/pages/home_page/componets/grid_view.dart';
import 'package:quotes/pages/home_page/componets/list_view.dart';
import '../../utills/quote_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void showRandomQuote() {
    Random r = Random();
    String category = 'art';
    List<Quote> l = allQuotes
        .where(
          (element) => element.category == category,
        )
        .toList();

    Quote q = l[r.nextInt(l.length)];

    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('WelCome !!'),
        contentPadding: const EdgeInsets.all(16),
        children: [
          Text(q.quote),
        ],
      ),
    );
  }

  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        showRandomQuote();
      },
    );
    super.initState();
  }

  bool view = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Home Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              view = !view;
              setState(() {});
            },
            child: view != true
                ? const Icon(
                    Icons.grid_view_outlined,
                    color: Colors.black,
                  )
                : const Icon(
                    Icons.list,
                    color: Colors.black,
                  ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: Colors.white.withOpacity(0.6),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        allCategory.length,
                        (index) => Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            allCategory[index],
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              view != true ? List_View() : Grid_view(),
            ],
          )
        ],
      ),
    );
  }
}
