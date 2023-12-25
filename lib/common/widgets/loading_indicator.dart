import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoadingIndicator());
  }

  @override
  Widget build(BuildContext context) => const Center(
    child: CircularProgressIndicator(
      backgroundColor: Colors.cyan,
      strokeWidth: 5,),
  );
}