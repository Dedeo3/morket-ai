import 'package:morket_ai/core/constants/api_constant.dart';
import 'package:morket_ai/core/network/network_client.dart';

class AuthService{
  final NetworkClient _networkClient;
  AuthService(this._networkClient);
  Future <Map<String, dynamic>> login(String username, String password) async {
    final response= await _networkClient.dio.post(ApiConstants.login, data:{
      'username': username,
      'password': password
    });
    return response.data;
  }

  Future <Map<String, dynamic>> register(String email,String username, String password) async {
    final response= await _networkClient.dio.post(ApiConstants.login, data:{
      'email':email,
      'username': username,
      'password': password
    });
    return response.data;
  }

    Future <Map<String, dynamic>> chat(String messages) async {
    final response= await _networkClient.dio.post(ApiConstants.aiChat, data:{
      'messages':messages
    });
    return response.data;
  }



}

