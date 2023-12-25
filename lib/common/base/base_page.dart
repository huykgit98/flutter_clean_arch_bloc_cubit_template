import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/common/base/base_cubit.dart';
import 'package:flutter_starter/common/base/base_data.dart';
import 'package:flutter_starter/common/base/base_page_mixin.dart';
import 'package:flutter_starter/common/base/base_state.dart';
import 'package:flutter_starter/common/helpers/device_helper.dart';
import 'package:flutter_starter/common/helpers/error_code.dart';
import 'package:flutter_starter/common/helpers/injection_container.dart';
import 'package:flutter_starter/common/widgets/dialog_utils.dart';
import 'package:flutter_starter/common/widgets/loading_dialog.dart';

abstract class BasePageState<W extends StatefulWidget, C extends BaseCubit<D>, D extends BaseData> extends State<W>
    with WidgetsBindingObserver, BasePageMixin {
  C cubit = di();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onViewCreated();
    });

    if (getDeviceType() == DeviceType.phone) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<C, D>(
      bloc: cubit,
      listener: onDataChange,
      child: BlocBuilder<C, D>(
        bloc: cubit,
        builder: buildPage,
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint("${objectRuntimeType(this, "")} ${state.toString()}");
  }

  @override
  void dispose() {
    debugPrint("${objectRuntimeType(this, "")} dispose");
    cubit.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void onViewCreated() {
    debugPrint("${objectRuntimeType(this, "")} onViewCreated");
  }

  Widget buildPage(BuildContext context, D data);

  void onDataChange(BuildContext context, D data) {
    final state = data.state;
    LoadingDialog().hideLoadingPage();

    if (state is DialogLoadingState) {
      LoadingDialog().showLoadingWithMessage(context, message: state.message);
    } else if (state is ErrorState) {
      if (state.error.code == NetworkErrorCode.saveDataFail) {
        DialogUtils.showAlertDialog(context, message: state.error.message ?? '');
      } else {
        showError(state.error, context);
      }
    }
  }
}
