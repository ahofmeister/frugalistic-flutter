import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../login/auth_provider.dart';
import '../login/login_screen.dart';
import '../main.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  var profile;

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  void getProfile() async {
    try {
      final data = await supabase.from('profiles').select('*').single();
      setState(() {
        profile = data;
      });
    } on PostgrestException catch (error) {
      SnackBar(
        content: Text(error.message),
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    } catch (error) {
      SnackBar(
        content: const Text('Unexpected error occurred'),
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (profile == null) {
      return const Text('');
    }

    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Text(profile["firstName"].toString()),
            Text(profile["lastName"].toString()),
            Center(
              child: GestureDetector(
                onTap: () {
                  ref.watch(authRepositoryProvider).signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: const Text("LOGOUT"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
