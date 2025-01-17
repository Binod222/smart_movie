import 'package:flutter/material.dart';
import 'package:smart_movie/app/app.dart';
import 'package:smart_movie/app/di/di.dart';
import 'package:smart_movie/core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialized the hive database
  await HiveService.init();
// Initialize the dependencies
  await initDependencies();
  runApp(
    const App(),
  );
}
