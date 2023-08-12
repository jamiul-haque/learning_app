import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';

// import '../sign_in/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar("Sign Up"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Center(
                  child:
                      reusableText("Enter your details below & free sign up"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("User name"),
                      buildTextField("Enter your user name", "name", "user",
                          (value) {
                        // context.read<SignInBloc>().add(EmailEvent(value));
                      }),
                      reusableText("Email"),
                      buildTextField(
                          "Enter your email address", "email", "user", (value) {
                        // context.read<SignInBloc>().add(EmailEvent(value));
                      }),
                      reusableText("Password"),
                      buildTextField("Enter your Password", "password", "lock",
                          (value) {
                        // context.read<SignInBloc>().add(PasswordEvent(value));
                      }),
                      reusableText("Confirm Password"),
                      buildTextField(
                          "Enter your Confirm Password", "password", "lock",
                          (value) {
                        // context.read<SignInBloc>().add(PasswordEvent(value));
                      }),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25.w),
                  child: reusableText(
                      "By creating a new account you have to agree with our them & condication."),
                ),
                buildLogInAndRegButton("Sign Up", "login", () {
                  Navigator.of(context).pushNamed("register");
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
