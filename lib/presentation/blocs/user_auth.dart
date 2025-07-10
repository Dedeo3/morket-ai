import 'package:morket_ai/data/models/chat_model.dart';
import 'package:morket_ai/data/models/user_model.dart';
import 'package:morket_ai/domain/entities/user_entity.dart';
import 'package:morket_ai/domain/usecases/auth_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthEvent {}
class LoginEvent extends AuthEvent {
  final String username;
  final String password;
  LoginEvent(this.username, this.password);
}

class RegisterEvent extends AuthEvent{
  final String email;
  final String username;
  final String password;
  RegisterEvent(this.email,this.username,this.password);
}

class ChatEvent extends AuthEvent{
  final String messages;
  ChatEvent(this.messages);
}

// States - Kondisi yang mungkin
abstract class AuthState {}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final UserEntity user;
  AuthSuccess(this.user);
}

class AuthRegis extends AuthState{
  final RegisterResponse regis;
  AuthRegis(this.regis);
}

class ChatState extends AuthState{
    final String message; // Bukan ChatResponse
  
  ChatState(this.message);
}
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

// BLoC - Business Logic Component
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  
  AuthBloc(this._loginUseCase) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await _loginUseCase.execute(event.username, event.password);
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}

class AuthBlocChat extends Bloc<AuthEvent, AuthState> {
  final ChatUseCase _chatUseCase;
  
  AuthBlocChat(this._chatUseCase) : super(AuthInitial()) {
    on<ChatEvent>((event, emit) async {
      emit(AuthLoading());
      try {
          final chatResponse = await _chatUseCase.execute(event.messages);
          final messageContent = chatResponse; // Ambil string content
          print(messageContent);
          emit(ChatState(messageContent.message)); // Kirim string saja
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}

class AuthBlocRegis extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase _regisUsecase;
  
  AuthBlocRegis(this._regisUsecase) : super(AuthInitial()) {
    on<RegisterEvent>((event,emit)async{
      emit(AuthLoading());
      try{
        final regis= await _regisUsecase.execute(event.email,event.username, event.password);
        emit(AuthRegis(regis));
      }catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}