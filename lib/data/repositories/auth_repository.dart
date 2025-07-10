import 'package:morket_ai/data/models/user_model.dart';
import 'package:morket_ai/domain/entities/user_entity.dart';

// Di abstract class
abstract class AuthRepository {
  Future<UserEntity> login(String username, String password); // Ubah return type
  Future<RegisterResponse> register(String name, String email, String password);
}

