import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:core_domain/core_domain.dart';
import '../../domain/entities/post.dart';
import '../../domain/use_cases/get_posts_use_case.dart';

part 'post_event.dart';
part 'post_state.dart';
part 'post_bloc.freezed.dart';

@injectable
class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPostsUseCase _getPostsUseCase;

  PostBloc(this._getPostsUseCase) : super(const PostState.initial()) {
    on<_LoadPosts>(_onLoadPosts);
  }

  Future<void> _onLoadPosts(
    _LoadPosts event,
    Emitter<PostState> emit,
  ) async {
    emit(const PostState.loading());
    
    final result = await _getPostsUseCase();
    
    result.fold(
      (failure) => emit(PostState.error(failure)),
      (posts) => emit(PostState.loaded(posts)),
    );
  }
}
