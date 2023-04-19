// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:flutter/src/cupertino/localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:ct_micro_commons_ds/ct_micro_commons_ds.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = [
      'assets/lang',
      'packages/ct_micro_app_auth/assets/lang',
      'packages/ct_micro_app_dashboard/assets/lang',
      'packages/ct_micro_commons_auth/assets/lang',
      'packages/ct_micro_commons_client_https/assets/lang',
      'packages/ct_micro_commons_dependencies/assets/lang',
      'packages/ct_micro_commons_ds/assets/lang',
      'packages/ct_micro_commons_shared/assets/lang',
    ];
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Cuiatech Workspace',
      theme: CuiaTheme.web,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      locale: const Locale('pt', 'BR'),
    );
  }
}
