import 'package:flutter_starter/common/base/base_cubit.dart';
import 'package:flutter_starter/common/base/base_exception.dart';
import 'package:flutter_starter/common/base/base_state.dart';
import 'package:flutter_starter/common/helpers/error_code.dart';
import 'package:flutter_starter/common/helpers/exception_handler.dart';
import 'package:flutter_starter/config/constants/app_constants.dart';
import 'package:flutter_starter/domain/use_cases/authentication_usecases.dart';
import 'package:flutter_starter/platform/models/current_user.dart';
import 'package:flutter_starter/platform/storages/secure_storage_service.dart';
import 'package:flutter_starter/presentation/login/boc/sign_in_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInBloc extends BaseCubit<SignInData> {
  final SecureStorage secureStorage;
  final AuthenticationUseCases authenticationUseCases;
  final NetworkExceptionHandler exceptionHandler;

  SignInBloc({required this.secureStorage, required this.authenticationUseCases, required this.exceptionHandler})
      : super(SignInData(state: InitialState()));

  @override
  void dispose() {}

  void login(String userName, String password) async {
    emit(state.copyWith(state: LoadingState()));
    try {
      if (userName.isEmpty) {
        throw BaseException(code: LoginErrorCode.emptyUsername);
      }
      if (password.isEmpty) {
        throw BaseException(code: LoginErrorCode.emptyPassword);
      }
      final user = await authenticationUseCases.signIn(userName, password);
      if (user != null) {
        CurrentUser(user);
        await secureStorage.writeBool(Constants.dataMode, true);
        emit(state.copyWith(state: SuccessState(), user: user));
      } else {
        emit(state.copyWith(state: ErrorState(error: BaseException())));
      }
    } catch (err) {
      emit(state.copyWith(state: ErrorState(error: exceptionHandler.parse(err))));
    }
  }

  Future<void> checkAuthentication() async {
    final user = await authenticationUseCases.getCurrentUser();
    if (user != null) {
      CurrentUser(user);
    }
    emit(state.copyWith(state: SuccessState(), user: user));
  }
}
