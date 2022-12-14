import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'auth_toggle_state.dart';

class AuthToggleCubit extends Cubit<AuthToggleState> {
  AuthToggleCubit() : super(AuthToggleInitial());

}
