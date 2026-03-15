// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContactState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() submitting,
    required TResult Function() success,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? submitting,
    TResult? Function()? success,
    TResult? Function(String message, Map<String, String>? fieldErrors)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? submitting,
    TResult Function()? success,
    TResult Function(String message, Map<String, String>? fieldErrors)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ContactInitial value) initial,
    required TResult Function(ContactSubmitting value) submitting,
    required TResult Function(ContactSuccess value) success,
    required TResult Function(ContactError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ContactInitial value)? initial,
    TResult? Function(ContactSubmitting value)? submitting,
    TResult? Function(ContactSuccess value)? success,
    TResult? Function(ContactError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ContactInitial value)? initial,
    TResult Function(ContactSubmitting value)? submitting,
    TResult Function(ContactSuccess value)? success,
    TResult Function(ContactError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactStateCopyWith<$Res> {
  factory $ContactStateCopyWith(
          ContactState value, $Res Function(ContactState) then) =
      _$ContactStateCopyWithImpl<$Res, ContactState>;
}

/// @nodoc
class _$ContactStateCopyWithImpl<$Res, $Val extends ContactState>
    implements $ContactStateCopyWith<$Res> {
  _$ContactStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ContactInitialImplCopyWith<$Res> {
  factory _$$ContactInitialImplCopyWith(_$ContactInitialImpl value,
          $Res Function(_$ContactInitialImpl) then) =
      __$$ContactInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ContactInitialImplCopyWithImpl<$Res>
    extends _$ContactStateCopyWithImpl<$Res, _$ContactInitialImpl>
    implements _$$ContactInitialImplCopyWith<$Res> {
  __$$ContactInitialImplCopyWithImpl(
      _$ContactInitialImpl _value, $Res Function(_$ContactInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ContactInitialImpl implements ContactInitial {
  const _$ContactInitialImpl();

  @override
  String toString() {
    return 'ContactState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ContactInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() submitting,
    required TResult Function() success,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? submitting,
    TResult? Function()? success,
    TResult? Function(String message, Map<String, String>? fieldErrors)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? submitting,
    TResult Function()? success,
    TResult Function(String message, Map<String, String>? fieldErrors)? error,
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
    required TResult Function(ContactInitial value) initial,
    required TResult Function(ContactSubmitting value) submitting,
    required TResult Function(ContactSuccess value) success,
    required TResult Function(ContactError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ContactInitial value)? initial,
    TResult? Function(ContactSubmitting value)? submitting,
    TResult? Function(ContactSuccess value)? success,
    TResult? Function(ContactError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ContactInitial value)? initial,
    TResult Function(ContactSubmitting value)? submitting,
    TResult Function(ContactSuccess value)? success,
    TResult Function(ContactError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ContactInitial implements ContactState {
  const factory ContactInitial() = _$ContactInitialImpl;
}

/// @nodoc
abstract class _$$ContactSubmittingImplCopyWith<$Res> {
  factory _$$ContactSubmittingImplCopyWith(_$ContactSubmittingImpl value,
          $Res Function(_$ContactSubmittingImpl) then) =
      __$$ContactSubmittingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ContactSubmittingImplCopyWithImpl<$Res>
    extends _$ContactStateCopyWithImpl<$Res, _$ContactSubmittingImpl>
    implements _$$ContactSubmittingImplCopyWith<$Res> {
  __$$ContactSubmittingImplCopyWithImpl(_$ContactSubmittingImpl _value,
      $Res Function(_$ContactSubmittingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ContactSubmittingImpl implements ContactSubmitting {
  const _$ContactSubmittingImpl();

  @override
  String toString() {
    return 'ContactState.submitting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ContactSubmittingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() submitting,
    required TResult Function() success,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        error,
  }) {
    return submitting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? submitting,
    TResult? Function()? success,
    TResult? Function(String message, Map<String, String>? fieldErrors)? error,
  }) {
    return submitting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? submitting,
    TResult Function()? success,
    TResult Function(String message, Map<String, String>? fieldErrors)? error,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ContactInitial value) initial,
    required TResult Function(ContactSubmitting value) submitting,
    required TResult Function(ContactSuccess value) success,
    required TResult Function(ContactError value) error,
  }) {
    return submitting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ContactInitial value)? initial,
    TResult? Function(ContactSubmitting value)? submitting,
    TResult? Function(ContactSuccess value)? success,
    TResult? Function(ContactError value)? error,
  }) {
    return submitting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ContactInitial value)? initial,
    TResult Function(ContactSubmitting value)? submitting,
    TResult Function(ContactSuccess value)? success,
    TResult Function(ContactError value)? error,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting(this);
    }
    return orElse();
  }
}

abstract class ContactSubmitting implements ContactState {
  const factory ContactSubmitting() = _$ContactSubmittingImpl;
}

/// @nodoc
abstract class _$$ContactSuccessImplCopyWith<$Res> {
  factory _$$ContactSuccessImplCopyWith(_$ContactSuccessImpl value,
          $Res Function(_$ContactSuccessImpl) then) =
      __$$ContactSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ContactSuccessImplCopyWithImpl<$Res>
    extends _$ContactStateCopyWithImpl<$Res, _$ContactSuccessImpl>
    implements _$$ContactSuccessImplCopyWith<$Res> {
  __$$ContactSuccessImplCopyWithImpl(
      _$ContactSuccessImpl _value, $Res Function(_$ContactSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ContactSuccessImpl implements ContactSuccess {
  const _$ContactSuccessImpl();

  @override
  String toString() {
    return 'ContactState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ContactSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() submitting,
    required TResult Function() success,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? submitting,
    TResult? Function()? success,
    TResult? Function(String message, Map<String, String>? fieldErrors)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? submitting,
    TResult Function()? success,
    TResult Function(String message, Map<String, String>? fieldErrors)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ContactInitial value) initial,
    required TResult Function(ContactSubmitting value) submitting,
    required TResult Function(ContactSuccess value) success,
    required TResult Function(ContactError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ContactInitial value)? initial,
    TResult? Function(ContactSubmitting value)? submitting,
    TResult? Function(ContactSuccess value)? success,
    TResult? Function(ContactError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ContactInitial value)? initial,
    TResult Function(ContactSubmitting value)? submitting,
    TResult Function(ContactSuccess value)? success,
    TResult Function(ContactError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ContactSuccess implements ContactState {
  const factory ContactSuccess() = _$ContactSuccessImpl;
}

/// @nodoc
abstract class _$$ContactErrorImplCopyWith<$Res> {
  factory _$$ContactErrorImplCopyWith(
          _$ContactErrorImpl value, $Res Function(_$ContactErrorImpl) then) =
      __$$ContactErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, Map<String, String>? fieldErrors});
}

/// @nodoc
class __$$ContactErrorImplCopyWithImpl<$Res>
    extends _$ContactStateCopyWithImpl<$Res, _$ContactErrorImpl>
    implements _$$ContactErrorImplCopyWith<$Res> {
  __$$ContactErrorImplCopyWithImpl(
      _$ContactErrorImpl _value, $Res Function(_$ContactErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? fieldErrors = freezed,
  }) {
    return _then(_$ContactErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      fieldErrors: freezed == fieldErrors
          ? _value._fieldErrors
          : fieldErrors // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc

class _$ContactErrorImpl implements ContactError {
  const _$ContactErrorImpl(
      {required this.message, final Map<String, String>? fieldErrors})
      : _fieldErrors = fieldErrors;

  @override
  final String message;
  final Map<String, String>? _fieldErrors;
  @override
  Map<String, String>? get fieldErrors {
    final value = _fieldErrors;
    if (value == null) return null;
    if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ContactState.error(message: $message, fieldErrors: $fieldErrors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._fieldErrors, _fieldErrors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_fieldErrors));

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactErrorImplCopyWith<_$ContactErrorImpl> get copyWith =>
      __$$ContactErrorImplCopyWithImpl<_$ContactErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() submitting,
    required TResult Function() success,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        error,
  }) {
    return error(message, fieldErrors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? submitting,
    TResult? Function()? success,
    TResult? Function(String message, Map<String, String>? fieldErrors)? error,
  }) {
    return error?.call(message, fieldErrors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? submitting,
    TResult Function()? success,
    TResult Function(String message, Map<String, String>? fieldErrors)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, fieldErrors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ContactInitial value) initial,
    required TResult Function(ContactSubmitting value) submitting,
    required TResult Function(ContactSuccess value) success,
    required TResult Function(ContactError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ContactInitial value)? initial,
    TResult? Function(ContactSubmitting value)? submitting,
    TResult? Function(ContactSuccess value)? success,
    TResult? Function(ContactError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ContactInitial value)? initial,
    TResult Function(ContactSubmitting value)? submitting,
    TResult Function(ContactSuccess value)? success,
    TResult Function(ContactError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ContactError implements ContactState {
  const factory ContactError(
      {required final String message,
      final Map<String, String>? fieldErrors}) = _$ContactErrorImpl;

  String get message;
  Map<String, String>? get fieldErrors;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactErrorImplCopyWith<_$ContactErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
