import '../resources/exports/index.dart';

InputDecorationTheme inputDecorationTheme({
  required Color primaryColor,
  required Color errorColor,
  required Color fillColor,
  required Color enabledBorderColor,
  required Color focusBorderColor,
  required Color hintColor,
  required Color disableColor,
}) =>
    InputDecorationTheme(
      fillColor: fillColor,
      filled: true,
      hintStyle: TextStyle(color: hintColor),
      border: outlineInputBorder(borderColor: enabledBorderColor),
      enabledBorder: outlineInputBorder(borderColor: enabledBorderColor),
      focusedBorder: focusedOutlineInputBorder(primaryColor: focusBorderColor),
      errorBorder: errorOutlineInputBorder(errorColor: errorColor),
      focusedErrorBorder: focusErrorOutlineInputBorder(errorColor: errorColor),
      disabledBorder: disableBorderInputDecoration(disableColor: disableColor),
    );

OutlineInputBorder outlineInputBorder({
  required Color borderColor,
}) =>
    OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(Sizes.RADIUS_12)),
      borderSide: BorderSide(color: borderColor),
    );

OutlineInputBorder focusedOutlineInputBorder({
  required Color primaryColor,
}) =>
    OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(Sizes.RADIUS_12)),
      borderSide: BorderSide(color: primaryColor, width: 1.5),
    );

OutlineInputBorder errorOutlineInputBorder({
  required Color errorColor,
}) =>
    OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(Sizes.RADIUS_12)),
      borderSide: BorderSide(color: errorColor),
    );

OutlineInputBorder disableBorderInputDecoration({required Color disableColor}) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(Sizes.RADIUS_12)),
    borderSide: BorderSide(color: disableColor),
  );
}

OutlineInputBorder focusErrorOutlineInputBorder({
  required Color errorColor,
}) =>
    OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(Sizes.RADIUS_12)),
      borderSide: BorderSide(color: errorColor, width: 1.5),
    );

OutlineInputBorder secondaryOutlineInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(Sizes.RADIUS_12)),
    borderSide: BorderSide(
      color: context.bodyLarge.color!.withOpacity(0.15),
    ),
  );
}
