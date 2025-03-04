import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';


class appBarTitle extends StatelessWidget {
  const appBarTitle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Login',
        style: TextStyle(
          color: AppColors.redPinkMain,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    );
  }
}