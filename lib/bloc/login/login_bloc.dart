import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChaned);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChaned(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

Future<void> _loginApi(LoginApi event, Emitter<LoginState> emit) async {
  emit(state.copyWith(loginStatus: LoginStatus.loading));
  
  try {
    Map<String, String> data = {'email': state.email, 'password': state.password};
    
    final response = await http.post(
      Uri.parse("https://reqres.in/api/login"),
      body: data,
    );

    if (response.statusCode == 200) {
      emit(state.copyWith(
        loginStatus: LoginStatus.success, 
        message: "Login Successful"
      ));
    } else {
      emit(state.copyWith(
        loginStatus: LoginStatus.error, 
        message: "Login failed: ${response.body}"
      ));
    }
  } catch (e) {
    emit(state.copyWith(
      loginStatus: LoginStatus.error, 
      message: "An error occurred: $e"
    ));
    print("The error is: $e");
  }
}

}
