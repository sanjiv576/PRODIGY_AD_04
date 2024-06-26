import 'package:flutter/material.dart';
import 'splash_view.dart';
import 'tictactoe_view.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Road Rage',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashView(),
        '/home': (context) => const TicTacToeView(),
      },
    );
  }
}
