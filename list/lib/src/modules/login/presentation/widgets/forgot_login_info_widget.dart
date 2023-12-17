import 'package:flutter/material.dart';

import '../../../../utils/theme/theme_app.dart';

class ForgotLoginInfoWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const ForgotLoginInfoWidget({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: theme.primaryColor,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
