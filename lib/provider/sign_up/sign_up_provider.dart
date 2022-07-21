import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/services/firebase_service.dart';
import 'package:newsapp/views/splash/splash_view.dart';

class SignUpProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  Future signUp(BuildContext context) async {
    try {
      UserCredential user =
          await FireService.auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      await FireService.store.collection('news').doc(emailController.text).set(
        {
          "name": nameController.text,
          "email": emailController.text,
          "phone": phoneController.text,
          "create_at": FieldValue.serverTimestamp(),
        },
      );

      showMySnackbar(
        context: context,
        content: "Success: " + nameController.text,
        color: Colors.green,
      );
      await FireService.auth.currentUser!.sendEmailVerification();

      Navigator.pushNamedAndRemoveUntil(context, '/cart', (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        showMySnackbar(
          context: context,
          content: "The Password Provided Is Too Weak.",
          color: Colors.black,
        );
      } else if (e.code == "email-already-in-use") {
        showMySnackbar(
          context: context,
          content: "The Account Already Exists For That Email.",
          color: Colors.black,
        );
      }
    } catch (e) {
      showMySnackbar(
        context: context,
        content: "There Is An Error",
        color: Colors.black,
      );
    }
  }

  Future signInWithEmailPassword(BuildContext context) async {
    try {
      UserCredential user = await FireService.auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushNamedAndRemoveUntil(context, '/cart', (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        showMySnackbar(
          context: context,
          content: "No User Found For That Email.",
          color: Colors.black,
        );
      } else if (e.code == "wrong-password") {
        showMySnackbar(
          context: context,
          content: "Wrong Password Provided For That User.",
          color: Colors.black,
        );
      } else if (e.code == "invalid-email") {
        showMySnackbar(
          context: context,
          content: "This Is Email Address Is Not Valid",
          color: Colors.black,
        );
      }
    } catch (e) {
      showMySnackbar(
        context: context,
        content: "$e",
        color: Colors.black,
      );
    }
  }

  Future forgotPassword(BuildContext context) async {
    try {
      await FireService.auth.sendPasswordResetEmail(
        email: emailController.text,
      );
      showMySnackbar(
        context: context,
        content: "Password Reset Link Is Send To Email !",
        color: Colors.green,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        showMySnackbar(
          context: context,
          content: "Invalid Email",
          color: Colors.black,
        );
      } else if (e.code == "user-not-found") {
        showMySnackbar(
          context: context,
          content: "This email is not registered",
          color: Colors.black,
        );
      }
    }
  }

  Future signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      Navigator.pushNamedAndRemoveUntil(context, '/cart', (route) => false);
    } catch (e) {
      showMySnackbar(
        context: context,
        content: "Error Google Sign In",
        color: Colors.black,
      );
    }
  }

  Future signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile', 'user_birthday'],
      );
      final OAuthCredential credential = FacebookAuthProvider.credential(
        loginResult.accessToken!.token,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      Navigator.pushNamedAndRemoveUntil(context, '/cart', (route) => false);
    } catch (e) {
      showMySnackbar(
        context: context,
        content: "Error Facebook Sign In",
        color: Colors.black,
      );
    }
  }

  Future signOut(BuildContext context) async {
    await FireService.auth.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const SplashView()),
      (route) => false,
    );
  }

  Future deleteAccount(context) async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const SplashView()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == "requires-recent-login") {
        showMySnackbar(
          context: context,
          content: "Delete your account",
          color: ColorConst.cFF3A44,
        );
      }
    }
  }

  showMySnackbar({
    required BuildContext context,
    required String content,
    required Color color,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          content,
          style: MyTextStyleComp.myTextStyle(
            color: ColorConst.cFFFFFF,
            fontSize: 20,
            weight: FontWeight.w600,
          ),
        ),
        backgroundColor: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
      ),
    );
  }
}
