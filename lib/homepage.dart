import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String imageSrc =
      "https://scontent.fdad8-1.fna.fbcdn.net/v/t39.30808-1/301514639_1151141889082789_6721053312374036467_n.jpg?stp=dst-jpg_p320x320&_nc_cat=108&ccb=1-7&_nc_sid=7206a8&_nc_ohc=yLArP5w6-6kAX_GqUaQ&_nc_oc=AQmTSlglsSQmGGFdAq7IHth2imS_IqGjZP_IG7kPvcFCqtu8edqX6BqvtZONYw6IAJQ&_nc_ht=scontent.fdad8-1.fna&oh=00_AT_wNwIeJtj4ZmDKBQjI9dnOyC68V1742df6sErLOhoaVA&oe=631BA391";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Su shi")),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                "Su shi",
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(1000, 255, 0, 0),
                ),
              ),
              Text('su shi'),
              Image.network(imageSrc),
              Image.asset("assets/images/sushi/1.png"),
              Image.asset("assets/images/sushi/1.png"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ignore: avoid_print
          print("su");
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Icon(Icons.home),
      ),
    );
  }
}
