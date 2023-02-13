// ignore_for_file: depend_on_referenced_packages

import 'package:flut_base_web_workspace/app/modules/guards/logged_guard.dart';
import 'package:flut_micro_app_dashboard/app/dashboard_module.dart';
import 'package:flut_micro_app_marketplace/app/marketplace_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flut_micro_app_auth/flut_micro_app_auth.dart';
import 'package:flut_micro_commons_auth/flut_micro_commons_auth.dart';
import 'package:flut_micro_commons_client_https/flut_micro_commons_client_https.dart';
import 'package:flut_micro_commons_shared/shared/utils/env.dart';
import 'package:flut_micro_commons_ds/flut_micro_commons_ds.dart';
import 'package:flut_micro_commons_core_app/flut_micro_commons_core_app.dart';

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
    CuiaDsModule(),
    AuthModule(),
    CoreAppModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    // ModuleRoute('/', module: HomeModule()), // maintenance
    ModuleRoute('/auth', module: AppAuthModule(), guards: [UnloggedGuard()]),
    ModuleRoute('/', module: DashboardModule(), guards: [LoggedGuard()]),
    ModuleRoute(
      '/marketplace',
      module: MarketplaceModule(),
      guards: [LoggedGuard()],
    ),
  ];
}
