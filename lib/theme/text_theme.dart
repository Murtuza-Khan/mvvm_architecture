import '../resources/exports/index.dart';

const _superBold = FontWeight.w900;
const _extraBold = FontWeight.w800;
const _bold = FontWeight.w700;
const _semiBold = FontWeight.w600;
const _medium = FontWeight.w500;
const _regular = FontWeight.w400;
const _light = FontWeight.w300;

TextTheme buildTextTheme({required Color textColor}) => TextTheme(
      displayLarge: TextStyle(
        fontSize: Sizes.TEXT_SIZE_96,
        color: textColor,
        fontWeight: _superBold,
        fontStyle: FontStyle.normal,
        fontFamily: Strings.POPPINS,
      ),
      displayMedium: TextStyle(
        fontSize: Sizes.TEXT_SIZE_60,
        color: textColor,
        fontWeight: _extraBold,
        fontStyle: FontStyle.normal,
        fontFamily: Strings.POPPINS,
      ),
      displaySmall: TextStyle(
        fontSize: Sizes.TEXT_SIZE_48,
        color: textColor,
        fontWeight: _bold,
        fontStyle: FontStyle.normal,
        fontFamily: Strings.POPPINS,
      ),
      headlineLarge: TextStyle(
        fontSize: Sizes.TEXT_SIZE_40,
        color: textColor,
        fontWeight: _extraBold,
        fontStyle: FontStyle.normal,
        fontFamily: Strings.POPPINS,
      ),
      headlineMedium: TextStyle(
        fontSize: Sizes.TEXT_SIZE_34,
        color: textColor,
        fontWeight: _bold,
        fontStyle: FontStyle.normal,
        fontFamily: Strings.POPPINS,
      ),
      headlineSmall: TextStyle(
        fontSize: Sizes.TEXT_SIZE_24,
        color: textColor,
        fontWeight: _semiBold,
        fontStyle: FontStyle.normal,
        fontFamily: Strings.POPPINS,
      ),
      titleLarge: TextStyle(
        fontSize: Sizes.TEXT_SIZE_18,
        color: textColor,
        fontWeight: _semiBold,
        fontStyle: FontStyle.normal,
        fontFamily: Strings.POPPINS,
      ),
      titleMedium: TextStyle(
        fontSize: Sizes.TEXT_SIZE_16,
        color: textColor,
        fontWeight: _medium,
        fontStyle: FontStyle.normal,
        fontFamily: Strings.POPPINS,
      ),
      titleSmall: TextStyle(
        fontSize: Sizes.TEXT_SIZE_14,
        color: textColor,
        fontWeight: _medium,
        fontStyle: FontStyle.normal,
        fontFamily: Strings.POPPINS,
      ),
      bodyLarge: TextStyle(
        fontSize: Sizes.TEXT_SIZE_16,
        color: textColor,
        fontWeight: _regular,
        fontStyle: FontStyle.normal,
        fontFamily: Strings.POPPINS,
      ),
      bodyMedium: TextStyle(
        fontSize: Sizes.TEXT_SIZE_14,
        color: textColor,
        fontWeight: _regular,
        fontStyle: FontStyle.normal,
        fontFamily: Strings.POPPINS,
      ),
      bodySmall: TextStyle(
        fontSize: Sizes.TEXT_SIZE_12,
        color: textColor,
        fontWeight: _light,
        fontStyle: FontStyle.normal,
        fontFamily: Strings.POPPINS,
      ),
      labelLarge: TextStyle(
        fontSize: Sizes.TEXT_SIZE_14,
        color: textColor,
        fontWeight: _medium,
        fontStyle: FontStyle.normal,
        fontFamily: Strings.POPPINS,
      ),
      labelMedium: TextStyle(
        fontSize: Sizes.TEXT_SIZE_12,
        color: textColor,
        fontWeight: _regular,
        fontStyle: FontStyle.normal,
        fontFamily: Strings.POPPINS,
      ),
      labelSmall: TextStyle(
        fontSize: Sizes.TEXT_SIZE_10,
        color: textColor,
        fontWeight: _light,
        fontStyle: FontStyle.normal,
        fontFamily: Strings.POPPINS,
      ),
    );
