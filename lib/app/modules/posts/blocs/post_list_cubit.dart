import 'package:bloc/bloc.dart';
import 'package:ca_flutter/business/posts/application/find/find.dart';
import 'package:ca_flutter/business/posts/domain/entities/post.dart';

enum PostListStateStatus { initial, loading, loaded, error }

class PostListState {
  const PostListState({
    this.posts = const [],
    this.status = PostListStateStatus.initial,
    this.error = '',
  });

  final List<Post> posts;
  final PostListStateStatus status;
  final String error;

  PostListState copyWith({
    List<Post>? posts,
    PostListStateStatus? status,
    String? error,
  }) {
    return PostListState(
      posts: posts ?? this.posts,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}

class PostListCubit extends Cubit<PostListState> {
  PostListCubit({
    required this.getPostsUseCase,
  }) : super(const PostListState());

  final GetPostsUseCase getPostsUseCase;

  Future<void> loadPosts() async {
    emit(state.copyWith(status: PostListStateStatus.loading));

    final result = await getPostsUseCase().run();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: PostListStateStatus.error,
            error: failure.toString(),
          ),
        );
      },
      (posts) {
        emit(
          state.copyWith(
            posts: posts,
            status: PostListStateStatus.loaded,
          ),
        );
      },
    );
  }
}
