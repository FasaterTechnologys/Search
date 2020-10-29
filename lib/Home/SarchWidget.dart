import 'package:flutter/material.dart';
import 'package:searchpro/Home/inputSearch.dart';

Widget Search(BuildContext context) {
  TextEditingController _SarchController = TextEditingController();
  return Stack(
    children: [
      inputLogin(Icons.search, "что искать", _SarchController, false, context)
    ],
  );
}
