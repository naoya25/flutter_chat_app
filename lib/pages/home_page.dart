import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_chat_app/components/logout_button.dart';
import 'package:my_chat_app/pages/chat_page.dart';
import 'package:my_chat_app/providers/all_users.dart';
import 'package:my_chat_app/providers/chat_rooms.dart';
import 'package:my_chat_app/providers/user.dart';
import 'package:my_chat_app/utils/constants.dart';
import 'package:my_chat_app/utils/error.dart';
import 'package:my_chat_app/utils/loading.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(userProvider);
    if (currentUser == null) {
      return const Center(
        child: Text('ユーザが見つかりません'),
      );
    }
    final rooms = ref.watch(chatRoomsNotifierProvider(currentUser.id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [LogoutButton()],
      ),
      body: Center(
        child: Column(
          children: [
            Text('ログイン中: ${currentUser.email}'),
            const Text(
              '''
このチャットアプリは
日々の人間関係に疲労している
現代の闇を解決すべく開発されたアプリです
なのでチャットは、
基本的に全て${ConstantValue.deleteMinutes}分後に削除されます
ちょっとした連絡なんて
全て忘れちゃえばいいんですヨネ〜〜
''',
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: rooms.when(
                data: (data) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      final notifire =
                          ref.read(allUsersNotifierProvider.notifier);
                      await notifire.refreshState();
                    },
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final room = data[index];
                        final title = room.members
                            .firstWhere(
                              (member) => member.userId == currentUser.id,
                            )
                            .title;

                        return GestureDetector(
                          onTap: () async {
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ChatPage(room);
                                },
                              ),
                            );
                          },
                          child: Card(
                            child: ListTile(
                              title: Text(title),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                error: errorWidget,
                loading: loadingWidget,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.push('/add_room');
        },
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: IconButton(
      //         onPressed: () {
      //           context.push('/home');
      //         },
      //         icon: const Icon(Icons.home),
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: IconButton(
      //         onPressed: () {
      //           context.push('/home');
      //         },
      //         icon: const Icon(Icons.account_balance),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
