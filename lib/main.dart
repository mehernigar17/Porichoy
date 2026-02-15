import 'package:flutter/material.dart';
import 'package:porichoy/homepage.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';
import 'homepage.dart';
import 'login.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Appstate(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Appstate>(
      builder: (context, appState, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,


          themeMode:
          appState.isDark ? ThemeMode.dark : ThemeMode.light,

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

          home: login(),
        );
      },
    );
  }
}
