import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/config/themes/themes.dart';

class StyledSwitch extends StatefulWidget {
  final ValueChanged<bool?>? onChanged;
  final bool? value;
  final bool? isDisabled;
  const StyledSwitch({Key? key, this.onChanged, this.value = false, this.isDisabled = false}) : super(key: key);

  @override
  State<StyledSwitch> createState() => _StyledSwitchState();
}

class _StyledSwitchState extends State<StyledSwitch> {
  late bool isSwitched;
  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      isSwitched = widget.value!;
    } else {
      isSwitched = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: isSwitched,
      onChanged: widget.isDisabled == true
          ? null
          : (value) {
              setState(() {
                isSwitched = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
      activeColor: Palette.defaultButton,

      // activeTrackColor: Palette.defaultButton,
      // activeColor: Colors.blue,
    );
  }
}
