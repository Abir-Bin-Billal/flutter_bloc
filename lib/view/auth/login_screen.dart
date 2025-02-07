import 'package:bloc_flutter/bloc/login/login_bloc.dart';
import 'package:bloc_flutter/bloc/post/post_bloc.dart';
import 'package:bloc_flutter/bloc/post/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) =>
                    current.email != previous.email,
                builder: (context, state) {
                  return TextFormField(
                    onChanged: (value) {
                      context.read<LoginBloc>().add(EmailChanged(email: value));
                    },
                    focusNode: _emailNode,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Email", border: OutlineInputBorder()),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) =>
                    current.password != previous.password,
                builder: (context, state) {
                  return TextFormField(
                    focusNode: _passwordNode,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Password", border: OutlineInputBorder()),
                    onChanged: (value) {
                      context
                          .read<LoginBloc>()
                          .add(PasswordChanged(password: value));
                    },
                    onFieldSubmitted: (value) {},
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.loginStatus == LoginStatus.success) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(content: Text("Successfull")));
                  }
                  if (state.loginStatus == LoginStatus.loading) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(content: Text("Submitting")));
                  }
                  if (state.loginStatus == LoginStatus.error) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return ElevatedButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(LoginApi());
                        },
                        child: Text("Login"));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
