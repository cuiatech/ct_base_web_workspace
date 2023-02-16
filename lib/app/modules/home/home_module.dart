// ignore_for_file: depend_on_referenced_packages

import 'package:ct_base_web_workspace/app/modules/home/maintenance_home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const MaintenanceHomePage()),
  ];
}
