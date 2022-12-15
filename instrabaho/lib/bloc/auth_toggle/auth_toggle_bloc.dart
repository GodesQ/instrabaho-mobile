import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'auth_toggle_event.dart';
part 'auth_toggle_state.dart';

class AuthToggleBloc extends Bloc<AuthToggleEvent, AuthToggleState> {
  AuthToggleBloc() : super(AuthToggleInitial()) {
    on<AuthToggleEvent>((event, emit) {});

    on<SwitchToRegisterEvent>((event, emit) async {
      emit(LoadingScreenState());
      await Future.delayed(const Duration(seconds: 1), () {
        emit(RegisterScreenState());
      });
    });

    on<SwitchToLoginEvent>((event, emit) async {
      emit(LoadingScreenState());
      await Future.delayed(const Duration(seconds: 2), () {
        emit(LoginScreenState());
      });
    });

    on<SwitchToHomeEvent>((event, emit) async {
      emit(LoadingScreenState());
      await Future.delayed(const Duration(seconds: 2), () {
        emit(HomeScreenState(event.userType));
      });
    });
  }
}
