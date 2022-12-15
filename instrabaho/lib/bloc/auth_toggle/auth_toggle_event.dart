part of 'auth_toggle_bloc.dart';

class AuthToggleEvent extends Equatable {
  const AuthToggleEvent();

  @override
  List<Object> get props => [];
}

class SwitchToRegisterEvent extends AuthToggleEvent {}

class SwitchToHomeEvent extends AuthToggleEvent {
  final String userType;

  const SwitchToHomeEvent(this.userType);
}

class SwitchToLoginEvent extends AuthToggleEvent {}
