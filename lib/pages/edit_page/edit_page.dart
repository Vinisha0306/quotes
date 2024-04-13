import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes/headers.dart';
import 'package:quotes/pages/edit_page/componets/space.dart';
import 'package:share_extend/share_extend.dart';

import '../../modals/quote_modal.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

GlobalKey widgetKey = GlobalKey();

Future<File> getFileFromWidget() async {
  RenderRepaintBoundary boundary =
      widgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage(
    pixelRatio: 2,
  );
  ByteData? data = await image.toByteData(
    format: ui.ImageByteFormat.png,
  );
  Uint8List list = data!.buffer.asUint8List();

  Directory directory = await getTemporaryDirectory();
  File file = await File(
          "${directory.path}/QA${DateTime.now().millisecondsSinceEpoch}.png")
      .create();
  file.writeAsBytesSync(list);

  return file;
}

Color BGC = Colors.white;
Color TC = Colors.black;
double opacity = 1;
Alignment TA = Alignment.center;
double ts = 14;

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
        child: Column(
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
                  onPressed: () async {
                    ImageGallerySaver.saveFile((await getFileFromWidget()).path,
                            isReturnPathOfIOS: true)
                        .then(
                      (value) =>
                          (value) => ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Saved to gallery !!"),
                                ),
                              ),
                    );
                  },
                  child: const Text(
                    'Save',
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    ShareExtend.share(
                        (await getFileFromWidget()).path, 'image');
                  },
                  icon: const Icon(Icons.share),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RepaintBoundary(
                    key: widgetKey,
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: BGC.withOpacity(opacity),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SingleChildScrollView(
                            child: Text(
                              quote.quote,
                              style: TextStyle(
                                fontSize: ts,
                                wordSpacing: 10,
                                color: TC,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "- ${quote.author}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: TC,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
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
                  spacer(text: 'Opacity(Shade'),
                  Slider(
                    value: opacity,
                    min: 0,
                    max: 1,
                    onChanged: (val) {
                      opacity = val;
                      setState(() {});
                    },
                  ),
                  spacer(text: 'Text Color'),
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
                  Row(
                    children: [
                      const Text(
                        'Text Size',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          ts--;
                          setState(() {});
                        },
                        icon: const Icon(
                          CupertinoIcons.minus_circle_fill,
                        ),
                      ),
                      Text(
                        '${ts.toInt()}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ts++;
                          setState(() {});
                        },
                        icon: const Icon(
                          CupertinoIcons.plus_circle_fill,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
