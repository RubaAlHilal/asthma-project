import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key, required this.title, required this.subtitle, this.icon});
  final String title;
  final String subtitle;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorPaltte().white,
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: ColorPaltte().darkBlue,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: ColorPaltte().darkBlue,
          ),
        ),
        leading: Icon(icon),
      ),
    );
  }
}
