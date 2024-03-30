import 'package:quotes/headers.dart';
import 'package:quotes/pages/app_bar.dart';

import '../../modals/quote_modal.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

Color BGC = Colors.white;
Color TC = Colors.black;
double opacity = 1;

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    Quote quote = ModalRoute.of(context)!.settings.arguments as Quote;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Editing',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey.shade200,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      BGC = Colors.white;
                      TC = Colors.black;
                      opacity = 1;
                      setState(() {});
                    },
                    child: const Text(
                      'Reset',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Save',
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: BGC.withOpacity(opacity),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      quote.quote,
                      style: TextStyle(
                        fontSize: 20,
                        wordSpacing: 10,
                        color: TC,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "- ${quote.author}",
                        style: TextStyle(
                          fontSize: 16,
                          color: TC,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Background Color',
                style: TextStyle(fontSize: 18),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      Colors.primaries.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(4),
                        child: GestureDetector(
                          onTap: () {
                            BGC = Colors.primaries[index];
                            setState(() {});
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.primaries[index],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Opacity(Shade)',
                style: TextStyle(fontSize: 18),
              ),
              Slider(
                value: opacity,
                min: 0,
                max: 1,
                onChanged: (val) {
                  opacity = val;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Text Color',
                style: TextStyle(fontSize: 18),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      Colors.primaries.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(4),
                        child: GestureDetector(
                          onTap: () {
                            TC = Colors.primaries[index];
                            setState(() {});
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.primaries[index],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
