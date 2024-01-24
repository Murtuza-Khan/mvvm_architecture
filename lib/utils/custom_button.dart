import '../resources/exports/index.dart';

enum ButtonType {
  outline,
  outlineWithImage,
  text,
  textWithImage,
  dotted,
  dottedWithImage,
  dottedWithLoading,
  image,
  loading,
  multiText,
}

class CustomButton extends StatelessWidget {
  final Color color;
  final bool hasInfiniteWidth;
  final Color textColor;
  final String text;
  final Widget? image;
  final VoidCallback? onPressed;
  final Widget? loadingWidget;
  final ButtonType buttonType;
  final double buttonRadius;
  final double verticalMargin;
  final String? secondaryText;
  final TextStyle? secondaryTextStyle;
  final BoxConstraints? constraints;
  final TextStyle? customTextStyle;
  final FontWeight? fontWeight;
  final double borderWidth;
  final EdgeInsets buttonPadding;
  final bool isLoading;
  final double? fontSize;

  const CustomButton({
    Key? key,
    required this.color,
    required this.textColor,
    required this.text,
    required this.hasInfiniteWidth,
    this.onPressed,
    this.image,
    this.loadingWidget,
    this.buttonType = ButtonType.text,
    this.buttonRadius = Sizes.RADIUS_14,
    this.verticalMargin = Sizes.PADDING_8,
    this.secondaryText,
    this.secondaryTextStyle,
    this.constraints = const BoxConstraints(
      minWidth: 43,
      minHeight: 40,
      maxWidth: 43,
      maxHeight: 60,
    ),
    this.customTextStyle,
    this.fontWeight,
    this.borderWidth = 1.5,
    this.buttonPadding = const EdgeInsets.all(Sizes.PADDING_14),
    this.isLoading = false,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalMargin),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: hasInfiniteWidth ? double.infinity : 0,
        ),
        child: getButtonWidget(context),
      ),
    );
  }

  Widget getButtonWidget(BuildContext context) {
    TextStyle textStyle = context.titleMedium.copyWith(
      color: textColor,
      fontWeight: fontWeight ?? FontWeight.w600,
      letterSpacing: 1.0,
      fontSize: fontSize ?? context.textTheme.titleLarge!.fontSize,
    );
    switch (buttonType) {
      case ButtonType.outline:
        return _buildOutlinedButton(
          textStyle: customTextStyle ?? textStyle,
          child: Text(
            text.tr,
            style: customTextStyle ?? textStyle,
            textAlign: TextAlign.center,
          ),
        );
      case ButtonType.outlineWithImage:
        return _buildOutlinedButton(
          textStyle: textStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: Sizes.PADDING_12),
                child: image,
              ),
              Text(
                text.tr,
                style: customTextStyle ?? textStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      case ButtonType.text:
        return _buildTextButton(
          textStyle: textStyle,
          child: Text(
            text.tr,
            style: customTextStyle ?? textStyle,
            textAlign: TextAlign.center,
          ),
        );
      case ButtonType.textWithImage:
        return _buildTextButton(
          textStyle: textStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: Sizes.PADDING_12),
                child: image,
              ),
              Text(
                text.tr,
                style: customTextStyle ?? textStyle,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      case ButtonType.image:
        return _buildTextButton(
          textStyle: textStyle,
          child: image!,
        );
      case ButtonType.loading:
        return _buildTextButton(
          textStyle: textStyle,
          child: isLoading
              ? loadingWidget == null
                  ? const SizedBox(
                      height: Sizes.HEIGHT_30,
                      width: Sizes.WIDTH_30,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                  : loadingWidget!
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (image != null) ...[image!, const SpaceW8()],
                    Text(
                      text.tr,
                      style: customTextStyle ?? textStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
        );
      case ButtonType.multiText:
        return _buildTextButton(
          textStyle: textStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text.tr,
                style: textStyle,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: Sizes.PADDING_4),
                child: Text(
                  secondaryText!.tr,
                  style: secondaryTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      case ButtonType.dotted:
        return _buildDottedButton(
          child: Text(
            text.tr,
            style: customTextStyle ?? textStyle,
            textAlign: TextAlign.center,
          ),
        );
      case ButtonType.dottedWithLoading:
        return _buildDottedButton(
          child: isLoading
              ? loadingWidget == null
                  ? const SizedBox(
                      height: Sizes.HEIGHT_30,
                      width: Sizes.WIDTH_30,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                  : loadingWidget!
              : Text(
                  text.tr,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
        );
      case ButtonType.dottedWithImage:
        return _buildDottedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: Sizes.PADDING_12),
                child: image,
              ),
              Text(
                text.tr,
                style: customTextStyle ?? textStyle,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      default:
        return _buildTextButton(
          textStyle: textStyle,
          child: loadingWidget == null
              ? Text(
                  text.tr,
                  style: customTextStyle ?? textStyle,
                  textAlign: TextAlign.center,
                )
              : loadingWidget!,
        );
    }
  }

  TextButton _buildTextButton({
    required TextStyle textStyle,
    required Widget child,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryLight,
        backgroundColor: color,
        padding: buttonPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
        ),
        minimumSize: Size(
          constraints?.minWidth ?? 0.0,
          constraints?.minHeight ?? 0.0,
        ),
        maximumSize: Size(
          constraints?.maxWidth ?? 0.0,
          constraints?.maxHeight ?? 0.0,
        ),
      ),
      onPressed: !isLoading ? onPressed : null,
      child: FittedBox(child: child),
    );
  }

  OutlinedButton _buildOutlinedButton({
    required TextStyle textStyle,
    required Widget child,
  }) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: BorderSide(width: borderWidth, color: color),
        padding: buttonPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
          side: BorderSide(color: color),
        ),
        minimumSize: Size(
          constraints?.minWidth ?? 0.0,
          constraints?.minHeight ?? 0.0,
        ),
        maximumSize: Size(
          constraints?.maxWidth ?? 0.0,
          constraints?.maxHeight ?? 0.0,
        ),
      ),
      onPressed: !isLoading ? onPressed : null,
      child: child,
    );
  }

  Widget _buildDottedButton({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(buttonRadius)),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: !isLoading ? onPressed : null,
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: color,
          radius: Radius.circular(buttonRadius),
          dashPattern: const [4, 3],
          strokeWidth: borderWidth,
          borderPadding: const EdgeInsets.all(Sizes.PADDING_2),
          child: Container(
            padding: buttonPadding,
            decoration: BoxDecoration(
              color: color.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(buttonRadius)),
            ),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
