import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/core.dart';

class CommunityAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommunityAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size(double.infinity, 100);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding38),
      child: AppBar(
        toolbarHeight: 70,
        leadingWidth: 35,
        leading: RecipeIconButton(
          callback: context.pop,
          image: "assets/icons/back-arrow.svg",
          width: 30,
          height: 14,
        ),
        centerTitle: true,
        title: Text(
          "Community",
          style: TextStyles.appBarTitleStyle,
        ),
        actions: [
          RecipeIconButtonContainer(
            image: "assets/icons/notification.svg",
            iconColor: AppColors.pinkSub,
            callback: () {},
          ),
          SizedBox(width: 5),
          RecipeIconButtonContainer(
            image: "assets/icons/search.svg",
            iconColor: AppColors.pinkSub,
            callback: () {},
          )
        ],
        bottom: TabBar(
          dividerColor: Colors.transparent,
          indicator: ShapeDecoration(
            color: AppColors.redPinkMain, // Background color for selected tab
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Rounded edges
            ),
          ),
          indicatorSize: TabBarIndicatorSize.label, // Indicator fits the text
          indicatorPadding: EdgeInsets.symmetric(vertical: 12), // Removes extra space around indicator
          labelPadding: EdgeInsets.symmetric(horizontal: 5), // Adjusts tab spacing
          overlayColor: WidgetStateProperty.all(Colors.transparent), // Removes click shadow
          labelColor: Colors.white, // White text for selected tab
          unselectedLabelColor: AppColors.redPinkMain, // Pink text for unselected tabs
          tabs: [
            Tab(text: "Top Recipes"),
            Tab(text: "Newest"),
            Tab(text: "Oldest"),
          ],
        ),
      ),
    );
  }
}
