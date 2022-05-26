import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const BasicPage(),
    );
  }
}

class BasicPage extends StatelessWidget {
  const BasicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facebook profile'),
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  "images/cover.jpg",
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white24,
                    child: myProfilePic(68),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "Théo TRUVELOT",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text("Backend developer at OuestIsol",
                      style: TextStyle(
                          color: Colors.grey, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: buttonContainer(
                      text: "Ajouter en amis",
                    ),
                  ),
                  buttonContainer(icon: Icons.message)
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                thickness: 2,
                color: Colors.white24,
              ),
            ),
            sectionTitleText("A propos de moi")
          ],
        ),
      ),
    );
  }

  CircleAvatar myProfilePic(double radius) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: const AssetImage("images/profile.jpg"),
    );
  }

  Container buttonContainer({IconData? icon, String? text}) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.teal,
      ),
      child: (icon == null)
          ? Text(
              text ?? "",
              style: const TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,
            )
          : Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
    );
  }

  Widget sectionTitleText(String text) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }
}
