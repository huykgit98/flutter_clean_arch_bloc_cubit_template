import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_starter/config/themes/themes.dart';
import 'package:flutter_starter/presentation/home/bloc/bloc.dart';

import '../../common/base/base_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage, HomeCubit, HomeData> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    myFocusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget buildPage(BuildContext context, HomeData data) {
    return Scaffold(
      key: scaffoldKey,
      appBar: buildAppBar(
        context: context,
        title: AppLocalizations.of(context)?.homeTitle ?? '',
        leading: Padding(
          padding: const EdgeInsets.only(left: AppSpaceDistance.sp8),
          child: IconButton(
            icon: const Icon(Icons.menu, size: IconSize.normal),
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: AppSpaceDistance.sp24),
            child: IconButton(
              icon: const Icon(Icons.cached, size: IconSize.normal),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
