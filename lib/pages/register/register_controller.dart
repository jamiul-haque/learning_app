import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/widgets/toasts.dart';
import 'package:learning_app/pages/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name can't be empty");
      return;
    }

    if (email.isEmpty) {
      toastInfo(msg: "Email name can't be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "password can't be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Your password confirmation is wrong");
      return;
    }
    try {
      final Credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (Credential.user != null) {
        await Credential.user?.sendEmailVerification();
        await Credential.user?.updateDisplayName(userName);
        toastInfo(
            msg:
                "An email has been sent to your registered email. T activate it please check your emailand click on the link.");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak password") {
        toastInfo(msg: "This password provided is too weak");
      } else if (e.code == "email-already-in use") {
        toastInfo(msg: "This email already in use");
      } else if (e.code == "invalid-email") {
        toastInfo(msg: "Your email is invalid");
      }
    }
  }
}
