// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContactEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String email, String subject, String message)
        submitRequested,
    required TResult Function() resetRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name, String email, String subject, String message)?
        submitRequested,
    TResult? Function()? resetRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String email, String subject, String message)?
        submitRequested,
    TResult Function()? resetRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ContactSubmitRequested value) submitRequested,
    required TResult Function(ContactResetRequested value) resetRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ContactSubmitRequested value)? submitRequested,
    TResult? Function(ContactResetRequested value)? resetRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ContactSubmitRequested value)? submitRequested,
    TResult Function(ContactResetRequested value)? resetRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactEventCopyWith<$Res> {
  factory $ContactEventCopyWith(
          ContactEvent value, $Res Function(ContactEvent) then) =
      _$ContactEventCopyWithImpl<$Res, ContactEvent>;
}

/// @nodoc
class _$ContactEventCopyWithImpl<$Res, $Val extends ContactEvent>
    implements $ContactEventCopyWith<$Res> {
  _$ContactEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ContactSubmitRequestedImplCopyWith<$Res> {
  factory _$$ContactSubmitRequestedImplCopyWith(
          _$ContactSubmitRequestedImpl value,
          $Res Function(_$ContactSubmitRequestedImpl) then) =
      __$$ContactSubmitRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String email, String subject, String message});
}

/// @nodoc
class __$$ContactSubmitRequestedImplCopyWithImpl<$Res>
    extends _$ContactEventCopyWithImpl<$Res, _$ContactSubmitRequestedImpl>
    implements _$$ContactSubmitRequestedImplCopyWith<$Res> {
  __$$ContactSubmitRequestedImplCopyWithImpl(
      _$ContactSubmitRequestedImpl _value,
      $Res Function(_$ContactSubmitRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? subject = null,
    Object? message = null,
  }) {
    return _then(_$ContactSubmitRequestedImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ContactSubmitRequestedImpl implements ContactSubmitRequested {
  const _$ContactSubmitRequestedImpl(
      {required this.name,
      required this.email,
      required this.subject,
      required this.message});

  @override
  final String name;
  @override
  final String email;
  @override
  final String subject;
  @override
  final String message;

  @override
  String toString() {
    return 'ContactEvent.submitRequested(name: $name, email: $email, subject: $subject, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactSubmitRequestedImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, subject, message);

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactSubmitRequestedImplCopyWith<_$ContactSubmitRequestedImpl>
      get copyWith => __$$ContactSubmitRequestedImplCopyWithImpl<
          _$ContactSubmitRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String email, String subject, String message)
        submitRequested,
    required TResult Function() resetRequested,
  }) {
    return submitRequested(name, email, subject, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name, String email, String subject, String message)?
        submitRequested,
    TResult? Function()? resetRequested,
  }) {
    return submitRequested?.call(name, email, subject, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String email, String subject, String message)?
        submitRequested,
    TResult Function()? resetRequested,
    required TResult orElse(),
  }) {
    if (submitRequested != null) {
      return submitRequested(name, email, subject, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ContactSubmitRequested value) submitRequested,
    required TResult Function(ContactResetRequested value) resetRequested,
  }) {
    return submitRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ContactSubmitRequested value)? submitRequested,
    TResult? Function(ContactResetRequested value)? resetRequested,
  }) {
    return submitRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ContactSubmitRequested value)? submitRequested,
    TResult Function(ContactResetRequested value)? resetRequested,
    required TResult orElse(),
  }) {
    if (submitRequested != null) {
      return submitRequested(this);
    }
    return orElse();
  }
}

abstract class ContactSubmitRequested implements ContactEvent {
  const factory ContactSubmitRequested(
      {required final String name,
      required final String email,
      required final String subject,
      required final String message}) = _$ContactSubmitRequestedImpl;

  String get name;
  String get email;
  String get subject;
  String get message;

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactSubmitRequestedImplCopyWith<_$ContactSubmitRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContactResetRequestedImplCopyWith<$Res> {
  factory _$$ContactResetRequestedImplCopyWith(
          _$ContactResetRequestedImpl value,
          $Res Function(_$ContactResetRequestedImpl) then) =
      __$$ContactResetRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ContactResetRequestedImplCopyWithImpl<$Res>
    extends _$ContactEventCopyWithImpl<$Res, _$ContactResetRequestedImpl>
    implements _$$ContactResetRequestedImplCopyWith<$Res> {
  __$$ContactResetRequestedImplCopyWithImpl(_$ContactResetRequestedImpl _value,
      $Res Function(_$ContactResetRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ContactResetRequestedImpl implements ContactResetRequested {
  const _$ContactResetRequestedImpl();

  @override
  String toString() {
    return 'ContactEvent.resetRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactResetRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String email, String subject, String message)
        submitRequested,
    required TResult Function() resetRequested,
  }) {
    return resetRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name, String email, String subject, String message)?
        submitRequested,
    TResult? Function()? resetRequested,
  }) {
    return resetRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String email, String subject, String message)?
        submitRequested,
    TResult Function()? resetRequested,
    required TResult orElse(),
  }) {
    if (resetRequested != null) {
      return resetRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ContactSubmitRequested value) submitRequested,
    required TResult Function(ContactResetRequested value) resetRequested,
  }) {
    return resetRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ContactSubmitRequested value)? submitRequested,
    TResult? Function(ContactResetRequested value)? resetRequested,
  }) {
    return resetRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ContactSubmitRequested value)? submitRequested,
    TResult Function(ContactResetRequested value)? resetRequested,
    required TResult orElse(),
  }) {
    if (resetRequested != null) {
      return resetRequested(this);
    }
    return orElse();
  }
}

abstract class ContactResetRequested implements ContactEvent {
  const factory ContactResetRequested() = _$ContactResetRequestedImpl;
}
