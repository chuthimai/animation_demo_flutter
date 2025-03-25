import 'package:animation_demo/sun_and_moon/sun_moon_animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../provider/is_sunset.dart';
import 'day_night_animation.dart';

class MixAnimation extends ConsumerWidget {
  final int time;

  const MixAnimation({super.key, required this.time});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(isPlayingProvider);
    return Stack(
      children: [
        DayNightAnimation(time: (time/2).round(), isPlaying: isPlaying,),
        SunMoonAnimation(time: time, isPlaying: isPlaying,),
      ],
    );
  }

}