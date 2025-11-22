import 'package:flutter/material.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({
    super.key,
    required this.dropdownMenuEntries,
    required this.controller,
  });

  final List<DropdownMenuEntry<String>> dropdownMenuEntries;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white),
        errorStyle: TextStyle(color: Colors.red),
        prefixIconColor: Colors.white,
        suffixIconColor: Colors.white,
        floatingLabelStyle: TextStyle(color: Colors.white),
      ),
      dropdownMenuEntries: dropdownMenuEntries,
      width: double.infinity,
      enableSearch: true,
      controller: controller,
      hintText: "Select Device",
    );
  }
}
