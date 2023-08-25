import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/values/constant.dart';
import 'package:learning_app/common/widgets/toasts.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        // BlocProvider.of<SignInBloc>(context).state;
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to enter your email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to enter your password");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: "You don;t exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You neeen to verify your email account");
            return;
          }
          var user = credential.user;
          if (user != null) {
            toastInfo(msg: "User exists");
            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
            return;
          } else {
            toastInfo(msg: "Currnetly you are not a user");
            return;
          }
        } on FirebaseException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found for that email");
            return;
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "worng password provided fo that user");
            return;
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "your email format is wrong");
            return;
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
