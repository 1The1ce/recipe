import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/community/data/repositories/community_repository.dart';
import 'package:recipe_app/core/l10n/app_localizations.dart';
import 'package:recipe_app/onboarding/data/repositories/onboarding_repository.dart';
import 'package:recipe_app/profile/data/repositories/profile_repository.dart';
import 'package:recipe_app/recipe_detail/data/repositories/recipe_detail_repository.dart';
import 'categories/data/repositories/categories_repository.dart';
import 'categories_detail/data/repositories/categories_detail_repository.dart';
import 'core/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(RecipeApp());
}

class LocaleProvider with ChangeNotifier {
  Locale _locale = Locale("en");

  Locale get locale => _locale;

  void toggleLocale() {
    if (_locale.languageCode == "en") {
      _locale = Locale("ru");
    } else if (_locale.languageCode == "ru") {
      _locale = Locale("uz");
    } else {
      _locale = Locale("en");
    }
    notifyListeners();
  }
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MultiProvider(
      providers: [
        Provider(create: (context) => ApiClient()),
        Provider(create: (context) => ProfileRepository(client: context.read())),
        Provider(create: (context) => OnboardingRepository(client: context.read())),
        Provider(create: (context) => CategoriesRepository(client: context.read<ApiClient>())),
        Provider(create: (context) => CategoriesDetailRepository(client: context.read())),
        Provider(create: (context) => RecipeDetailRepository(client: context.read())),
        Provider(create: (context) => RecipeRepository(client: context.read())),
        Provider(create: (context) => TopChefRepository(client: context.read())),
        Provider(create: (context) => AuthRepository(client: context.read())),
        Provider(create: (context) => CommunityRepository(client: context.read())),
        ChangeNotifierProvider(create: (context) => AuthViewModel(authRepository: context.read())),
        ChangeNotifierProvider(create: (context) => LocaleProvider()),

      ],
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) {
          return ScreenUtilInit(
            designSize: Size(430, 932),
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: appThemeData,
              routerConfig: router,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                AppLocalizations.delegate
              ],
              supportedLocales: [
                Locale("uz"),
                Locale("en"),
                Locale("ru"),
              ],
              locale: localeProvider.locale,
              builder: (context, child) {
                return Stack(
                  children: [
                    child!,
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: FloatingActionButton(
                        onPressed: () {
                          Provider.of<LocaleProvider>(context, listen: false).toggleLocale();
                        },
                        child: Icon(Icons.language),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
