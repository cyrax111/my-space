import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_event.freezed.dart';

/// Events for the blog feature BLoC.
@freezed
sealed class BlogEvent with _$BlogEvent {
  /// Load blog posts, optionally filtered by [tag].
  const factory BlogEvent.loadRequested({String? tag}) = BlogLoadRequested;

  /// Load a single blog post by [slug].
  const factory BlogEvent.postSelected({required String slug}) =
      BlogPostSelected;

  /// Clear the selected post (go back to list).
  const factory BlogEvent.postDeselected() = BlogPostDeselected;

  /// Refresh the current post list.
  const factory BlogEvent.refreshRequested() = BlogRefreshRequested;
}
