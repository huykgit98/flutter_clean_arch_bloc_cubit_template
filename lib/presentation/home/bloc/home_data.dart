import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_starter/common/base/base_data.dart';
import 'package:flutter_starter/common/base/base_state.dart';

part 'home_data.g.dart';

@CopyWith()
class HomeData extends BaseData {
  HomeData({BaseState? state}) : super(state ?? InitialState());
}
