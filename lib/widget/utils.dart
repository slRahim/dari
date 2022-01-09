import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> buildDropLanguageDownMenuItems(List listItems) {
  List<DropdownMenuItem<String>> items = [];
  for (String listItem in listItems) {
    items.add(
      DropdownMenuItem(
        child: Text(listItem),
        value: listItem,
      ),
    );
  }
  return items;
}