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
    double wight = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                      Spacer(),
                      Text(
                        "Théo TRUVELOT",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
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
            sectionTitleText("A propos de moi"),
            aboutRow(icon: Icons.work, text: "Ouest Isol"),
            aboutRow(icon: Icons.favorite, text: "En couple"),
            aboutRow(icon: Icons.location_city, text: "Rouen"),
            const Divider(
              thickness: 2,
              color: Colors.white24,
            ),
            sectionTitleText("Mes amis"),
            // ignore: sized_box_for_whitespace
            Container(
              height: height * 0.2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      columnFriend(
                          image: "images/cat.jpg",
                          name: "jean",
                          width: wight / 3),
                      columnFriend(
                          image: "images/sunflower.jpg",
                          name: "jean",
                          width: wight / 3),
                      columnFriend(
                          image: "images/duck.jpg",
                          name: "jean",
                          width: wight / 3),
                      columnFriend(
                          image: "images/cat.jpg",
                          name: "jean",
                          width: wight / 3),
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
      padding: const EdgeInsets.only(top: 5, left: 10, bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }

  Widget aboutRow({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Column columnFriend(
      {required String image, required String name, required double width}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width,
            height: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(name)
      ],
    );
  }
}
