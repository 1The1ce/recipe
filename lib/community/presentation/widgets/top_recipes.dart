import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/community/presentation/manager/community_view_model.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/core/utils/date_formatter.dart';

import '../../../core/routing/routes.dart';

class TopRecipes extends StatelessWidget {
  const TopRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CommunityViewModel>();
    final topRecipes = vm.topRecipes;

    if (topRecipes.isEmpty) {
      return Center(
        child: Text(
          "No top recipes available",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
      itemCount: topRecipes.length,
      itemBuilder: (context, index) {
        final vm = context.watch<CommunityViewModel>();
        final recipe = topRecipes[index];

        return Column(
          children: [
            GestureDetector(
              onTap: () => context.push('${Routes.recipeDetail}/${vm.topRecipes[index].id}'),
              child: Container(
                width: 356.w,
                height: 319.h,
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.network(
                            recipe.user.profilePhoto,
                            height: 35,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "@${recipe.user.username}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins"),
                            ),
                            Text(
                              formatDate(recipe.created),
                              style: TextStyle(
                                  color: AppColors.redPinkMain,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 365.w,
                          height: 250.h,
                          decoration: BoxDecoration(
                            color: AppColors.redPinkMain,
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                          child: Image.network(
                            recipe.photo,
                            width: 356.w,
                            height: 173.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 173,
                          left: 15,
                          right: 15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        recipe.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      SvgPicture.asset(
                                        "assets/icons/star.svg",
                                        height: 10,
                                        color: Colors.white,
                                      ),
                                      Text(recipe.rating.toString()),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 258.w,
                                    child: Text(
                                      recipe.description,
                                      softWrap: true,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: "Poppins"),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/clock.svg",
                                        color: Colors.white,
                                        height: 10,
                                      ),
                                      Text("${recipe.timeRequired} min"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(recipe.reviewsCount.toString()),
                                      SvgPicture.asset("assets/icons/comment.svg")
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(color: AppColors.redPinkMain),
          ],
        );
      },
    );
  }
}
