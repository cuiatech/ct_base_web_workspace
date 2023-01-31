// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:flutter/src/cupertino/localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = [
      'assets/lang',
      'packages/flut_micro_app_auth/assets/lang',
      'packages/flut_micro_app_dashboard/assets/lang',
      'packages/flut_micro_commons_auth/assets/lang',
      'packages/flut_micro_commons_client_https/assets/lang',
      'packages/flut_micro_commons_dependencies/assets/lang',
      'packages/flut_micro_commons_ds/assets/lang',
      'packages/flut_micro_commons_shared/assets/lang',
    ];
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Cuia Workspace',
      theme: ThemeData(primarySwatch: Colors.blue),
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
