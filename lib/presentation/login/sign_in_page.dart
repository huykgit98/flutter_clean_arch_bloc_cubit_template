import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_starter/common/base/app_state.dart';
import 'package:flutter_starter/common/base/base_exception.dart';
import 'package:flutter_starter/common/base/base_page.dart';
import 'package:flutter_starter/common/base/base_state.dart';
import 'package:flutter_starter/common/helpers/error_code.dart';
import 'package:flutter_starter/common/widgets/dialog_utils.dart';
import 'package:flutter_starter/presentation/application/router.dart';
import 'package:flutter_starter/presentation/login/boc/sign_in_bloc.dart';
import 'package:flutter_starter/presentation/login/boc/sign_in_data.dart';
import 'package:flutter_starter/presentation/login/components/authen_form.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends BasePageState<SignInPage, SignInBloc, SignInData> {
  @override
  void onDataChange(BuildContext context, SignInData data) {
    super.onDataChange(context, data);
    if (data.state is SuccessState && data.user != null) {
      Provider.of<AppState>(context, listen: false).changeOnline(isOnlineValue: true);
      Navigator.of(context).pushNamedAndRemoveUntil(RoutePaths.home, (route) => false);
    }
  }

  @override
  Widget buildPage(BuildContext context, SignInData data) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: _buildBody(data),
      ),
    );
  }

  @override
  void showError(BaseException error, BuildContext context) {
    final localization = AppLocalizations.of(context);
    final errorMap = {
      error.code: error.message,
      LoginErrorCode.emptyUsername: localization?.pleaseEnterUsername,
      LoginErrorCode.emptyPassword: localization?.pleaseEnterPassword,
    };
    _showAlert(errorMap[error.code] ?? '', context);
  }

  void _showAlert(String message, context) {
    DialogUtils.showAlertDialog(
      context,
      title: AppLocalizations.of(context)?.appTitle ?? '',
      message: message,
    );
  }

  Widget _buildBody(SignInData data) {
    final state = data.state;
    if (state is LoadingState) {
      return _buildLoading();
    }

    return _buildAuthenForm();
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildAuthenForm() {
    return AuthForm(loginPressed: ((userName, password) {
      cubit.login(userName, password);
    }));
  }
}
