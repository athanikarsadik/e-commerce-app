import 'package:e_commerce_app/consts/consts.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  //login mmethod

  Future<UserCredential?> loginMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //signup method
  Future<UserCredential?> signUpMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //storing data
  storeUserData({name,password,email}) async {
    DocumentReference store =
        await firestore.collection(usersCollection).doc(currentUser!.uid);

    store.set({
      'name':name,
      'password': password,
      'email': email,
      'imageUrl':''
    });
  }

  //signOut method

  signOutMethod({context})async{
    try {
      await auth.signOut();
    } catch (e) {
            VxToast.show(context, msg: e.toString());

    }
  }
}
