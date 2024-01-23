part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({this.isLoggedIn, this.exception, this.isLoading});

  final bool? isLoggedIn;
  final DioException? exception;
  final bool? isLoading;


  copyWith({bool? isLoading, bool? isLoggedIn, DioException? exception}) {
    return AuthState(isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      exception: exception ?? this.exception,
      isLoading: isLoading ?? this.isLoggedIn,);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isLoggedIn, exception, isLoading];
}

