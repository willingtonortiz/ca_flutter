import 'package:ca_flutter/app/modules/posts/pages/pages.dart';
import 'package:ca_flutter/business/posts/posts_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FPostsModule extends Module {
  @override
  List<Module> get imports => [
        PostsModule(),
      ];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute<dynamic>('/list', child: (_, args) => const PostListPage()),
      ];
}
