import 'package:ct_base_web_workspace/app/modules/guards/logged_guard.dart';
import 'package:ct_micro_app_dashboard/app/dashboard_module.dart';
import 'package:ct_micro_app_marketplace/app/marketplace_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ct_micro_app_auth/ct_micro_app_auth.dart';
import 'package:ct_micro_commons_auth/ct_micro_commons_auth.dart';
import 'package:ct_micro_commons_client_https/ct_micro_commons_client_https.dart';
import 'package:ct_micro_commons_shared/shared/utils/env.dart';
import 'package:ct_micro_commons_ds/ct_micro_commons_ds.dart';
import 'package:ct_micro_commons_core_app/ct_micro_commons_core_app.dart';

import 'package:ct_external_shopping_monitor/ct_external_shopping_monitor.dart';

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
      '/store',
      module: MarketplaceModule(),
      guards: [LoggedGuard()],
    ),

    ModuleRoute(
      '/shopping_monitor',
      module: ShoppingMonitorModule(),
      guards: [LoggedGuard()],
    ),

    WildcardRoute(
      child: (_, __) => const Scaffold(
        body: Center(
          child: Text("Router not found!", style: TextStyle(fontSize: 22)),
        ),
      ),
    ),
  ];
}
