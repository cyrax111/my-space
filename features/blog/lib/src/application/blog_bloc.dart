import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/blog_repository.dart';
import 'blog_state.dart';

class BlogBloc extends Cubit<BlogState> {
  BlogBloc(this._repository) : super(const BlogState(items: <dynamic>[]));

  final BlogRepository _repository;

  Future<void> load() async {
    emit(BlogState(items: state.items, isLoading: true));
    final result = await _repository.getAll();
    emit(BlogState(items: result));
  }
}
