import 'package:client/app.dart';
import 'package:client/pages/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    title: "sLeaM",
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData(
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      colorScheme: ColorScheme.fromSeed(
          onPrimary: Colors.black,
          seedColor: Colors.black38,
          brightness: Brightness.dark),
    ),
    home: ChangeNotifierProvider(
      create: (context) => ColorNotifier(),
      child: MyApp(),
    ),
  ));
}
