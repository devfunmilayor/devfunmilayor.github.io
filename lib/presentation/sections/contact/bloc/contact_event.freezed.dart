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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ContactEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) nameChanged,
    required TResult Function(String value) emailChanged,
    required TResult Function(String value) companyChanged,
    required TResult Function(String value) messageChanged,
    required TResult Function() submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? nameChanged,
    TResult? Function(String value)? emailChanged,
    TResult? Function(String value)? companyChanged,
    TResult? Function(String value)? messageChanged,
    TResult? Function()? submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? nameChanged,
    TResult Function(String value)? emailChanged,
    TResult Function(String value)? companyChanged,
    TResult Function(String value)? messageChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_CompanyChanged value) companyChanged,
    required TResult Function(_MessageChanged value) messageChanged,
    required TResult Function(_Submitted value) submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_CompanyChanged value)? companyChanged,
    TResult? Function(_MessageChanged value)? messageChanged,
    TResult? Function(_Submitted value)? submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_CompanyChanged value)? companyChanged,
    TResult Function(_MessageChanged value)? messageChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactEventCopyWith<$Res> {
  factory $ContactEventCopyWith(
    ContactEvent value,
    $Res Function(ContactEvent) then,
  ) = _$ContactEventCopyWithImpl<$Res, ContactEvent>;
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
abstract class _$$NameChangedImplCopyWith<$Res> {
  factory _$$NameChangedImplCopyWith(
    _$NameChangedImpl value,
    $Res Function(_$NameChangedImpl) then,
  ) = __$$NameChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$NameChangedImplCopyWithImpl<$Res>
    extends _$ContactEventCopyWithImpl<$Res, _$NameChangedImpl>
    implements _$$NameChangedImplCopyWith<$Res> {
  __$$NameChangedImplCopyWithImpl(
    _$NameChangedImpl _value,
    $Res Function(_$NameChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$NameChangedImpl(
        null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NameChangedImpl implements _NameChanged {
  const _$NameChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'ContactEvent.nameChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NameChangedImplCopyWith<_$NameChangedImpl> get copyWith =>
      __$$NameChangedImplCopyWithImpl<_$NameChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) nameChanged,
    required TResult Function(String value) emailChanged,
    required TResult Function(String value) companyChanged,
    required TResult Function(String value) messageChanged,
    required TResult Function() submitted,
  }) {
    return nameChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? nameChanged,
    TResult? Function(String value)? emailChanged,
    TResult? Function(String value)? companyChanged,
    TResult? Function(String value)? messageChanged,
    TResult? Function()? submitted,
  }) {
    return nameChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? nameChanged,
    TResult Function(String value)? emailChanged,
    TResult Function(String value)? companyChanged,
    TResult Function(String value)? messageChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_CompanyChanged value) companyChanged,
    required TResult Function(_MessageChanged value) messageChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_CompanyChanged value)? companyChanged,
    TResult? Function(_MessageChanged value)? messageChanged,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return nameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_CompanyChanged value)? companyChanged,
    TResult Function(_MessageChanged value)? messageChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class _NameChanged implements ContactEvent {
  const factory _NameChanged(final String value) = _$NameChangedImpl;

  String get value;

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NameChangedImplCopyWith<_$NameChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailChangedImplCopyWith<$Res> {
  factory _$$EmailChangedImplCopyWith(
    _$EmailChangedImpl value,
    $Res Function(_$EmailChangedImpl) then,
  ) = __$$EmailChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$EmailChangedImplCopyWithImpl<$Res>
    extends _$ContactEventCopyWithImpl<$Res, _$EmailChangedImpl>
    implements _$$EmailChangedImplCopyWith<$Res> {
  __$$EmailChangedImplCopyWithImpl(
    _$EmailChangedImpl _value,
    $Res Function(_$EmailChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$EmailChangedImpl(
        null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$EmailChangedImpl implements _EmailChanged {
  const _$EmailChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'ContactEvent.emailChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailChangedImplCopyWith<_$EmailChangedImpl> get copyWith =>
      __$$EmailChangedImplCopyWithImpl<_$EmailChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) nameChanged,
    required TResult Function(String value) emailChanged,
    required TResult Function(String value) companyChanged,
    required TResult Function(String value) messageChanged,
    required TResult Function() submitted,
  }) {
    return emailChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? nameChanged,
    TResult? Function(String value)? emailChanged,
    TResult? Function(String value)? companyChanged,
    TResult? Function(String value)? messageChanged,
    TResult? Function()? submitted,
  }) {
    return emailChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? nameChanged,
    TResult Function(String value)? emailChanged,
    TResult Function(String value)? companyChanged,
    TResult Function(String value)? messageChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_CompanyChanged value) companyChanged,
    required TResult Function(_MessageChanged value) messageChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_CompanyChanged value)? companyChanged,
    TResult? Function(_MessageChanged value)? messageChanged,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_CompanyChanged value)? companyChanged,
    TResult Function(_MessageChanged value)? messageChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailChanged implements ContactEvent {
  const factory _EmailChanged(final String value) = _$EmailChangedImpl;

  String get value;

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailChangedImplCopyWith<_$EmailChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompanyChangedImplCopyWith<$Res> {
  factory _$$CompanyChangedImplCopyWith(
    _$CompanyChangedImpl value,
    $Res Function(_$CompanyChangedImpl) then,
  ) = __$$CompanyChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$CompanyChangedImplCopyWithImpl<$Res>
    extends _$ContactEventCopyWithImpl<$Res, _$CompanyChangedImpl>
    implements _$$CompanyChangedImplCopyWith<$Res> {
  __$$CompanyChangedImplCopyWithImpl(
    _$CompanyChangedImpl _value,
    $Res Function(_$CompanyChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$CompanyChangedImpl(
        null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CompanyChangedImpl implements _CompanyChanged {
  const _$CompanyChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'ContactEvent.companyChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyChangedImplCopyWith<_$CompanyChangedImpl> get copyWith =>
      __$$CompanyChangedImplCopyWithImpl<_$CompanyChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) nameChanged,
    required TResult Function(String value) emailChanged,
    required TResult Function(String value) companyChanged,
    required TResult Function(String value) messageChanged,
    required TResult Function() submitted,
  }) {
    return companyChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? nameChanged,
    TResult? Function(String value)? emailChanged,
    TResult? Function(String value)? companyChanged,
    TResult? Function(String value)? messageChanged,
    TResult? Function()? submitted,
  }) {
    return companyChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? nameChanged,
    TResult Function(String value)? emailChanged,
    TResult Function(String value)? companyChanged,
    TResult Function(String value)? messageChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (companyChanged != null) {
      return companyChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_CompanyChanged value) companyChanged,
    required TResult Function(_MessageChanged value) messageChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return companyChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_CompanyChanged value)? companyChanged,
    TResult? Function(_MessageChanged value)? messageChanged,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return companyChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_CompanyChanged value)? companyChanged,
    TResult Function(_MessageChanged value)? messageChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (companyChanged != null) {
      return companyChanged(this);
    }
    return orElse();
  }
}

abstract class _CompanyChanged implements ContactEvent {
  const factory _CompanyChanged(final String value) = _$CompanyChangedImpl;

  String get value;

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompanyChangedImplCopyWith<_$CompanyChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageChangedImplCopyWith<$Res> {
  factory _$$MessageChangedImplCopyWith(
    _$MessageChangedImpl value,
    $Res Function(_$MessageChangedImpl) then,
  ) = __$$MessageChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$MessageChangedImplCopyWithImpl<$Res>
    extends _$ContactEventCopyWithImpl<$Res, _$MessageChangedImpl>
    implements _$$MessageChangedImplCopyWith<$Res> {
  __$$MessageChangedImplCopyWithImpl(
    _$MessageChangedImpl _value,
    $Res Function(_$MessageChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$MessageChangedImpl(
        null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$MessageChangedImpl implements _MessageChanged {
  const _$MessageChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'ContactEvent.messageChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageChangedImplCopyWith<_$MessageChangedImpl> get copyWith =>
      __$$MessageChangedImplCopyWithImpl<_$MessageChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) nameChanged,
    required TResult Function(String value) emailChanged,
    required TResult Function(String value) companyChanged,
    required TResult Function(String value) messageChanged,
    required TResult Function() submitted,
  }) {
    return messageChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? nameChanged,
    TResult? Function(String value)? emailChanged,
    TResult? Function(String value)? companyChanged,
    TResult? Function(String value)? messageChanged,
    TResult? Function()? submitted,
  }) {
    return messageChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? nameChanged,
    TResult Function(String value)? emailChanged,
    TResult Function(String value)? companyChanged,
    TResult Function(String value)? messageChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (messageChanged != null) {
      return messageChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_CompanyChanged value) companyChanged,
    required TResult Function(_MessageChanged value) messageChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return messageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_CompanyChanged value)? companyChanged,
    TResult? Function(_MessageChanged value)? messageChanged,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return messageChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_CompanyChanged value)? companyChanged,
    TResult Function(_MessageChanged value)? messageChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (messageChanged != null) {
      return messageChanged(this);
    }
    return orElse();
  }
}

abstract class _MessageChanged implements ContactEvent {
  const factory _MessageChanged(final String value) = _$MessageChangedImpl;

  String get value;

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageChangedImplCopyWith<_$MessageChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmittedImplCopyWith<$Res> {
  factory _$$SubmittedImplCopyWith(
    _$SubmittedImpl value,
    $Res Function(_$SubmittedImpl) then,
  ) = __$$SubmittedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmittedImplCopyWithImpl<$Res>
    extends _$ContactEventCopyWithImpl<$Res, _$SubmittedImpl>
    implements _$$SubmittedImplCopyWith<$Res> {
  __$$SubmittedImplCopyWithImpl(
    _$SubmittedImpl _value,
    $Res Function(_$SubmittedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContactEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SubmittedImpl implements _Submitted {
  const _$SubmittedImpl();

  @override
  String toString() {
    return 'ContactEvent.submitted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmittedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) nameChanged,
    required TResult Function(String value) emailChanged,
    required TResult Function(String value) companyChanged,
    required TResult Function(String value) messageChanged,
    required TResult Function() submitted,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? nameChanged,
    TResult? Function(String value)? emailChanged,
    TResult? Function(String value)? companyChanged,
    TResult? Function(String value)? messageChanged,
    TResult? Function()? submitted,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? nameChanged,
    TResult Function(String value)? emailChanged,
    TResult Function(String value)? companyChanged,
    TResult Function(String value)? messageChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_CompanyChanged value) companyChanged,
    required TResult Function(_MessageChanged value) messageChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_CompanyChanged value)? companyChanged,
    TResult? Function(_MessageChanged value)? messageChanged,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_CompanyChanged value)? companyChanged,
    TResult Function(_MessageChanged value)? messageChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements ContactEvent {
  const factory _Submitted() = _$SubmittedImpl;
}
