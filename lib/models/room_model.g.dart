// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomModelImpl _$$RoomModelImplFromJson(Map<String, dynamic> json) =>
    _$RoomModelImpl(
      id: json['id'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => RoomMemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RoomModelImplToJson(_$RoomModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'members': instance.members,
    };

_$RoomMemberModelImpl _$$RoomMemberModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RoomMemberModelImpl(
      userId: json['userId'] as String,
      title: json['title'] as String,
      isBlock: json['isBlock'] as bool,
      isPermit: json['isPermit'] as bool,
    );

Map<String, dynamic> _$$RoomMemberModelImplToJson(
        _$RoomMemberModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'isBlock': instance.isBlock,
      'isPermit': instance.isPermit,
    };
