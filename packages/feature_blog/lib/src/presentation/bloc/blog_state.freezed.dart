// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BlogState {
  BlogStatus get status => throw _privateConstructorUsedError;
  List<BlogPost> get posts => throw _privateConstructorUsedError;
  String? get activeTag => throw _privateConstructorUsedError;
  BlogPost? get selectedPost => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlogStateCopyWith<BlogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogStateCopyWith<$Res> {
  factory $BlogStateCopyWith(BlogState value, $Res Function(BlogState) then) =
      _$BlogStateCopyWithImpl<$Res, BlogState>;
  @useResult
  $Res call(
      {BlogStatus status,
      List<BlogPost> posts,
      String? activeTag,
      BlogPost? selectedPost,
      String? errorMessage});
}

/// @nodoc
class _$BlogStateCopyWithImpl<$Res, $Val extends BlogState>
    implements $BlogStateCopyWith<$Res> {
  _$BlogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? posts = null,
    Object? activeTag = freezed,
    Object? selectedPost = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BlogStatus,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<BlogPost>,
      activeTag: freezed == activeTag
          ? _value.activeTag
          : activeTag // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedPost: freezed == selectedPost
          ? _value.selectedPost
          : selectedPost // ignore: cast_nullable_to_non_nullable
              as BlogPost?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlogStateImplCopyWith<$Res>
    implements $BlogStateCopyWith<$Res> {
  factory _$$BlogStateImplCopyWith(
          _$BlogStateImpl value, $Res Function(_$BlogStateImpl) then) =
      __$$BlogStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlogStatus status,
      List<BlogPost> posts,
      String? activeTag,
      BlogPost? selectedPost,
      String? errorMessage});
}

/// @nodoc
class __$$BlogStateImplCopyWithImpl<$Res>
    extends _$BlogStateCopyWithImpl<$Res, _$BlogStateImpl>
    implements _$$BlogStateImplCopyWith<$Res> {
  __$$BlogStateImplCopyWithImpl(
      _$BlogStateImpl _value, $Res Function(_$BlogStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? posts = null,
    Object? activeTag = freezed,
    Object? selectedPost = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$BlogStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BlogStatus,
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<BlogPost>,
      activeTag: freezed == activeTag
          ? _value.activeTag
          : activeTag // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedPost: freezed == selectedPost
          ? _value.selectedPost
          : selectedPost // ignore: cast_nullable_to_non_nullable
              as BlogPost?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BlogStateImpl implements _BlogState {
  const _$BlogStateImpl(
      {this.status = BlogStatus.initial,
      final List<BlogPost> posts = const [],
      this.activeTag,
      this.selectedPost,
      this.errorMessage})
      : _posts = posts;

  @override
  @JsonKey()
  final BlogStatus status;
  final List<BlogPost> _posts;
  @override
  @JsonKey()
  List<BlogPost> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final String? activeTag;
  @override
  final BlogPost? selectedPost;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'BlogState(status: $status, posts: $posts, activeTag: $activeTag, selectedPost: $selectedPost, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.activeTag, activeTag) ||
                other.activeTag == activeTag) &&
            (identical(other.selectedPost, selectedPost) ||
                other.selectedPost == selectedPost) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_posts), activeTag, selectedPost, errorMessage);

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogStateImplCopyWith<_$BlogStateImpl> get copyWith =>
      __$$BlogStateImplCopyWithImpl<_$BlogStateImpl>(this, _$identity);
}

abstract class _BlogState implements BlogState {
  const factory _BlogState(
      {final BlogStatus status,
      final List<BlogPost> posts,
      final String? activeTag,
      final BlogPost? selectedPost,
      final String? errorMessage}) = _$BlogStateImpl;

  @override
  BlogStatus get status;
  @override
  List<BlogPost> get posts;
  @override
  String? get activeTag;
  @override
  BlogPost? get selectedPost;
  @override
  String? get errorMessage;

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlogStateImplCopyWith<_$BlogStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
