import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset('assets/animations/animation.json'),
            const SizedBox(height: 16),
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(
                  'LET THE GAME BEGIN',
                  textStyle: const TextStyle(
                    fontSize: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 4,
                shadowColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                surfaceTintColor: Colors.green,
              ),
              onPressed: () => Navigator.pushNamed(context, '/home'),
              child: Text(
                'PLAY GAME',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
