import 'package:morket_ai/core/constants/api_constant.dart';
import 'package:morket_ai/core/errors/errors.dart';
import 'package:morket_ai/core/network/network_client.dart';
import 'package:morket_ai/data/models/user_model.dart';
import 'package:morket_ai/data/repositories/auth_repository.dart';
import 'package:morket_ai/domain/entities/user_entity.dart';

class AuthRepositoryImp implements AuthRepository {
  final NetworkClient _networkClient;
  AuthRepositoryImp(this._networkClient);

  @override
  Future<RegisterResponse> register(
      String email, String username, String password) async {
    try {
      final response = await _networkClient.dio.post(
        ApiConstants.regisEndpoint,
        data: RegisterRequest(
          // Gunakan model request
          email: email,
          username: username,
          password: password,
        ).toJson(),
      );
      return RegisterResponse.fromJson(response.data); // Gunakan model response
    } catch (e) {
      throw ServerException('Registration failed: ${e.toString()}');
    }
  }

  // @override
  // Future<LoginResponse> login(
  //     String username, String password) async {
  //   try {
  //     final response = await _networkClient.dio.post(
  //       ApiConstants.login,
  //       data: LoginRequest(
  //         // Gunakan model request
  //         username: username,
  //         password: password,
  //       ).toJson(),
  //     );
  //     return LoginResponse.fromJson(response.data); // Gunakan model response
  //   } catch (e) {
  //     throw ServerException('Registration failed: ${e.toString()}');
  //   }
  // }

  // Di AuthRepositoryImp
@override
Future<UserEntity> login(String username, String password) async {
  try {
    final response = await _networkClient.dio.post(
      ApiConstants.login, // Gunakan endpoint yang benar
      data: {'username': username, 'password': password},
    );
    
    // Konversi response ke UserEntity
    return UserEntity(
      username: response.data['username'],
      token: response.data['token']
      // Tambahkan field lain sesuai kebutuhan
    );
  } catch (e) {
    throw ServerException('Login failed: ${e.toString()}');
  }
}
}
