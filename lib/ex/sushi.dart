import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Sushi extends StatelessWidget {
  const Sushi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                buildHeader(context),
                SizedBox(
                  height: 40,
                ),
                buildBody(context),
                SizedBox(
                  height: 40,
                ),
                buildFooter(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ],
    );
  }

  buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildBodyTitle(context),
        SizedBox(
          height: 10,
        ),
        buildBodySubTitle(context),
        SizedBox(
          height: 20,
        ),
        buildBodyContent(context),
      ],
    );
  }

  buildBodyMainItem(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
          color: Color.fromRGBO(80, 196, 252, 1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 169, 230, 255),
              offset: Offset(0, 10),
            )
          ]),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Column(
              children: [
                Image.asset("assets/images/sushi/1.png"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Yoshimasa SuShi",
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 15),
                        Icon(Icons.star, color: Colors.white, size: 15),
                        Icon(Icons.star, color: Colors.white, size: 15),
                        Icon(Icons.star, color: Colors.white, size: 15),
                        Icon(Icons.star, color: Colors.white, size: 15),
                        Text(
                          "250 rating",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem Ipsum is simply dummy ",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Text(
                          "text of the printing ",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildBodySubItem(image, name, color, boxshadow) {
    return Container(
      height: 140,
      width: 100,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: boxshadow,
              offset: Offset(0, 10),
            )
          ]),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            Column(
              children: [
                Image.asset(image),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 10),
                        Icon(Icons.star, color: Colors.white, size: 10),
                        Icon(Icons.star, color: Colors.white, size: 10),
                        Icon(Icons.star, color: Colors.white, size: 10),
                        Icon(Icons.star, color: Colors.white, size: 10),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildBodyContent(BuildContext context) {
    return Row(
      children: [
        buildBodyMainItem(context),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBodySubItem(
              "assets/images/sushi/2.png",
              "Yoshimasa SuShi",
              Colors.green,
              Color.fromARGB(255, 97, 221, 148),
            ),
            SizedBox(
              height: 20,
            ),
            buildBodySubItem(
                "assets/images/sushi/3.png",
                "Prato sushi",
                Color.fromARGB(255, 68, 67, 69),
                Color.fromARGB(255, 173, 172, 173)),
          ],
        )
      ],
    );
  }

  buildBodySubTitle(BuildContext context) {
    return Text(
      "Find out what's cookings today!",
      style: TextStyle(color: Colors.grey),
    );
  }

  buildBodyTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Today's Special",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 15),
                      color: Color.fromARGB(255, 97, 221, 148),
                      spreadRadius: -9)
                ],
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 25, vertical: 15)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.green),
                    ))),
                onPressed: () {},
                child: Row(children: [
                  Icon(Icons.shopping_cart_checkout_outlined),
                  Text('Cart')
                ]),
              ),
            )
          ],
        )
      ],
    );
  }

  buildFooter(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [
            Text(
              "Places",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 200,
              height: 20,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: [
            buildItemFooter("Sushi Den"),
            SizedBox(
              height: 30,
            ),
            buildItemFooter("Hatsuhana Sushi")
          ],
        )
      ]),
    );
  }

  buildItemFooter(name) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/sushi/4.png"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 10),
                  Icon(Icons.star, color: Colors.yellow, size: 10),
                  Icon(Icons.star, color: Colors.yellow, size: 10),
                  Icon(Icons.star, color: Colors.yellow, size: 10),
                  Icon(Icons.star, color: Colors.yellow, size: 10),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lorem Ipsum is simply dummy ",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  Text(
                    "text of the printing ",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  )
                ],
              )
            ],
          ),
          TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.green),
                ))),
            onPressed: () {},
            child: Row(children: [
              Text(
                'Order now',
                style: TextStyle(fontSize: 10),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
