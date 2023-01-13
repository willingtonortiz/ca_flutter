import 'package:ca_flutter/business/posts/application/find/find.dart';
import 'package:ca_flutter/business/posts/domain/repositories/repositories.dart';
import 'package:ca_flutter/business/posts/infrastructure/repositories/repositories.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PostsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<PostsRepository>(
          (i) => HttpPostsRepository(),
          export: true,
        ),
        Bind.singleton<GetPostUseCase>(
          (i) => GetPostUseCase(postsRepository: i<PostsRepository>()),
          export: true,
        ),
        Bind.singleton<GetPostsUseCase>(
          (i) => GetPostsUseCase(postsRepository: i<PostsRepository>()),
          export: true,
        ),
      ];
}
