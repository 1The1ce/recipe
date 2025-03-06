import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get password => 'Введите пароль';

  @override
  String get logIn => 'Вход';

  @override
  String get signUp => 'Регистрация';

  @override
  String get hi => 'Привет!';

  @override
  String get whatAreYouCookingToday => 'Что приготовим сегодня';

  @override
  String get trendingRecipe => 'Трендовые Рецепты';

  @override
  String get yourRecipes => 'Ваши Рецепты';

  @override
  String get topChef => 'Топ Шеф';

  @override
  String get recentlyAdded => 'Недавно Добавленные';
}
