import 'package:flutter/material.dart';

enum DeviceType { phone, tablet }

DeviceType getDeviceType() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  return data.size.shortestSide < 550 ? DeviceType.phone : DeviceType.tablet;
}
