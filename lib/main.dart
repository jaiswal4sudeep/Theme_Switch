import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:theme_switch/valueprovider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return MaterialApp(
      theme: ThemeData(
        brightness: currentTheme ? Brightness.dark : Brightness.light,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Switch Theme"),
        ),
        body: Center(
          child: Switch(
            value: currentTheme,
            onChanged: (a) {
              ref.read(themeProvider.notifier).switchTheme();
            },
          ),
        ),
      ),
    );
  }
}
