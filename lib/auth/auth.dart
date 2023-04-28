import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../screens/home.dart';
import '../screens/login.dart';

class Auth {
  FirebaseAuth? firebaseAuth;
  Future registration(String emailAddress,String password, context)async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      final user = FirebaseAuth.instance.currentUser;
      if(user != null){
        Get.offAll(()=> const LoginForm());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(snackPosition: SnackPosition.TOP,'error','The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(snackPosition: SnackPosition.TOP,'error','The account already exists for that email.');

      }
    } catch (e) {
      print(e);
    }

  }
  Future signIn(String emailAddress,password,context)async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      final user = FirebaseAuth.instance.currentUser;
      if(user != null){
        Get.offAll(()=> const Home());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(snackPosition: SnackPosition.TOP,'error','No user found for that email.');

      } else if (e.code == 'wrong-password') {
        Get.snackbar(snackPosition: SnackPosition.TOP,'error','Wrong password provided for that user.');

      }
    }
    // }
    // Future signOut(){
    //
    // }
  }
}