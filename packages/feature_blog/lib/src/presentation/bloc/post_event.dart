part of 'post_bloc.dart';

@freezed
sealed class PostEvent with _$PostEvent {
  const factory PostEvent.loadPosts() = _LoadPosts;
  const factory PostEvent.loadPost(String id) = _LoadPost;
  const factory PostEvent.createPost(Post post) = _CreatePost;
  const factory PostEvent.updatePost(Post post) = _UpdatePost;
  const factory PostEvent.deletePost(String id) = _DeletePost;
}
