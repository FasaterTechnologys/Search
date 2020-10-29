import 'package:flutter/material.dart';
import 'package:searchpro/Home/button.dart';

Widget inputLogin(IconData icon, String hint, TextEditingController controller,
    bool obsecure, BuildContext context) {
  bool OnAndOffSearchIcon = false;
  return Padding(
    padding: const EdgeInsets.only(bottom: 70),
    child: Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(width: 2, color: Colors.grey)),
                child: TextField(
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
                    // borderSide: BorderSide(color: Colors.black, width: 2),
                    //),
                    //enabledBorder: OutlineInputBorder(
                    //  borderSide: BorderSide(color: Colors.black, width: 1),
                    // ),
                  ),
                ),
              ),
            ),
            button(),
          ],
        ),
      ],
    ),
  );
}
