// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../theme_app.dart';

class SearchFieldAppWidget extends StatelessWidget {
  final VoidCallback search;
  final TextEditingController controller;
  const SearchFieldAppWidget({
    super.key,
    required this.search,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: theme.primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      textInputAction: TextInputAction.search,
      textAlignVertical: TextAlignVertical.center,
      onEditingComplete: () {
        search();
      },
      onFieldSubmitted: (_) {
        search();
      },
      decoration: InputDecoration(
        fillColor: Colors.lightBlue,
        filled: true,
        hintText: 'Digite e pesquise',
        contentPadding: EdgeInsets.zero,
        prefixIcon: SizedBox(
          height: 16,
          child: Icon(
            Icons.search,
            color: theme.primaryColor,
          ),
        ),
        hintStyle: TextStyle(
          color: theme.primaryColor.withOpacity(.5),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
