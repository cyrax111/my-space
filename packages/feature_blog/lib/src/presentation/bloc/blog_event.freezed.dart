// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BlogEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? tag) loadRequested,
    required TResult Function(String slug) postSelected,
    required TResult Function() postDeselected,
    required TResult Function() refreshRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? tag)? loadRequested,
    TResult? Function(String slug)? postSelected,
    TResult? Function()? postDeselected,
    TResult? Function()? refreshRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? tag)? loadRequested,
    TResult Function(String slug)? postSelected,
    TResult Function()? postDeselected,
    TResult Function()? refreshRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlogLoadRequested value) loadRequested,
    required TResult Function(BlogPostSelected value) postSelected,
    required TResult Function(BlogPostDeselected value) postDeselected,
    required TResult Function(BlogRefreshRequested value) refreshRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlogLoadRequested value)? loadRequested,
    TResult? Function(BlogPostSelected value)? postSelected,
    TResult? Function(BlogPostDeselected value)? postDeselected,
    TResult? Function(BlogRefreshRequested value)? refreshRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlogLoadRequested value)? loadRequested,
    TResult Function(BlogPostSelected value)? postSelected,
    TResult Function(BlogPostDeselected value)? postDeselected,
    TResult Function(BlogRefreshRequested value)? refreshRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogEventCopyWith<$Res> {
  factory $BlogEventCopyWith(BlogEvent value, $Res Function(BlogEvent) then) =
      _$BlogEventCopyWithImpl<$Res, BlogEvent>;
}

/// @nodoc
class _$BlogEventCopyWithImpl<$Res, $Val extends BlogEvent>
    implements $BlogEventCopyWith<$Res> {
  _$BlogEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlogEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$BlogLoadRequestedImplCopyWith<$Res> {
  factory _$$BlogLoadRequestedImplCopyWith(_$BlogLoadRequestedImpl value,
          $Res Function(_$BlogLoadRequestedImpl) then) =
      __$$BlogLoadRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? tag});
}

/// @nodoc
class __$$BlogLoadRequestedImplCopyWithImpl<$Res>
    extends _$BlogEventCopyWithImpl<$Res, _$BlogLoadRequestedImpl>
    implements _$$BlogLoadRequestedImplCopyWith<$Res> {
  __$$BlogLoadRequestedImplCopyWithImpl(_$BlogLoadRequestedImpl _value,
      $Res Function(_$BlogLoadRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlogEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = freezed,
  }) {
    return _then(_$BlogLoadRequestedImpl(
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BlogLoadRequestedImpl implements BlogLoadRequested {
  const _$BlogLoadRequestedImpl({this.tag});

  @override
  final String? tag;

  @override
  String toString() {
    return 'BlogEvent.loadRequested(tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogLoadRequestedImpl &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tag);

  /// Create a copy of BlogEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogLoadRequestedImplCopyWith<_$BlogLoadRequestedImpl> get copyWith =>
      __$$BlogLoadRequestedImplCopyWithImpl<_$BlogLoadRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? tag) loadRequested,
    required TResult Function(String slug) postSelected,
    required TResult Function() postDeselected,
    required TResult Function() refreshRequested,
  }) {
    return loadRequested(tag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? tag)? loadRequested,
    TResult? Function(String slug)? postSelected,
    TResult? Function()? postDeselected,
    TResult? Function()? refreshRequested,
  }) {
    return loadRequested?.call(tag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? tag)? loadRequested,
    TResult Function(String slug)? postSelected,
    TResult Function()? postDeselected,
    TResult Function()? refreshRequested,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(tag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlogLoadRequested value) loadRequested,
    required TResult Function(BlogPostSelected value) postSelected,
    required TResult Function(BlogPostDeselected value) postDeselected,
    required TResult Function(BlogRefreshRequested value) refreshRequested,
  }) {
    return loadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlogLoadRequested value)? loadRequested,
    TResult? Function(BlogPostSelected value)? postSelected,
    TResult? Function(BlogPostDeselected value)? postDeselected,
    TResult? Function(BlogRefreshRequested value)? refreshRequested,
  }) {
    return loadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlogLoadRequested value)? loadRequested,
    TResult Function(BlogPostSelected value)? postSelected,
    TResult Function(BlogPostDeselected value)? postDeselected,
    TResult Function(BlogRefreshRequested value)? refreshRequested,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(this);
    }
    return orElse();
  }
}

abstract class BlogLoadRequested implements BlogEvent {
  const factory BlogLoadRequested({final String? tag}) =
      _$BlogLoadRequestedImpl;

  String? get tag;

  /// Create a copy of BlogEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlogLoadRequestedImplCopyWith<_$BlogLoadRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BlogPostSelectedImplCopyWith<$Res> {
  factory _$$BlogPostSelectedImplCopyWith(_$BlogPostSelectedImpl value,
          $Res Function(_$BlogPostSelectedImpl) then) =
      __$$BlogPostSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String slug});
}

/// @nodoc
class __$$BlogPostSelectedImplCopyWithImpl<$Res>
    extends _$BlogEventCopyWithImpl<$Res, _$BlogPostSelectedImpl>
    implements _$$BlogPostSelectedImplCopyWith<$Res> {
  __$$BlogPostSelectedImplCopyWithImpl(_$BlogPostSelectedImpl _value,
      $Res Function(_$BlogPostSelectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlogEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
  }) {
    return _then(_$BlogPostSelectedImpl(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BlogPostSelectedImpl implements BlogPostSelected {
  const _$BlogPostSelectedImpl({required this.slug});

  @override
  final String slug;

  @override
  String toString() {
    return 'BlogEvent.postSelected(slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogPostSelectedImpl &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slug);

  /// Create a copy of BlogEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogPostSelectedImplCopyWith<_$BlogPostSelectedImpl> get copyWith =>
      __$$BlogPostSelectedImplCopyWithImpl<_$BlogPostSelectedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? tag) loadRequested,
    required TResult Function(String slug) postSelected,
    required TResult Function() postDeselected,
    required TResult Function() refreshRequested,
  }) {
    return postSelected(slug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? tag)? loadRequested,
    TResult? Function(String slug)? postSelected,
    TResult? Function()? postDeselected,
    TResult? Function()? refreshRequested,
  }) {
    return postSelected?.call(slug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? tag)? loadRequested,
    TResult Function(String slug)? postSelected,
    TResult Function()? postDeselected,
    TResult Function()? refreshRequested,
    required TResult orElse(),
  }) {
    if (postSelected != null) {
      return postSelected(slug);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlogLoadRequested value) loadRequested,
    required TResult Function(BlogPostSelected value) postSelected,
    required TResult Function(BlogPostDeselected value) postDeselected,
    required TResult Function(BlogRefreshRequested value) refreshRequested,
  }) {
    return postSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlogLoadRequested value)? loadRequested,
    TResult? Function(BlogPostSelected value)? postSelected,
    TResult? Function(BlogPostDeselected value)? postDeselected,
    TResult? Function(BlogRefreshRequested value)? refreshRequested,
  }) {
    return postSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlogLoadRequested value)? loadRequested,
    TResult Function(BlogPostSelected value)? postSelected,
    TResult Function(BlogPostDeselected value)? postDeselected,
    TResult Function(BlogRefreshRequested value)? refreshRequested,
    required TResult orElse(),
  }) {
    if (postSelected != null) {
      return postSelected(this);
    }
    return orElse();
  }
}

abstract class BlogPostSelected implements BlogEvent {
  const factory BlogPostSelected({required final String slug}) =
      _$BlogPostSelectedImpl;

  String get slug;

  /// Create a copy of BlogEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlogPostSelectedImplCopyWith<_$BlogPostSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BlogPostDeselectedImplCopyWith<$Res> {
  factory _$$BlogPostDeselectedImplCopyWith(_$BlogPostDeselectedImpl value,
          $Res Function(_$BlogPostDeselectedImpl) then) =
      __$$BlogPostDeselectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BlogPostDeselectedImplCopyWithImpl<$Res>
    extends _$BlogEventCopyWithImpl<$Res, _$BlogPostDeselectedImpl>
    implements _$$BlogPostDeselectedImplCopyWith<$Res> {
  __$$BlogPostDeselectedImplCopyWithImpl(_$BlogPostDeselectedImpl _value,
      $Res Function(_$BlogPostDeselectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlogEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BlogPostDeselectedImpl implements BlogPostDeselected {
  const _$BlogPostDeselectedImpl();

  @override
  String toString() {
    return 'BlogEvent.postDeselected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BlogPostDeselectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? tag) loadRequested,
    required TResult Function(String slug) postSelected,
    required TResult Function() postDeselected,
    required TResult Function() refreshRequested,
  }) {
    return postDeselected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? tag)? loadRequested,
    TResult? Function(String slug)? postSelected,
    TResult? Function()? postDeselected,
    TResult? Function()? refreshRequested,
  }) {
    return postDeselected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? tag)? loadRequested,
    TResult Function(String slug)? postSelected,
    TResult Function()? postDeselected,
    TResult Function()? refreshRequested,
    required TResult orElse(),
  }) {
    if (postDeselected != null) {
      return postDeselected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlogLoadRequested value) loadRequested,
    required TResult Function(BlogPostSelected value) postSelected,
    required TResult Function(BlogPostDeselected value) postDeselected,
    required TResult Function(BlogRefreshRequested value) refreshRequested,
  }) {
    return postDeselected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlogLoadRequested value)? loadRequested,
    TResult? Function(BlogPostSelected value)? postSelected,
    TResult? Function(BlogPostDeselected value)? postDeselected,
    TResult? Function(BlogRefreshRequested value)? refreshRequested,
  }) {
    return postDeselected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlogLoadRequested value)? loadRequested,
    TResult Function(BlogPostSelected value)? postSelected,
    TResult Function(BlogPostDeselected value)? postDeselected,
    TResult Function(BlogRefreshRequested value)? refreshRequested,
    required TResult orElse(),
  }) {
    if (postDeselected != null) {
      return postDeselected(this);
    }
    return orElse();
  }
}

abstract class BlogPostDeselected implements BlogEvent {
  const factory BlogPostDeselected() = _$BlogPostDeselectedImpl;
}

/// @nodoc
abstract class _$$BlogRefreshRequestedImplCopyWith<$Res> {
  factory _$$BlogRefreshRequestedImplCopyWith(_$BlogRefreshRequestedImpl value,
          $Res Function(_$BlogRefreshRequestedImpl) then) =
      __$$BlogRefreshRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BlogRefreshRequestedImplCopyWithImpl<$Res>
    extends _$BlogEventCopyWithImpl<$Res, _$BlogRefreshRequestedImpl>
    implements _$$BlogRefreshRequestedImplCopyWith<$Res> {
  __$$BlogRefreshRequestedImplCopyWithImpl(_$BlogRefreshRequestedImpl _value,
      $Res Function(_$BlogRefreshRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlogEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BlogRefreshRequestedImpl implements BlogRefreshRequested {
  const _$BlogRefreshRequestedImpl();

  @override
  String toString() {
    return 'BlogEvent.refreshRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogRefreshRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? tag) loadRequested,
    required TResult Function(String slug) postSelected,
    required TResult Function() postDeselected,
    required TResult Function() refreshRequested,
  }) {
    return refreshRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? tag)? loadRequested,
    TResult? Function(String slug)? postSelected,
    TResult? Function()? postDeselected,
    TResult? Function()? refreshRequested,
  }) {
    return refreshRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? tag)? loadRequested,
    TResult Function(String slug)? postSelected,
    TResult Function()? postDeselected,
    TResult Function()? refreshRequested,
    required TResult orElse(),
  }) {
    if (refreshRequested != null) {
      return refreshRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlogLoadRequested value) loadRequested,
    required TResult Function(BlogPostSelected value) postSelected,
    required TResult Function(BlogPostDeselected value) postDeselected,
    required TResult Function(BlogRefreshRequested value) refreshRequested,
  }) {
    return refreshRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlogLoadRequested value)? loadRequested,
    TResult? Function(BlogPostSelected value)? postSelected,
    TResult? Function(BlogPostDeselected value)? postDeselected,
    TResult? Function(BlogRefreshRequested value)? refreshRequested,
  }) {
    return refreshRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlogLoadRequested value)? loadRequested,
    TResult Function(BlogPostSelected value)? postSelected,
    TResult Function(BlogPostDeselected value)? postDeselected,
    TResult Function(BlogRefreshRequested value)? refreshRequested,
    required TResult orElse(),
  }) {
    if (refreshRequested != null) {
      return refreshRequested(this);
    }
    return orElse();
  }
}

abstract class BlogRefreshRequested implements BlogEvent {
  const factory BlogRefreshRequested() = _$BlogRefreshRequestedImpl;
}
