import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import 'recipe_icon_button.dart';

class RecipeIconButtonContainer extends StatelessWidget {
  const RecipeIconButtonContainer({
    super.key,
    this.iconColor = AppColors.redPinkMain,
    this.containerColor = AppColors.pink,
    required this.image,
    required this.callback,
    this.iconWidth = 12,
    this.iconHeight = 18,
    this.containerWidth = 28,
    this.containerHeight = 28
  });

  final String image;
  final Color iconColor, containerColor;

  final double iconWidth, iconHeight, containerWidth, containerHeight;

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(90),
      ),
      child: RecipeIconButton(
        image: image,
        width: iconWidth,
        height: iconHeight,
        color: iconColor,
        callback: callback,
      ),
    );
  }
}