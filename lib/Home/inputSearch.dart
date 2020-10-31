import 'dart:math';

import 'package:flutter/material.dart';
import 'package:searchpro/Home/button.dart';

class InputLog extends StatefulWidget {
  InputLog({Key key}) : super(key: key);

  @override
  InputLogState createState() => InputLogState();
}

class InputLogState extends State<InputLog> {
  TextEditingController SarchController = TextEditingController();
  FocusNode _focus = FocusNode();
  String proverka;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void ProverkaPading() {
    if (proverka == "true") {
      left = MediaQuery.of(context).size.width * 0.74;
      height = 0.64;
      iconColor = Colors.blueAccent;
      containerColor = Colors.white;
      setState(() {});
    } else if (proverka == "false") {
      left = MediaQuery.of(context).size.width * 0.4;
      height = 0.0;
      iconColor = null;
      containerColor = null;
      setState(() {});
    }
  }

  void _onFocusChange() {
    proverka = _focus.hasFocus.toString();
    ProverkaPading();
  }

//0.6
  double left;
  double height = 0.0;
  Color iconColor = null;
  Color containerColor = null;
  Color containerSearchColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    left = MediaQuery.of(context).size.width * 0.4;
    return inputLogin(
        Icons.search, "что искать", SarchController, false, context);
  }

  Widget inputLogin(IconData icon, String hint,
      TextEditingController controller, bool obsecure, BuildContext context) {
    controller.addListener(() {
      setState(() {
        containerSearchColor = Color.fromRGBO(
            random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      });
    });
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: AnimatedContainer(
            duration: Duration(
              seconds: 4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width * 0.975,
            height: MediaQuery.of(context).size.height * height,
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 16,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 9, left: 10, right: 10),
                    child: Container(
                      color: containerSearchColor,
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3.8,
                ),
              ),
            ),
          ),
        ),
        Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.98,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(width: 2, color: Colors.grey))),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.06,
            child: TextField(
              focusNode: _focus,
              controller: controller,
              obscureText: obsecure,
              style: TextStyle(fontSize: 20, color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(153, 155, 158, 1),
                ),
                hintText: hint,
                //focusedBorder: OutlineInputBorder(
                //borderSide: BorderSide(color: Colors.black, width: 2),
                //),
                //enabledBorder: OutlineInputBorder(
                //borderSide: BorderSide(color: Colors.black, width: 1),
                //),
              ),
            ),
          ),
        ),
        AnimatedPadding(
          duration: Duration(
            seconds: 4,
          ),
          padding: EdgeInsets.only(
            left: left,
            top: MediaQuery.of(context).size.height * 0.005,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.23,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: iconColor,
            ),
            child: Center(
              child: Icon(
                Icons.search,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
