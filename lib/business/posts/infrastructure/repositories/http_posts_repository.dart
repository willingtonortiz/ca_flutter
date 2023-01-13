import 'dart:convert';

import 'package:ca_flutter/business/posts/domain/entities/post.dart';
import 'package:ca_flutter/business/posts/domain/repositories/repositories.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class HttpPostsRepository implements PostsRepository {
  @override
  TaskEither<Exception, Post> getPost(String postId) {
    // TODO: implement getPost
    throw UnimplementedError();
  }

  @override
  TaskEither<Exception, List<Post>> getPosts() {
    return TaskEither(() async {
      try {
        final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
        final response = await http.get(url);

        if (response.statusCode != 200) {
          return left(Exception("Couldn't get posts"));
        }

        final posts = (jsonDecode(response.body) as List)
            .map((e) => Post.fromMap(e as Map<String, dynamic>))
            .toList();
        return right(posts);
      } catch (e) {
        return left(Exception("Couldn't get posts"));
      }
    });
  }
}
