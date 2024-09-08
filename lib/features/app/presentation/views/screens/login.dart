import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_classification_app/features/App/presentation/views/screens/login_view_body.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        // Finally
        body: LoginViewBody(),
      ),
    );
  }

// ################################################
//   Future<void> signInWithGoogle() async {
//     try {
//       final GoogleSignIn googleSignIn = GoogleSignIn();
//       final GoogleSignInAccount? googleSignInAccount =
//       await googleSignIn.signIn();
//
//       if (googleSignInAccount != null) {
//         // You can retrieve the user's Google information as follows
//         final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;
//         // to Naigate in HomePage Screen
//         Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
//         // Use this information to authenticate with your backend
//         print("Google User Name: ${googleSignInAccount.id}");
//         // Here, you can also navigate the user to another screen or perform other actions
//         await googleSignIn.signOut();
//       }
//     } catch (error) {
//       print('Error signing in with Google: $error');
//     }
//   }
}
