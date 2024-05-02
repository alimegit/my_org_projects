import 'package:default_project/bloc/auth_bloc.dart';
import 'package:default_project/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Column(
            children: [

            ],
          );
        },
      ),
    );
  }
}
