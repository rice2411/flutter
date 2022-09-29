import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> images = [
    "assets/images/sushi/1.png",
    "assets/images/sushi/2.png",
    "assets/images/sushi/3.png",
    "assets/images/sushi/4.png",
  ];
  bool isGrid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              buildTitle(context),
              buildWelcome(context),
              SizedBox(
                height: 20,
              ),
              buildSearch(context),
              SizedBox(
                height: 40,
              ),
              buildSavedPlace(context),
              SizedBox(
                height: 10,
              ),
              isGrid ? buildGrid(context) : buildList(context),
            ],
          ),
        ),
      ),
    );
  }

  buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.extension),
        )
      ],
    );
  }

  buildWelcome(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome,",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Text(
              "hisushiya",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.normal),
            )
          ],
        )
      ],
    );
  }

  buildSearch(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all((Radius.circular(10))))),
    );
  }

  changeView(bool value) {
    setState(() {
      isGrid = value;
    });
  }

  buildSavedPlace(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Save places",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  changeView(true);
                },
                icon: Icon(Icons.grid_view_sharp)),
            IconButton(
                onPressed: () {
                  changeView(false);
                },
                icon: Icon(Icons.list_alt_sharp)),
          ],
        ),
      ],
    );
  }

  buildGrid(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          ...images.map((e) {
            return Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage(e), fit: BoxFit.cover),
              ),
            );
          }).toList()
        ],
      ),
    );
  }

  buildList(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ...images.map((e) {
            return Container(
              height: 200,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage(e), fit: BoxFit.cover),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
