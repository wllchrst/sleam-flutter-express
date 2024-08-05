import 'package:client/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "sLeaM",
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        colorScheme: ColorScheme.fromSeed(
            background: Colors.pink,
            onPrimary: Colors.black,
            seedColor: Colors.black38,
            brightness: Brightness.dark),
      ),
      home: MyApp()));
}
