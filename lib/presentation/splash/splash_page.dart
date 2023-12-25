import 'package:flutter/material.dart';
import 'package:flutter_starter/common/base/base_page.dart';
import 'package:flutter_starter/common/base/base_state.dart';
import 'package:flutter_starter/presentation/application/router.dart';
import 'package:flutter_starter/presentation/login/boc/sign_in_bloc.dart';
import 'package:flutter_starter/presentation/login/boc/sign_in_data.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPage, SignInBloc, SignInData> {
  @override
  void initState() {
    cubit.checkAuthentication();
    super.initState();
  }

  @override
  void onDataChange(BuildContext context, SignInData data) {
    if (data.state is SuccessState) {
      if (data.user?.apiToken != null) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          RoutePaths.home,
          (route) => false,
        );
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
          RoutePaths.login,
          (route) => false,
        );
      }
    }
  }

  @override
  Widget buildPage(BuildContext context, SignInData data) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        alignment: Alignment.center,
        child: const SizedBox.shrink(),
      ),
    );
  }
}
