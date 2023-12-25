import 'package:flutter/material.dart';

import '../../../config/themes/app_styles.dart';
import '../../../config/themes/text_style.dart';
import '../widgets.dart';

class StyledTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool? readOnly;
  final bool? isRequired;
  final VoidCallback? onTap;
  final bool roundedBorder;
  const StyledTextField(
      {Key? key,
      required this.controller,
      required this.title,
      this.readOnly = false,
      this.roundedBorder = false,
      this.isRequired = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: readOnly == true ? false : true,
      focusNode: readOnly == true ? AlwaysDisabledFocusNode() : FocusNode(),
      controller: controller,
      style: Theme.of(context).textTheme.titleMedium,
      onTap: onTap,
      decoration: InputDecoration(
        label: Row(
          children: [
            Text(title),
            isRequired == true ? Text(' *', style: AppTextStyle.sansProBold.apply(color: Colors.red)) : const Text(''),
          ],
        ),
        hintStyle: Theme.of(context).textTheme.titleMedium,
        labelStyle: Theme.of(context).textTheme.titleMedium,
        border: roundedBorder ? AppStyle.getEnabledBorderTextFieldStyle() : null,
        disabledBorder: AppStyle.getDisabledBorderTextFieldStyle(),
      ),

      readOnly: readOnly!, //set it true, so that user will not able to edit text
    );
  }
}
