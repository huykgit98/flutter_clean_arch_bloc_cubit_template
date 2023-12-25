import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../config/themes/space_distance.dart';

class InputTextWithImage extends StatefulWidget {
  final TextEditingController controller;
  final String imageAsset;
  final String hintText;
  final TextInputType inputType;
  final bool obscureText;

  const InputTextWithImage(
      {Key? key,
      required this.controller,
      this.hintText = "",
      this.imageAsset = "",
      this.inputType = TextInputType.text,
      this.obscureText = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _InputTextWithImage();
}

class _InputTextWithImage extends State<InputTextWithImage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.black.withOpacity(0.2),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        contentPadding: const EdgeInsets.only(top: AppSpaceDistance.sp24),
        isDense: true,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.white38),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: AppSpaceDistance.sp16),
          child: Image.asset(widget.imageAsset),
        ),
        filled: true,
      ),
      style: const TextStyle(color: Colors.white),
      obscureText: widget.obscureText,
      controller: widget.controller,
      keyboardType: widget.inputType,
      autocorrect: false,
      validator: (value) {
        if (value == null) {
          return AppLocalizations.of(context)?.usernameIsRequired;
        }
        return null;
      },
    );
  }
}
