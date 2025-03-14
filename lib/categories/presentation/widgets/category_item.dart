import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';

import '../../data/models/category_model.dart';


class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    this.main = false,
    this.width = 159,
    this.height = 145,
  });

  final CategoryModel category;
  final double width, height;
  final bool main;

  @override
  Widget build(BuildContext context) {
    Widget image = Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image(
          image: NetworkImage(category.image),
          width: width.w,
          height: height.h,
          fit: BoxFit.cover,
        ),
      ),
    );

    Widget title = Text(category.title);
    return GestureDetector(
      onTap: () => context.go(Routes.categoryDetail, extra: category),
      child: Column(
        children: [
          main ? title : image,
          SizedBox(height: 5),
          main ? image : title,
        ],
      ),
    );
  }
}
