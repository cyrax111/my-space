// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PortfolioEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProjectType? type) loadRequested,
    required TResult Function() refreshRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProjectType? type)? loadRequested,
    TResult? Function()? refreshRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProjectType? type)? loadRequested,
    TResult Function()? refreshRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioLoadRequested value) loadRequested,
    required TResult Function(PortfolioRefreshRequested value) refreshRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PortfolioLoadRequested value)? loadRequested,
    TResult? Function(PortfolioRefreshRequested value)? refreshRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioLoadRequested value)? loadRequested,
    TResult Function(PortfolioRefreshRequested value)? refreshRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioEventCopyWith<$Res> {
  factory $PortfolioEventCopyWith(
          PortfolioEvent value, $Res Function(PortfolioEvent) then) =
      _$PortfolioEventCopyWithImpl<$Res, PortfolioEvent>;
}

/// @nodoc
class _$PortfolioEventCopyWithImpl<$Res, $Val extends PortfolioEvent>
    implements $PortfolioEventCopyWith<$Res> {
  _$PortfolioEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PortfolioEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PortfolioLoadRequestedImplCopyWith<$Res> {
  factory _$$PortfolioLoadRequestedImplCopyWith(
          _$PortfolioLoadRequestedImpl value,
          $Res Function(_$PortfolioLoadRequestedImpl) then) =
      __$$PortfolioLoadRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProjectType? type});
}

/// @nodoc
class __$$PortfolioLoadRequestedImplCopyWithImpl<$Res>
    extends _$PortfolioEventCopyWithImpl<$Res, _$PortfolioLoadRequestedImpl>
    implements _$$PortfolioLoadRequestedImplCopyWith<$Res> {
  __$$PortfolioLoadRequestedImplCopyWithImpl(
      _$PortfolioLoadRequestedImpl _value,
      $Res Function(_$PortfolioLoadRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PortfolioEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_$PortfolioLoadRequestedImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProjectType?,
    ));
  }
}

/// @nodoc

class _$PortfolioLoadRequestedImpl implements PortfolioLoadRequested {
  const _$PortfolioLoadRequestedImpl({this.type});

  @override
  final ProjectType? type;

  @override
  String toString() {
    return 'PortfolioEvent.loadRequested(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioLoadRequestedImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of PortfolioEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioLoadRequestedImplCopyWith<_$PortfolioLoadRequestedImpl>
      get copyWith => __$$PortfolioLoadRequestedImplCopyWithImpl<
          _$PortfolioLoadRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProjectType? type) loadRequested,
    required TResult Function() refreshRequested,
  }) {
    return loadRequested(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProjectType? type)? loadRequested,
    TResult? Function()? refreshRequested,
  }) {
    return loadRequested?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProjectType? type)? loadRequested,
    TResult Function()? refreshRequested,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioLoadRequested value) loadRequested,
    required TResult Function(PortfolioRefreshRequested value) refreshRequested,
  }) {
    return loadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PortfolioLoadRequested value)? loadRequested,
    TResult? Function(PortfolioRefreshRequested value)? refreshRequested,
  }) {
    return loadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioLoadRequested value)? loadRequested,
    TResult Function(PortfolioRefreshRequested value)? refreshRequested,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(this);
    }
    return orElse();
  }
}

abstract class PortfolioLoadRequested implements PortfolioEvent {
  const factory PortfolioLoadRequested({final ProjectType? type}) =
      _$PortfolioLoadRequestedImpl;

  ProjectType? get type;

  /// Create a copy of PortfolioEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PortfolioLoadRequestedImplCopyWith<_$PortfolioLoadRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PortfolioRefreshRequestedImplCopyWith<$Res> {
  factory _$$PortfolioRefreshRequestedImplCopyWith(
          _$PortfolioRefreshRequestedImpl value,
          $Res Function(_$PortfolioRefreshRequestedImpl) then) =
      __$$PortfolioRefreshRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PortfolioRefreshRequestedImplCopyWithImpl<$Res>
    extends _$PortfolioEventCopyWithImpl<$Res, _$PortfolioRefreshRequestedImpl>
    implements _$$PortfolioRefreshRequestedImplCopyWith<$Res> {
  __$$PortfolioRefreshRequestedImplCopyWithImpl(
      _$PortfolioRefreshRequestedImpl _value,
      $Res Function(_$PortfolioRefreshRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PortfolioEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PortfolioRefreshRequestedImpl implements PortfolioRefreshRequested {
  const _$PortfolioRefreshRequestedImpl();

  @override
  String toString() {
    return 'PortfolioEvent.refreshRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioRefreshRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProjectType? type) loadRequested,
    required TResult Function() refreshRequested,
  }) {
    return refreshRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProjectType? type)? loadRequested,
    TResult? Function()? refreshRequested,
  }) {
    return refreshRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProjectType? type)? loadRequested,
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
    required TResult Function(PortfolioLoadRequested value) loadRequested,
    required TResult Function(PortfolioRefreshRequested value) refreshRequested,
  }) {
    return refreshRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PortfolioLoadRequested value)? loadRequested,
    TResult? Function(PortfolioRefreshRequested value)? refreshRequested,
  }) {
    return refreshRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioLoadRequested value)? loadRequested,
    TResult Function(PortfolioRefreshRequested value)? refreshRequested,
    required TResult orElse(),
  }) {
    if (refreshRequested != null) {
      return refreshRequested(this);
    }
    return orElse();
  }
}

abstract class PortfolioRefreshRequested implements PortfolioEvent {
  const factory PortfolioRefreshRequested() = _$PortfolioRefreshRequestedImpl;
}
