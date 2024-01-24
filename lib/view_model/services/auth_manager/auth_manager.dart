import '../../../resources/exports/index.dart';

class AuthManager extends LocalStorageService implements GetxService {
  static AuthManager instance = Get.find();

  late Rx<Session?> session = Rxn<Session>();

  final RxBool _isLoggedIn = false.obs;

  Rx<bool> rememberCredentials = false.obs;

  bool get isLoggedIn => _isLoggedIn.value;

  String get token => session.value!.tokenId!;

  UserModel get user => session.value?.user ?? UserModel();

  String get defaultLanguage => getDefaultLanguage() ?? "en";

  String get deviceToken => getDeviceToken() ?? "";

  Future<void> login(Session? session) async {
    _isLoggedIn.value = true;
    if (rememberCredentials.value) await saveToken(session?.tokenId);
    await saveCurrentSession(session: session);
  }

  Future<bool> checkLoginStatus() async {
    try {
      final token = getToken();

      if (token != null) {
        rememberCredentials.value = true;

        _isLoggedIn.value = true;

        session.value = getSessionData();

        return _isLoggedIn.value;
      } else {
        session.value = Session();
      }
      return false;
    } catch (e) {
      removeToken();
    }
    return false;
  }

  Future<void> saveCurrentSession({
    Object? id,
    UserModel? user,
    Session? session,
  }) async {
    if (session != null) this.session.value = session;
    this.session.update((session) {
      if (user != null) session!.user = user;
    });
    if (rememberCredentials.value) await saveSession(this.session.value);
  }

  Future<void> logout() async {
    final token = getToken();
    if (token != null) removeToken();

    session = Session().obs;
    _isLoggedIn.value = false;
    rememberCredentials.value = true;
    log.t(session.toJson());
    Get.offAllNamed(Routes.LOGIN);
  }
}
