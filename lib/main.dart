import 'package:flutter/material.dart';
import 'package:next_generation_armenia/core/data/utilities/storage/preferences_manager.dart';
import 'package:next_generation_armenia/core/presantation/application.dart';
import 'package:next_generation_armenia/core/presantation/utilities/routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final userData = await UserPreferences.getUserData();
  final initialRoute =
      userData != null ? '/${AppRouting.dashboard}' : '/${AppRouting.teacher}';
  AppRouting.setupRouter(initialRoute);

  runApp(
    const Application(),
  );
}
