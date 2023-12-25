import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_starter/common/widgets/widgets.dart';
import 'package:flutter_starter/config/constants/asset_path.dart';
import 'package:flutter_starter/config/themes/themes.dart';

class AuthForm extends StatelessWidget {
  final Function(String userName, String password) loginPressed;
  AuthForm({Key? key, required this.loginPressed}) : super(key: key);

  GlobalKey<FormState> get formState => GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Form(
            key: formState,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpaceDistance.sp16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    InputTextWithImage(
                      controller: userNameController,
                      hintText: AppLocalizations.of(context)?.hintTextUserName ?? '',
                      imageAsset: AssetPath.iconUsername,
                      inputType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: AppSpaceDistance.sp16,
                    ),
                    InputTextWithImage(
                      controller: passwordController,
                      hintText: AppLocalizations.of(context)?.hintTextPassword ?? '',
                      imageAsset: AssetPath.iconPassword,
                      inputType: TextInputType.text,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: AppSpaceDistance.sp16,
                    ),
                    SizedBox(
                      height: 54,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: (() {
                            loginPressed(userNameController.text, passwordController.text);
                          }),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue.shade900, onPrimary: Colors.white, onSurface: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppLocalizations.of(context)?.btnLoginTitle ?? ''),
                              const SizedBox(width: AppSpaceDistance.sp4),
                              const IconImage(imagePath: AssetPath.iconArrowRight, size: TextSize.small),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
