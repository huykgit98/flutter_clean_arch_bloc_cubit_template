import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_starter/common/base/app_state.dart';
import 'package:flutter_starter/common/base/base_exception.dart';
import 'package:flutter_starter/common/widgets/loading_indicator.dart';
import 'package:flutter_starter/config/themes/themes.dart';
import 'package:flutter_starter/presentation/application/router.dart';
import 'package:provider/provider.dart';

mixin BasePageMixin<T extends StatefulWidget> on State<T> {
  Widget buildErrorWidget() {
    return Center(
      child:
          Text(AppLocalizations.of(context)?.somethingWentWrong ?? '', style: Theme.of(context).textTheme.titleMedium),
    );
  }

  Widget buildNoInternetWidget() {
    return const SizedBox.shrink();
  }

  Widget buildNoContentWidget() {
    return Center(
      child: Text(AppLocalizations.of(context)?.contentNotFount ?? '', style: Theme.of(context).textTheme.titleMedium),
    );
  }

  Widget buildLoadingWidget() {
    return const LoadingIndicator();
  }

  // override this method for display custom error
  // this function could be useful for handle network error or authentication
  void showError(BaseException error, BuildContext context) {
    if (error.code == 401) {
      Navigator.of(context).popAndPushNamed(RoutePaths.login);
      return;
    }

    if (error.message?.isNotEmpty ?? false) {
      showSnackMessage(error.message ?? '', context);
    }
  }

  void showSnackMessage(String message, BuildContext context) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: Colors.red);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  AppBar buildAppBar({
    required BuildContext context,
    bool showElevation = false,
    bool isCloseIcon = false,
    String? title,
    List<Widget> actions = const [],
    Widget? leading,
    PreferredSizeWidget? bottom,
    bool showBackButton = true,
    Function? backAction,
  }) {
    final isOnline = Provider.of<AppState>(context).isOnline;
    const double offlineState = 40;
    final double bottomHeight = bottom?.preferredSize.height ?? 0;
    final height = bottomHeight + offlineState;

    return AppBar(
      elevation: showElevation ? 1.0 : 0.0,
      centerTitle: (Theme.of(context).platform) == TargetPlatform.iOS ? true : false,
      title: Text(title ?? '',
          style: Theme.of(context).textTheme.headline6?.merge(Theme.of(context).appBarTheme.titleTextStyle)),
      actions: actions,
      leading: showBackButton ? _getLeading(leading: leading, isCloseIcon: isCloseIcon, backAction: backAction) : null,
      bottom: isOnline
          ? bottom
          : PreferredSize(
              preferredSize: Size.fromHeight(height),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: AppSpaceDistance.sp8),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(color: Colors.white30),
                    child: Text(
                      AppLocalizations.of(context)?.offlineMode ?? '',
                      style: Theme.of(context).textTheme.subtitle2?.apply(color: Colors.white),
                    ),
                  ),
                  if (bottom != null) bottom,
                ],
              )),
    );
  }

  _getLeading({Widget? leading, bool isCloseIcon = false, Function? backAction}) {
    if (leading != null) {
      return leading;
    }
    Icon icon;
    if (isCloseIcon) {
      icon = const Icon(Icons.close, size: IconSize.small);
    } else {
      icon = const Icon(Icons.arrow_back_ios, size: IconSize.small);
    }
    return ModalRoute.of(context)?.canPop == true
        ? Padding(
            padding: const EdgeInsets.only(left: AppSpaceDistance.sp8),
            child: IconButton(
                icon: icon,
                onPressed: () {
                  if (backAction != null) {
                    backAction.call();
                    return;
                  }
                  Navigator.of(context).maybePop();
                }))
        : null;
  }
}
