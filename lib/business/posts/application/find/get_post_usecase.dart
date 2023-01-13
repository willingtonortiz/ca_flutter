import 'package:ca_flutter/business/posts/domain/entities/entities.dart';
import 'package:ca_flutter/business/posts/domain/repositories/repositories.dart';
import 'package:fpdart/fpdart.dart';

class GetPostUseCase {
  const GetPostUseCase({
    required this.postsRepository,
  });

  final PostsRepository postsRepository;

  TaskEither<Exception, Post> call(String postId) {
    return postsRepository.getPost(postId);
  }
}
