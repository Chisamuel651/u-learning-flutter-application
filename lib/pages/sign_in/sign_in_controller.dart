import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/sign_in/bloc/singin_blocs.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddresse = state.email;
        String password = state.password;

        if (emailAddresse.isEmpty) {
          //
        }
        if (password.isEmpty) {
          //
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddresse, password: password);
          if (credential.user == null) {
            //
          }
          if (!credential.user!.emailVerified) {
            //
          }

          var user = credential.user;
          if(user!=null){
            // user verified from firebase
             
          }else{
            // we have error getting from firebase
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
