import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';

class UnloggedGuard extends RouteGuard {
  UnloggedGuard() : super(redirectTo: '/');

  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    final prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    return accessToken == null;
  }
}
