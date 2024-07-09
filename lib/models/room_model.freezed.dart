// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) {
  return _RoomModel.fromJson(json);
}

/// @nodoc
mixin _$RoomModel {
  String get id => throw _privateConstructorUsedError;
  List<RoomMemberModel> get members => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomModelCopyWith<RoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomModelCopyWith<$Res> {
  factory $RoomModelCopyWith(RoomModel value, $Res Function(RoomModel) then) =
      _$RoomModelCopyWithImpl<$Res, RoomModel>;
  @useResult
  $Res call({String id, List<RoomMemberModel> members});
}

/// @nodoc
class _$RoomModelCopyWithImpl<$Res, $Val extends RoomModel>
    implements $RoomModelCopyWith<$Res> {
  _$RoomModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? members = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<RoomMemberModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomModelImplCopyWith<$Res>
    implements $RoomModelCopyWith<$Res> {
  factory _$$RoomModelImplCopyWith(
          _$RoomModelImpl value, $Res Function(_$RoomModelImpl) then) =
      __$$RoomModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, List<RoomMemberModel> members});
}

/// @nodoc
class __$$RoomModelImplCopyWithImpl<$Res>
    extends _$RoomModelCopyWithImpl<$Res, _$RoomModelImpl>
    implements _$$RoomModelImplCopyWith<$Res> {
  __$$RoomModelImplCopyWithImpl(
      _$RoomModelImpl _value, $Res Function(_$RoomModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? members = null,
  }) {
    return _then(_$RoomModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<RoomMemberModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomModelImpl implements _RoomModel {
  const _$RoomModelImpl(
      {required this.id, required final List<RoomMemberModel> members})
      : _members = members;

  factory _$RoomModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomModelImplFromJson(json);

  @override
  final String id;
  final List<RoomMemberModel> _members;
  @override
  List<RoomMemberModel> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'RoomModel(id: $id, members: $members)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_members));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomModelImplCopyWith<_$RoomModelImpl> get copyWith =>
      __$$RoomModelImplCopyWithImpl<_$RoomModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomModelImplToJson(
      this,
    );
  }
}

abstract class _RoomModel implements RoomModel {
  const factory _RoomModel(
      {required final String id,
      required final List<RoomMemberModel> members}) = _$RoomModelImpl;

  factory _RoomModel.fromJson(Map<String, dynamic> json) =
      _$RoomModelImpl.fromJson;

  @override
  String get id;
  @override
  List<RoomMemberModel> get members;
  @override
  @JsonKey(ignore: true)
  _$$RoomModelImplCopyWith<_$RoomModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RoomMemberModel _$RoomMemberModelFromJson(Map<String, dynamic> json) {
  return _RoomMemberModel.fromJson(json);
}

/// @nodoc
mixin _$RoomMemberModel {
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isBlock => throw _privateConstructorUsedError; // trueの時ブロックしてる
  bool get isPermit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomMemberModelCopyWith<RoomMemberModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomMemberModelCopyWith<$Res> {
  factory $RoomMemberModelCopyWith(
          RoomMemberModel value, $Res Function(RoomMemberModel) then) =
      _$RoomMemberModelCopyWithImpl<$Res, RoomMemberModel>;
  @useResult
  $Res call({String userId, String title, bool isBlock, bool isPermit});
}

/// @nodoc
class _$RoomMemberModelCopyWithImpl<$Res, $Val extends RoomMemberModel>
    implements $RoomMemberModelCopyWith<$Res> {
  _$RoomMemberModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? title = null,
    Object? isBlock = null,
    Object? isPermit = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isBlock: null == isBlock
          ? _value.isBlock
          : isBlock // ignore: cast_nullable_to_non_nullable
              as bool,
      isPermit: null == isPermit
          ? _value.isPermit
          : isPermit // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomMemberModelImplCopyWith<$Res>
    implements $RoomMemberModelCopyWith<$Res> {
  factory _$$RoomMemberModelImplCopyWith(_$RoomMemberModelImpl value,
          $Res Function(_$RoomMemberModelImpl) then) =
      __$$RoomMemberModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String title, bool isBlock, bool isPermit});
}

/// @nodoc
class __$$RoomMemberModelImplCopyWithImpl<$Res>
    extends _$RoomMemberModelCopyWithImpl<$Res, _$RoomMemberModelImpl>
    implements _$$RoomMemberModelImplCopyWith<$Res> {
  __$$RoomMemberModelImplCopyWithImpl(
      _$RoomMemberModelImpl _value, $Res Function(_$RoomMemberModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? title = null,
    Object? isBlock = null,
    Object? isPermit = null,
  }) {
    return _then(_$RoomMemberModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isBlock: null == isBlock
          ? _value.isBlock
          : isBlock // ignore: cast_nullable_to_non_nullable
              as bool,
      isPermit: null == isPermit
          ? _value.isPermit
          : isPermit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomMemberModelImpl implements _RoomMemberModel {
  const _$RoomMemberModelImpl(
      {required this.userId,
      required this.title,
      required this.isBlock,
      required this.isPermit});

  factory _$RoomMemberModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomMemberModelImplFromJson(json);

  @override
  final String userId;
  @override
  final String title;
  @override
  final bool isBlock;
// trueの時ブロックしてる
  @override
  final bool isPermit;

  @override
  String toString() {
    return 'RoomMemberModel(userId: $userId, title: $title, isBlock: $isBlock, isPermit: $isPermit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomMemberModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isBlock, isBlock) || other.isBlock == isBlock) &&
            (identical(other.isPermit, isPermit) ||
                other.isPermit == isPermit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, title, isBlock, isPermit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomMemberModelImplCopyWith<_$RoomMemberModelImpl> get copyWith =>
      __$$RoomMemberModelImplCopyWithImpl<_$RoomMemberModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomMemberModelImplToJson(
      this,
    );
  }
}

abstract class _RoomMemberModel implements RoomMemberModel {
  const factory _RoomMemberModel(
      {required final String userId,
      required final String title,
      required final bool isBlock,
      required final bool isPermit}) = _$RoomMemberModelImpl;

  factory _RoomMemberModel.fromJson(Map<String, dynamic> json) =
      _$RoomMemberModelImpl.fromJson;

  @override
  String get userId;
  @override
  String get title;
  @override
  bool get isBlock;
  @override // trueの時ブロックしてる
  bool get isPermit;
  @override
  @JsonKey(ignore: true)
  _$$RoomMemberModelImplCopyWith<_$RoomMemberModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
