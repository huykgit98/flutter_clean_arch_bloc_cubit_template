import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/themes/style_size.dart';

class IconImage extends StatelessWidget {
  final String imagePath;
  final double size;
  const IconImage({Key? key, required this.imagePath, this.size = 24}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: BoxFit.fill,
      width: size,
      height: size,
    );
  }
}

class SvgIcon extends StatelessWidget {
  final String imagePath;
  final double size;
  final Color? color;
  final AlignmentGeometry? alignment;

  const SvgIcon({
    Key? key,
    required this.imagePath,
    this.size = IconSize.small,
    this.color,
    this.alignment
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      fit: BoxFit.none,
      width: size,
      height: size,
      color: color,
      alignment: alignment ?? Alignment.center,
    );
  }
}
