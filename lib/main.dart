import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';
import 'darkmood.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,


          themeMode:
          appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,

          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.green,
            scaffoldBackgroundColor: Colors.white,
            canvasColor: Colors.white,
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.white,
            ),
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.grey[900],
            canvasColor: Colors.grey[900],
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.grey,
            ),
            listTileTheme: const ListTileThemeData(
              textColor: Colors.white,
              iconColor: Colors.white,
            ),
          ),

          home: const DarkMood(),
        );
      },
    );
  }
}