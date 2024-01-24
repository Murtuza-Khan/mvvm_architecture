import '../../../resources/exports/index.dart';

class ThemeController {
  Color accentColor = AppColors.primary;

  ThemeData get getTheme => AppTheme.build(
        isDarkMode: false,
        brightness: Brightness.light,
        swatchColors: MaterialColor(
          accentColor.value,
          AppTheme.getSwatch(accentColor),
        ),
        primaryColor: accentColor,
      );
}
