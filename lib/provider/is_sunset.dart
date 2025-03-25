import 'package:flutter_riverpod/flutter_riverpod.dart';

final isSunset = StateProvider<bool>((ref) => true);
final isPlayingProvider = StateProvider<bool>((ref) => false);
