import '../resources/exports/index.dart';

class CustomSnackBar {
  static successSnackBar({
    required String message,
    String title = Strings.SUCCESS,
    Duration? duration,
  }) async {
    await closeAllSnackBars();
    Get.snackbar(
      title.tr,
      message.tr,
      duration: duration ?? const Duration(seconds: 3),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      colorText: Colors.white,
      maxWidth: 600,
      backgroundColor: Colors.green,
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
    );
  }

  static errorSnackBar({
    required String message,
    String title = Strings.ERROR,
    Color? color,
    Duration? duration,
  }) async {
    await closeAllSnackBars();
    Get.snackbar(
      title.tr,
      message.tr,
      duration: duration ?? const Duration(seconds: 3),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      colorText: Colors.white,
      maxWidth: 600,
      backgroundColor: color ?? Colors.redAccent,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  static toast({
    String? title,
    required String message,
    Color? color,
    Duration? duration,
  }) async {
    await closeAllSnackBars();
    Get.rawSnackbar(
      title: (title ?? "").tr,
      duration: duration ?? const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: color ?? Colors.green,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      messageText: Text(
        message.tr,
        style: Get.context!.bodyMedium.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      overlayBlur: 0.9,
    );
  }

  static errorToast({
    String? title,
    required String message,
    Color? color,
    Duration? duration,
  }) async {
    await closeAllSnackBars();
    Get.rawSnackbar(
      title: title,
      duration: duration ?? const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: color ?? Colors.redAccent,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      //overlayBlur: 0.8,
      message: message,
    );
  }

  static Future<T?> showCustomBottomSheet<T>({
    String? title,
    Widget? header,
    Color? color,
    Duration? duration,
    bool isScrollControlled = false,
    double? maxHeight,
    double? maxWidth,
    required Widget bottomSheet,
    bool showDivider = true,
  }) async {
    await closeAllSnackBars();
    return showModalBottomSheet<T>(
      context: Get.context!,
      isScrollControlled: isScrollControlled,
      backgroundColor: color,
      constraints: BoxConstraints(
        maxHeight: maxHeight ?? 500,
        maxWidth: maxWidth ?? 500,
      ),
      elevation: Sizes.ELEVATION_8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.RADIUS_30),
          topRight: Radius.circular(Sizes.RADIUS_30),
        ),
      ),
      builder: (context) => _buildBottomSheetContent(
        header,
        title,
        context,
        showDivider,
        bottomSheet,
      ),
    );
  }

  static ClipRRect _buildBottomSheetContent(Widget? header, String? title,
      BuildContext context, bool showDivider, Widget bottomSheet) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(Sizes.RADIUS_30),
        topRight: Radius.circular(Sizes.RADIUS_30),
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SpaceH20(),
            header ?? const SizedBox(),
            if (title != null) ...[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Sizes.PADDING_20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title.tr,
                      style: context.titleLarge.copyWith(
                        fontSize: Sizes.TEXT_SIZE_20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    GestureDetector(
                      onTap: Get.back,
                      child: const Icon(
                        Icons.cancel,
                        color: AppColors.primary,
                        size: Sizes.ICON_SIZE_30,
                      ),
                    ),
                  ],
                ),
              )
            ],
            if (showDivider) ...[
              const SpaceH12(),
              const Divider(color: AppColors.divider, height: 3)
            ],
            bottomSheet.expanded(),
          ],
        ),
      ),
    );
  }

  static Future<void> closeAllSnackBars() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
      () => {
        Get.closeCurrentSnackbar(),
        Get.closeAllSnackbars(),
      },
    );
  }

  static get restrictedAccess => errorToast(message: Strings.RESTRICTED_ACCESS);

  static get offline => CustomSnackBar.errorSnackBar(
        message: Strings.OFFLINE_MESSAGE,
      );

  static get unsupportedPlatform => errorSnackBar(
        message: Strings.NOT_SUPPORTED,
      );
}
