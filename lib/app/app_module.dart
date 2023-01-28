import 'package:flutter_modular/flutter_modular.dart';
import 'package:flut_micro_app_auth/flut_micro_app_auth.dart';
import 'package:flut_micro_commons_auth/flut_micro_commons_auth.dart';
import 'package:flut_micro_commons_client_https/flut_micro_commons_client_https.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<Module> imports = [
    ClientHttpsModule(),
    AuthModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    // ModuleRoute('/', module: AuthModule()),
    ModuleRoute('/', module: AppAuthModule()), // auth
  ];
}
