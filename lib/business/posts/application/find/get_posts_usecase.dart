import 'dart:math';

import 'package:ca_flutter/business/posts/domain/entities/entities.dart';
import 'package:ca_flutter/business/posts/domain/repositories/repositories.dart';
import 'package:fpdart/fpdart.dart';

class GetPostsUseCase {
  const GetPostsUseCase({
    required this.postsRepository,
  });

  final PostsRepository postsRepository;

  TaskEither<Exception, List<Post>> call() {
    final hasError = Random().nextBool();
    if (hasError) {
      return TaskEither.left(Exception('Error'));
    }

    return postsRepository.getPosts();
  }
}
