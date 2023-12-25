import 'package:flutter_starter/common/base/base_data.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_starter/common/base/base_state.dart';
import 'package:flutter_starter/domain/entities/user.dart';

part 'sign_in_data.g.dart';

@CopyWith()
class SignInData extends BaseData {
  final User? user;
  SignInData({BaseState? state, this.user}) : super(state ?? InitialState());
}
