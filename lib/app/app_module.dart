import 'package:flut_base_web_workspace/app/modules/guards/logged_guard.dart';
import 'package:flut_micro_app_dashboard/app/dashboard_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flut_micro_app_auth/flut_micro_app_auth.dart';
import 'package:flut_micro_commons_auth/flut_micro_commons_auth.dart';
import 'package:flut_micro_commons_client_https/flut_micro_commons_client_https.dart';
import 'package:flut_micro_commons_shared/shared/utils/env.dart';

import 'modules/guards/unlogged_guard.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) {
      if (const String.fromEnvironment('ENV') == 'prod') return Env.prod();
      return Env.dev();
    })
  ];

  @override
  List<Module> imports = [
    ClientHttpsModule(),
    AuthModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/auth', module: AppAuthModule(), guards: [UnloggedGuard()]),
    ModuleRoute('/', module: DashboardModule(), guards: [LoggedGuard()]),
  ];
}
