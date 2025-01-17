import 'package:flutter/material.dart';
import 'package:smart_movie/app/app.dart';
import 'package:smart_movie/core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hiveService = HiveService();

  await hiveService.initHive();

  runApp(const MyApp());
}
