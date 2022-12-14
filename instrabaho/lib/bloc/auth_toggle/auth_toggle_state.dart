part of 'auth_toggle_bloc.dart';

class AuthToggleState extends Equatable {
  const AuthToggleState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthToggleInitial extends AuthToggleState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoadingScreenState extends AuthToggleState {}

class LoginScreenState extends AuthToggleState {}

class RegisterScreenState extends AuthToggleState {}

class HomeScreenState extends AuthToggleState {
  final String userType;

  const HomeScreenState(this.userType);
}
