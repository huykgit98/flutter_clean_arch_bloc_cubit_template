import 'package:flutter_starter/common/base/base_cubit.dart';
import 'package:flutter_starter/common/base/base_state.dart';
import 'package:flutter_starter/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

import './home_data.dart';
import '../../../common/helpers/exception_handler.dart';

@injectable
class HomeCubit extends BaseCubit<HomeData> {
  final AuthenticationUseCases authenticationUseCases;
  final NetworkExceptionHandler exceptionHandler;

  HomeCubit({
    required this.exceptionHandler,
    required this.authenticationUseCases,
  }) : super(HomeData(state: InitialState())) {}

  @override
  void dispose() {}
}
