
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/categories/data/models/category_model.dart';
import 'package:recipe_app/categories/presentation/pages/categories_view.dart';
import 'package:recipe_app/categories/presentation/pages/categories_view_model.dart';
import 'package:recipe_app/categories_detail/data/models/recipe_model_small.dart';
import 'package:recipe_app/categories_detail/presentation/pages/categories_detail_view.dart';
import 'package:recipe_app/categories_detail/presentation/pages/categories_detail_view_model.dart';
import 'package:recipe_app/community/presentation/pages/community_view.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/home/presentation/pages/home_view.dart';
import 'package:recipe_app/onboarding/presentation/pages/onboarding_view.dart';
import 'package:recipe_app/profile/presentation/pages/profile_view.dart';
import 'package:recipe_app/recipe_detail/presentation/pages/recipe_detail_view.dart';
import 'package:recipe_app/recipe_detail/presentation/pages/recipe_detail_view_model.dart';
import 'package:recipe_app/signup/presentation/pages/complete_profile_view.dart';
import 'package:recipe_app/signup/presentation/pages/login_view.dart';

import '../../community/data/repositories/community_repository.dart';
import '../../community/presentation/manager/community_view_model.dart';



final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.login,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingView(),
    ),
    GoRoute(
      path: Routes.categories,
      builder: (context, state) {
        return CategoriesView(
          viewModel: CategoriesViewModel(repo: context.read()),
        );
      },
    ),
    GoRoute(
      path: Routes.categoryDetail,
      builder: (context, state) => CategoriesDetailView(
        viewModel: CategoriesDetailViewModel(
          repo: context.read(),
          catsRepo: context.read(),
          selected: state.extra as CategoryModel,
        ),
      ),
    ),
    GoRoute(
      path: '${Routes.recipeDetail}/:recipeId',
      builder: (context, state) {
        final recipeId = int.parse(state.pathParameters['recipeId']!);
        return ChangeNotifierProvider(
        create: (context) => RecipeDetailViewModel(
          repo: context.read(),
          recipeId: recipeId
        ),
        child: RecipeDetailView(),
      );
      },
    ),

    GoRoute(
      path: Routes.myProfile,
      builder: (context, state) => ProfileView(),
    ),
    GoRoute(
      path: Routes.completeProfile,
      builder: (context, state) => CompleteProfileView(),
    ),
    GoRoute(
      path: Routes.community,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => CommunityViewModel(
          comRepo: context.read<CommunityRepository>(),
          order: "date",
          limit: 10,
          descending: true,
        ),
        child: CommunityView(),
      ),
    ),
  ],
);
