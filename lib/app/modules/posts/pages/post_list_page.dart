import 'package:ca_flutter/app/modules/posts/blocs/post_list_cubit.dart';
import 'package:ca_flutter/business/posts/application/find/find.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostListCubit(
        getPostsUseCase: Modular.get<GetPostsUseCase>(),
      )..loadPosts(),
      child: const PostListView(),
    );
  }
}

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocListener<PostListCubit, PostListState>(
        listener: (context, state) {
          if (state.status == PostListStateStatus.error) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('Error loading posts'),
                ),
              );
          }
        },
        child: const PostList(),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostListCubit, PostListState>(
      builder: (context, state) {
        if (state.status == PostListStateStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.status == PostListStateStatus.error) {
          return Center(
            child: ElevatedButton(
              onPressed: () => context.read<PostListCubit>().loadPosts(),
              child: const Text('Try again'),
            ),
          );
        }

        final posts = state.posts;
        return Column(
          children: [
            ElevatedButton(
              onPressed: () => context.read<PostListCubit>().loadPosts(),
              child: const Text('Reload'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: posts.length,
                separatorBuilder: (_, __) => const Divider(height: 24),
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    title: Text(
                      '${index + 1} - ${post.title}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      post.body,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    dense: true,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
