import 'package:ca_flutter/app/modules/home/home.dart';
import 'package:ca_flutter/app/modules/posts/posts.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute<dynamic>('/', module: HomeModule()),
        ModuleRoute<dynamic>('/posts/', module: FPostsModule()),
      ];
}
