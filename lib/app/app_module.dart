import 'package:flutter_modular/flutter_modular.dart';
import 'package:flut_micro_app_auth/flut_micro_app_auth.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    // ModuleRoute('/', module: AuthModule()),
    ModuleRoute('/', module: AuthModule()),
  ];
}
