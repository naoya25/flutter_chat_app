import 'package:flutter/widgets.dart';

Widget errorWidget(error, stackTrace) {
  return Center(
    child: Text('Error : ${error.toString()}'),
  );
}
