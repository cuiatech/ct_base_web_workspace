import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';
import 'package:flut_micro_commons_shared/flut_micro_commons_shared.dart';

class LoggedGuard extends RouteGuard {
  LoggedGuard() : super(redirectTo: '/auth/');

  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    var accessToken = await LocalStorage.get('access_token');
    return accessToken != null;
  }
}
