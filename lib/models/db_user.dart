import 'package:freezed_annotation/freezed_annotation.dart';

part 'db_user.freezed.dart';
part 'db_user.g.dart';

@freezed
class DBUser with _$DBUser {
  const factory DBUser({
    required String id,
    required String name,
    required String email,
  }) = _DBUser;

  factory DBUser.fromJson(Map<String, dynamic> json) => _$DBUserFromJson(json);
}
