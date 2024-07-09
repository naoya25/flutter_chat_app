import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_model.freezed.dart';
part 'room_model.g.dart';

@freezed
class RoomModel with _$RoomModel {
  const factory RoomModel({
    required String id,
    required List<RoomMemberModel> members,
  }) = _RoomModel;

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);
}

@freezed
class RoomMemberModel with _$RoomMemberModel {
  const factory RoomMemberModel({
    required String userId,
    required String title,
    required bool isBlock, // trueの時ブロックしてる
    required bool isPermit, // trueの時許可済み
  }) = _RoomMemberModel;

  factory RoomMemberModel.fromJson(Map<String, dynamic> json) =>
      _$RoomMemberModelFromJson(json);
}
