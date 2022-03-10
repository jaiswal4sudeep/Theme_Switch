import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(true);
  switchTheme() {
    state = !state;
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((_) {
  return ThemeNotifier();
});
