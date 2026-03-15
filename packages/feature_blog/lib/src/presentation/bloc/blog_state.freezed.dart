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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<BlogPost> posts, String? activeTag, BlogPost? selectedPost)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<BlogPost> posts, String? activeTag, BlogPost? selectedPost)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<BlogPost> posts, String? activeTag, BlogPost? selectedPost)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlogInitial value) initial,
    required TResult Function(BlogLoading value) loading,
    required TResult Function(BlogLoaded value) loaded,
    required TResult Function(BlogError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlogInitial value)? initial,
    TResult? Function(BlogLoading value)? loading,
    TResult? Function(BlogLoaded value)? loaded,
    TResult? Function(BlogError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlogInitial value)? initial,
    TResult Function(BlogLoading value)? loading,
    TResult Function(BlogLoaded value)? loaded,
    TResult Function(BlogError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogStateCopyWith<$Res> {
  factory $BlogStateCopyWith(BlogState value, $Res Function(BlogState) then) =
      _$BlogStateCopyWithImpl<$Res, BlogState>;
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
}

/// @nodoc
abstract class _$$BlogInitialImplCopyWith<$Res> {
  factory _$$BlogInitialImplCopyWith(
          _$BlogInitialImpl value, $Res Function(_$BlogInitialImpl) then) =
      __$$BlogInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BlogInitialImplCopyWithImpl<$Res>
    extends _$BlogStateCopyWithImpl<$Res, _$BlogInitialImpl>
    implements _$$BlogInitialImplCopyWith<$Res> {
  __$$BlogInitialImplCopyWithImpl(
      _$BlogInitialImpl _value, $Res Function(_$BlogInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BlogInitialImpl implements BlogInitial {
  const _$BlogInitialImpl();

  @override
  String toString() {
    return 'BlogState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BlogInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<BlogPost> posts, String? activeTag, BlogPost? selectedPost)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<BlogPost> posts, String? activeTag, BlogPost? selectedPost)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<BlogPost> posts, String? activeTag, BlogPost? selectedPost)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlogInitial value) initial,
    required TResult Function(BlogLoading value) loading,
    required TResult Function(BlogLoaded value) loaded,
    required TResult Function(BlogError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlogInitial value)? initial,
    TResult? Function(BlogLoading value)? loading,
    TResult? Function(BlogLoaded value)? loaded,
    TResult? Function(BlogError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlogInitial value)? initial,
    TResult Function(BlogLoading value)? loading,
    TResult Function(BlogLoaded value)? loaded,
    TResult Function(BlogError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BlogInitial implements BlogState {
  const factory BlogInitial() = _$BlogInitialImpl;
}

/// @nodoc
abstract class _$$BlogLoadingImplCopyWith<$Res> {
  factory _$$BlogLoadingImplCopyWith(
          _$BlogLoadingImpl value, $Res Function(_$BlogLoadingImpl) then) =
      __$$BlogLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BlogLoadingImplCopyWithImpl<$Res>
    extends _$BlogStateCopyWithImpl<$Res, _$BlogLoadingImpl>
    implements _$$BlogLoadingImplCopyWith<$Res> {
  __$$BlogLoadingImplCopyWithImpl(
      _$BlogLoadingImpl _value, $Res Function(_$BlogLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BlogLoadingImpl implements BlogLoading {
  const _$BlogLoadingImpl();

  @override
  String toString() {
    return 'BlogState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BlogLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<BlogPost> posts, String? activeTag, BlogPost? selectedPost)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<BlogPost> posts, String? activeTag, BlogPost? selectedPost)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<BlogPost> posts, String? activeTag, BlogPost? selectedPost)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlogInitial value) initial,
    required TResult Function(BlogLoading value) loading,
    required TResult Function(BlogLoaded value) loaded,
    required TResult Function(BlogError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlogInitial value)? initial,
    TResult? Function(BlogLoading value)? loading,
    TResult? Function(BlogLoaded value)? loaded,
    TResult? Function(BlogError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlogInitial value)? initial,
    TResult Function(BlogLoading value)? loading,
    TResult Function(BlogLoaded value)? loaded,
    TResult Function(BlogError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BlogLoading implements BlogState {
  const factory BlogLoading() = _$BlogLoadingImpl;
}

/// @nodoc
abstract class _$$BlogLoadedImplCopyWith<$Res> {
  factory _$$BlogLoadedImplCopyWith(
          _$BlogLoadedImpl value, $Res Function(_$BlogLoadedImpl) then) =
      __$$BlogLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BlogPost> posts, String? activeTag, BlogPost? selectedPost});

  $BlogPostCopyWith<$Res>? get selectedPost;
}

/// @nodoc
class __$$BlogLoadedImplCopyWithImpl<$Res>
    extends _$BlogStateCopyWithImpl<$Res, _$BlogLoadedImpl>
    implements _$$BlogLoadedImplCopyWith<$Res> {
  __$$BlogLoadedImplCopyWithImpl(
      _$BlogLoadedImpl _value, $Res Function(_$BlogLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? activeTag = freezed,
    Object? selectedPost = freezed,
  }) {
    return _then(_$BlogLoadedImpl(
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
    ));
  }

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BlogPostCopyWith<$Res>? get selectedPost {
    if (_value.selectedPost == null) {
      return null;
    }

    return $BlogPostCopyWith<$Res>(_value.selectedPost!, (value) {
      return _then(_value.copyWith(selectedPost: value));
    });
  }
}

/// @nodoc

class _$BlogLoadedImpl implements BlogLoaded {
  const _$BlogLoadedImpl(
      {required final List<BlogPost> posts, this.activeTag, this.selectedPost})
      : _posts = posts;

  final List<BlogPost> _posts;
  @override
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
  String toString() {
    return 'BlogState.loaded(posts: $posts, activeTag: $activeTag, selectedPost: $selectedPost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogLoadedImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.activeTag, activeTag) ||
                other.activeTag == activeTag) &&
            (identical(other.selectedPost, selectedPost) ||
                other.selectedPost == selectedPost));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_posts), activeTag, selectedPost);

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogLoadedImplCopyWith<_$BlogLoadedImpl> get copyWith =>
      __$$BlogLoadedImplCopyWithImpl<_$BlogLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<BlogPost> posts, String? activeTag, BlogPost? selectedPost)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(posts, activeTag, selectedPost);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<BlogPost> posts, String? activeTag, BlogPost? selectedPost)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(posts, activeTag, selectedPost);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<BlogPost> posts, String? activeTag, BlogPost? selectedPost)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(posts, activeTag, selectedPost);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlogInitial value) initial,
    required TResult Function(BlogLoading value) loading,
    required TResult Function(BlogLoaded value) loaded,
    required TResult Function(BlogError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlogInitial value)? initial,
    TResult? Function(BlogLoading value)? loading,
    TResult? Function(BlogLoaded value)? loaded,
    TResult? Function(BlogError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlogInitial value)? initial,
    TResult Function(BlogLoading value)? loading,
    TResult Function(BlogLoaded value)? loaded,
    TResult Function(BlogError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class BlogLoaded implements BlogState {
  const factory BlogLoaded(
      {required final List<BlogPost> posts,
      final String? activeTag,
      final BlogPost? selectedPost}) = _$BlogLoadedImpl;

  List<BlogPost> get posts;
  String? get activeTag;
  BlogPost? get selectedPost;

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlogLoadedImplCopyWith<_$BlogLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BlogErrorImplCopyWith<$Res> {
  factory _$$BlogErrorImplCopyWith(
          _$BlogErrorImpl value, $Res Function(_$BlogErrorImpl) then) =
      __$$BlogErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BlogErrorImplCopyWithImpl<$Res>
    extends _$BlogStateCopyWithImpl<$Res, _$BlogErrorImpl>
    implements _$$BlogErrorImplCopyWith<$Res> {
  __$$BlogErrorImplCopyWithImpl(
      _$BlogErrorImpl _value, $Res Function(_$BlogErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$BlogErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BlogErrorImpl implements BlogError {
  const _$BlogErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'BlogState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogErrorImplCopyWith<_$BlogErrorImpl> get copyWith =>
      __$$BlogErrorImplCopyWithImpl<_$BlogErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<BlogPost> posts, String? activeTag, BlogPost? selectedPost)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<BlogPost> posts, String? activeTag, BlogPost? selectedPost)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<BlogPost> posts, String? activeTag, BlogPost? selectedPost)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlogInitial value) initial,
    required TResult Function(BlogLoading value) loading,
    required TResult Function(BlogLoaded value) loaded,
    required TResult Function(BlogError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlogInitial value)? initial,
    TResult? Function(BlogLoading value)? loading,
    TResult? Function(BlogLoaded value)? loaded,
    TResult? Function(BlogError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlogInitial value)? initial,
    TResult Function(BlogLoading value)? loading,
    TResult Function(BlogLoaded value)? loaded,
    TResult Function(BlogError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BlogError implements BlogState {
  const factory BlogError({required final String message}) = _$BlogErrorImpl;

  String get message;

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlogErrorImplCopyWith<_$BlogErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
