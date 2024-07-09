// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// class AddRoomTextField extends HookWidget {
//   final voidc Function(String) onSubmit;
//   const AddRoomTextField({required this.onSubmit, super.key});

//   @override
//   Widget build(BuildContext context) {
//     final roomNameController = useTextEditingController();
//     return Column(
//       children: [
//         TextFormField(
//           controller: roomNameController,
//           decoration: const InputDecoration(
//             labelText: 'ルーム名',
//           ),
//         ),
//         const SizedBox(height: 30),
//         ElevatedButton(
//           onPressed: () {
//             onSubmit(roomNameController.text);
//           },
//           child: const Text('create'),
//         ),
//       ],
//     );
//   }
// }
