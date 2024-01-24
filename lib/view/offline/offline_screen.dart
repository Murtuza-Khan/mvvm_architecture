import '../../resources/exports/index.dart';

class OfflineScreen extends StatelessWidget with PortraitModeMixin {
  static const String routeName = '/offline';

  const OfflineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) async => false,
      child: Container(
        decoration: BoxDecoration(gradient: Gradients.offline),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Sizes.PADDING_32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Lottie.asset(
                      Assets.OFFLINE_TREX_LIGHT,
                      height: Sizes.HEIGHT_200,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Sizes.PADDING_32),
                    child: Text(
                      Strings.YOU_ARE_OFFLINE,
                      style: context.headlineMedium.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.PADDING_32,
                    ),
                    child: Text(
                      Strings.NO_INTERNET_CONNECTION,
                      style: context.titleMedium.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 100,
                      crossAxisSpacing: 20,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(Sizes.PADDING_8),
                        child: CustomButton(
                          buttonType: ButtonType.dottedWithImage,
                          color: Colors.white,
                          textColor: Colors.white,
                          image: const Icon(
                            Icons.wifi_rounded,
                            color: Colors.white,
                          ),
                          text: Strings.OPEN_WIFI_SETTINGS,
                          onPressed: () async =>
                              await AppSettings.openAppSettings(
                            type: AppSettingsType.wifi,
                          ),
                          hasInfiniteWidth: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Sizes.PADDING_8),
                        child: CustomButton(
                          buttonType: ButtonType.dottedWithImage,
                          color: Colors.white,
                          textColor: Colors.white,
                          image: const Icon(
                            Icons.signal_cellular_alt_rounded,
                            color: Colors.white,
                          ),
                          text: Strings.OPEN_DATA_SETTINGS,
                          onPressed: () async =>
                              await AppSettings.openAppSettings(
                            type: AppSettingsType.wireless,
                          ),
                          hasInfiniteWidth: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
