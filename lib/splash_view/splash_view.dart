import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../layout/notes/notes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future navigateToPage() async {
    await Future.delayed(
      const Duration(seconds: 13),
      () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Notes(),
          ),
          (route) => false),
    );
  }

  @override
  void initState() {
    navigateToPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Notes App',
                      textStyle:
                          const TextStyle(letterSpacing: 5.0, fontSize: 25.0)),
                  WavyAnimatedText('Notes Application',
                      textStyle: const TextStyle(
                        letterSpacing: 5.0,
                      )),
                ],
                isRepeatingAnimation: false,
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
/* */