import 'package:ct_micro_commons_dependencies/ct_micro_commons_dependencies.dart';
import 'package:ct_micro_commons_shared/ct_micro_commons_shared.dart';

class UnloggedGuard extends RouteGuard {
  UnloggedGuard() : super(redirectTo: '/');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    var accessToken = await LocalStorage.get('access_token');
    return accessToken == null;
  }
}
