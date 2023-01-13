import 'package:ca_flutter/app/modules/home/pages/pages.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute<dynamic>('/', child: (_, args) => const HomePage()),
      ];
}
