import 'package:frugalistic/category/categories_screen.dart';
import 'package:frugalistic/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'login/page_selector.dart';
import 'login/login_screen.dart';
import 'theme/frugalistic_theme.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://pmjdlbjdhorclvnptaod.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBtamRsYmpkaG9yY2x2bnB0YW9kIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjY1MzczMTksImV4cCI6MTk4MjExMzMxOX0.wU9mqQwRzIucXj94ZZDjz3MPRaC4bBGaB7k91Sq7w64',
  );
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp()));
}

final supabase = Supabase.instance.client;

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'frugalistic',
      theme: frugalisticTheme,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => const SplashPage(),
        '/login': (_) => const LoginScreen(),
        '/account': (_) => const PageSelector(),
        '/categories': (_) => const CategoriesScreen(),
      },
    );
  }
}
