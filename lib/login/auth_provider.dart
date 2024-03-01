import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(supabase: Supabase.instance);
});

class AuthModel {
  final String userId;
  final String email;
  final String password;

  AuthModel({required this.userId, required this.email, required this.password});
}

class AuthRepository {
  final Supabase _supabase;

  AuthRepository({
    required Supabase supabase,
  }) : _supabase = supabase;

  Future<AuthModel> signIn({required String email, required String password}) async {
    try {
      print(email);
      print(password);
      AuthModel authModel = AuthModel(email: '', password: '', userId: '');
      final response = await _supabase.client.auth.signInWithPassword(email: email, password: password);
      authModel = AuthModel(userId: response.user!.id, email: email, password: password);
      return authModel;
    } catch (e) {
      print(e);
      throw 'Error';
    }
  }

  Future<void> signOut() async {
    try {
      _supabase.client.auth.signOut();
    } catch (e) {
      print('ERROR SIGN OUT $e');
      throw 'Error';
    }
  }
}
