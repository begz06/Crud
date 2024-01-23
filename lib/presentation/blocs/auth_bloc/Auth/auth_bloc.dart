


import 'dart:async';


import '../../../../utils/import.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthReps _repo = AuthReps();
  AuthBloc() : super(const AuthState(isLoading:true, isLoggedIn: false)) {
    on<AuthLoginEvent>(_authLoginHandler);
  }

  FutureOr<void> _authLoginHandler(AuthLoginEvent event, Emitter<AuthState> emit) async{
    emit(state.copyWith(isLoading: true));
    try{
      await _repo.login(login: event.login, password: event.password);
      emit(state.copyWith(isLoading: false, isLoggedIn: true));
    } on DioException catch(e){
      emit(state.copyWith(isLoading:false, exception: e, isLoggedIn:false));
    }
  }
}
