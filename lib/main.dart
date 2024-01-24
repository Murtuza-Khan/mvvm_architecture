import 'resources/exports/index.dart';

Future<void> main() async {
  await InitializationService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: GetMaterialApp(
        title: Strings.APP_NAME,
        debugShowCheckedModeBanner: false,
        theme: ThemeController().getTheme,
        builder: (context, widget) {
          return ResponsiveWrapper.builder(
            MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1),
              ),
              child: BouncingScrollWrapperX.builder(
                context,
                widget!,
                dragWithMouse: true,
              ),
            ),
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.autoScaleDown(450, name: MOBILE),
            ],
          );
        },
        onGenerateRoute: Pages.onGenerateRoute,
        initialRoute: Routes.LOGIN,
        defaultTransition: Transition.rightToLeft,
        smartManagement: SmartManagement.full,
      ),
    );
  }
}
