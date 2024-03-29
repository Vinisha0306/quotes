import 'package:quotes/headers.dart';
import 'package:quotes/pages/app_bar.dart';

import '../../modals/quote_modal.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

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
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
