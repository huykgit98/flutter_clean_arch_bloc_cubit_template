import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_starter/common/base/app_state.dart';
import 'package:flutter_starter/config/constants/app_constants.dart';
import 'package:flutter_starter/platform/storages/secure_storage_service.dart';
import 'package:provider/provider.dart';

import 'common/helpers/injection_container.dart';
import 'presentation/application/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env.staging");
  await init();

  final isOnline = await di<SecureStorage>().readBool(Constants.dataMode) ?? true;
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(isOnline: isOnline),
      child: const MyApp(),
    ),
  );
}
