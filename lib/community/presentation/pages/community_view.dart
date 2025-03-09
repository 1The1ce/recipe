import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/community/presentation/manager/community_view_model.dart';
import 'package:recipe_app/community/presentation/widgets/community_app_bar.dart';
import 'package:recipe_app/community/presentation/widgets/top_recipes.dart';
import 'package:recipe_app/community/presentation/widgets/newest_recipes.dart';
import 'package:recipe_app/community/presentation/widgets/oldest_recipes.dart';
import 'package:recipe_app/core/core.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CommunityViewModel>();
    if (vm.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CommunityAppBar(),
        body: TabBarView(
          children: [
            TopRecipes(),
            NewestRecipes(),
            OldestRecipes(),
          ],
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
