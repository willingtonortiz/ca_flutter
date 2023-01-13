import 'package:ca_flutter/business/posts/domain/entities/entities.dart';
import 'package:fpdart/fpdart.dart';

abstract class PostsRepository {
  TaskEither<Exception, List<Post>> getPosts();

  TaskEither<Exception, Post> getPost(String postId);
}
