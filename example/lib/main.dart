import 'package:overapped_avatars/overapped_avatars.dart';
import 'package:overapped_avatars/avatar_list_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Overlapped Avatars Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AvatarListLeading leading = AvatarListLeading.tight;
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    var items = expanded
        ? List.generate(49, (index) => index + 1)
        : List.generate(4, (index) => index + 1);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              height: 120,
              child: GestureDetector(
                onTap: () {
                  changeState();
                },
                child: AvatarList(
                  leading: AvatarListLeading.none,
                  avatars: List.generate(49, (index) => index + 1)
                      .map(generateAvatarListItem)
                      .toList(),
                ),
              ),
            ),
            FittedBox(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                height: 120,
                child: GestureDetector(
                  onTap: () {
                    changeState();
                  },
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      AvatarList(
                        leading: AvatarListLeading.tight,
                        avatars: List.generate(4, (index) => index + 1)
                            .map(generateAvatarListItem)
                            .toList(),
                      ),
                      SizedBox(width: 60),
                      Expanded(
                        flex: 0,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '+40',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 120,
                child: AvatarList(
                  leading: expanded
                      ? AvatarListLeading.none
                      : AvatarListLeading.tight,
                  avatars: items.map(generateAvatarListItem).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20.0,
                borderOnForeground: true,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Text(
                          'Buy the milk.',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          '2021-07-16',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          width: double.infinity,
                          height: 40,
                          child: AvatarList(
                            leading: AvatarListLeading.loose,
                            avatars: List.generate(4, (index) => index + 1)
                                .map((index) =>
                                    generateAvatarListItemWithRadius(
                                        index, 20.0))
                                .toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  AvatarListItem generateAvatarListItem(index) {
    var name = index > 9 ? '0$index.jpg' : '00$index.jpg';
    return AvatarListItem(
      imageProvider: AssetImage('images/$name'),
      radius: 50,
    );
  }

  AvatarListItem generateAvatarListItemWithRadius(index, radius) {
    var name = index > 9 ? '0$index.jpg' : '00$index.jpg';
    return AvatarListItem(
      imageProvider: AssetImage('images/$name'),
      radius: radius,
    );
  }

  void changeState() {
    var nextState;

    switch (leading) {
      case AvatarListLeading.tight:
        nextState = AvatarListLeading.none;
        break;
      case AvatarListLeading.none:
        nextState = AvatarListLeading.tight;
        break;
      default:
        break;
    }
    if (nextState != null) {
      setState(() => leading = nextState);
    }
  }
}
