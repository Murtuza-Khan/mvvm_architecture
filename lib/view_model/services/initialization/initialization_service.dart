import '../../../resources/exports/index.dart';

class InitializationService {
  static DateTime? currentBackPressTime;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    CustomLogger.configure();

    log.i(Flavor.environment);

    await FlutterConfig.loadEnvVariables();

    LicenseRegistry.addLicense(() async* {
      final license =
          await rootBundle.loadString('assets/fonts/Poppins/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });

    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    await GetStorage.init(Strings.CACHE_BOX_KEY);

    await GetStorage.init().then(
      (value) async {
        await Get.putAsync(() async => AuthManager(), permanent: true);
        await Get.putAsync(
          () async => ConnectivityStreamService(),
          permanent: true,
        );
      },
    );

    // await FirebaseApi().initNotification();
    // await FirebaseMessaging.instance.subscribeToTopic("Bazaritaza");

    // await GlobalHelper.initLanguages();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  static Future<bool> onWillPop() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 1)) {
      CustomSnackBar.toast(
        color: AppColors.primary,
        message: Strings.CLOSE_APPLICATION,
      );
      return Future.value(false);
    }
    // await FirebaseMessaging.instance.unsubscribeFromTopic("Bazaritaza");
    return Future.value(true);
  }
}
