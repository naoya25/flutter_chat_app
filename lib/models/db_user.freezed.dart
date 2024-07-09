// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'db_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DBUser _$DBUserFromJson(Map<String, dynamic> json) {
  return _DBUser.fromJson(json);
}

/// @nodoc
mixin _$DBUser {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DBUserCopyWith<DBUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DBUserCopyWith<$Res> {
  factory $DBUserCopyWith(DBUser value, $Res Function(DBUser) then) =
      _$DBUserCopyWithImpl<$Res, DBUser>;
  @useResult
  $Res call({String id, String name, String email});
}

/// @nodoc
class _$DBUserCopyWithImpl<$Res, $Val extends DBUser>
    implements $DBUserCopyWith<$Res> {
  _$DBUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DBUserImplCopyWith<$Res> implements $DBUserCopyWith<$Res> {
  factory _$$DBUserImplCopyWith(
          _$DBUserImpl value, $Res Function(_$DBUserImpl) then) =
      __$$DBUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String email});
}

/// @nodoc
class __$$DBUserImplCopyWithImpl<$Res>
    extends _$DBUserCopyWithImpl<$Res, _$DBUserImpl>
    implements _$$DBUserImplCopyWith<$Res> {
  __$$DBUserImplCopyWithImpl(
      _$DBUserImpl _value, $Res Function(_$DBUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$DBUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DBUserImpl implements _DBUser {
  const _$DBUserImpl(
      {required this.id, required this.name, required this.email});

  factory _$DBUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$DBUserImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'DBUser(id: $id, name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DBUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DBUserImplCopyWith<_$DBUserImpl> get copyWith =>
      __$$DBUserImplCopyWithImpl<_$DBUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DBUserImplToJson(
      this,
    );
  }
}

abstract class _DBUser implements DBUser {
  const factory _DBUser(
      {required final String id,
      required final String name,
      required final String email}) = _$DBUserImpl;

  factory _DBUser.fromJson(Map<String, dynamic> json) = _$DBUserImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$DBUserImplCopyWith<_$DBUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
