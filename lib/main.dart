import 'dart:math';

import 'package:animation_demo/provider/is_sunset.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animation_demo/sun_and_moon/mix_animation.dart';
import 'package:flutter/material.dart';

import 'wave/wave_animation.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            ref.read(isPlayingProvider.notifier).state = true;
            await Future.delayed(const Duration(seconds: 5), () {
                ref.read(isPlayingProvider.notifier).state = false; // Dừng animation
            });
            ref.read(isSunset.notifier).state = !ref.read(isSunset);
          },
          child: Icon(ref.watch(isSunset) ? Icons.wb_sunny : Icons.nightlight_round),
        ),
        body: const Stack(
          children: [
            MixAnimation(time: 10),
            WaveAnimation(
              waveAmplitude: 10,
              lambda: 200,
              alpha0: pi,
              heightPart: 1/2,
              timeControllerAlpha: 4,
              timeControllerAmplitude: 4,
              color: Colors.lightBlueAccent,
            ),
            WaveAnimation(
              waveAmplitude: 15,
              lambda: 150,
              alpha0: 0,
              heightPart: 1/3,
              timeControllerAlpha: 3,
              timeControllerAmplitude: 4,
              color: Color.fromRGBO(205, 205, 205, 0.3),
            ),
            WaveAnimation(
              waveAmplitude: 20,
              lambda: 100,
              alpha0: 0,
              heightPart: 1/4,
              timeControllerAlpha: 3,
              timeControllerAmplitude: 4,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}



