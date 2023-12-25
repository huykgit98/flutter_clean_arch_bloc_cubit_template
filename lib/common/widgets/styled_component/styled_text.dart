import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextOverflow? overflow;
  const StyledText({Key? key, required this.title, this.textStyle, this.maxLines, this.overflow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: textStyle ?? Theme.of(context).textTheme.titleMedium, maxLines: maxLines, overflow: overflow);
  }
}
