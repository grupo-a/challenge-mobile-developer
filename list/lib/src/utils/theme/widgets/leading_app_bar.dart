import 'package:flutter/material.dart';

class LeadingAppBar extends StatelessWidget {
  const LeadingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 32,
        width: 32,
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
        child: const RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.arrow_downward,
              color: Colors.white,
              size: 16,
            )),
      ),
    );
  }
}
