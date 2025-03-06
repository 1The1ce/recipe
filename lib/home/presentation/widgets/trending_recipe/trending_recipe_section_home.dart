import 'package:flutter/material.dart';
import 'package:recipe_app/core/core.dart';

import '../../../../core/l10n/app_localizations.dart';
import 'trending_recipe_home.dart';

class TrendingRecipeSectionHome extends StatelessWidget {
  const TrendingRecipeSectionHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.trendingRecipe, style: TextStyles.homeSectionTitleRedPink),
          TrendingRecipeItemHome(),
        ],
      ),
    );
  }
}
