
import 'package:morket_ai/data/models/user_model.dart';
import 'package:morket_ai/data/repositories/auth_repository.dart';
import 'package:morket_ai/domain/entities/user_entity.dart';

class LoginUseCase {
  final AuthRepository _authRepository; // Gunakan abstract, bukan implementasi
  LoginUseCase(this._authRepository);

  Future<UserEntity> execute(String username, String password) async {
    // Validasi tetap sama
    final user = await _authRepository.login(username, password);
    return user; // Langsung return UserEntity
  }
}

class RegisterUseCase {
  final AuthRepository _authRepository; // Gunakan abstract, bukan implementasi
  RegisterUseCase(this._authRepository);

  Future<RegisterResponse> execute(String email, String username, String password) async {
    // Validasi tetap sama
    final user = await _authRepository.register(email, username, password);
    return user; // Langsung return UserEntity
  }
}