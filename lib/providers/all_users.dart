import 'package:my_chat_app/models/db_user.dart';
import 'package:my_chat_app/repositories/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'all_users.g.dart';

@riverpod
class AllUsersNotifier extends _$AllUsersNotifier {
  @override
  Future<List<DBUser>> build() async {
    state = const AsyncValue.loading();
    final userRepository = UserRepository();
    return await userRepository.getAllUsers();
  }

  Future<void> refreshState() async {
    state = const AsyncValue.loading();
    final userRepository = UserRepository();
    state = AsyncValue.data(await userRepository.getAllUsers());
  }
}
