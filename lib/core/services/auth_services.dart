import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  AuthService() {
    log('FirebaseAuthService initialized', name: 'FirebaseAuthService');
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<UserCredential> signInWithGoogle() async {
    _googleSignIn.initialize(
      serverClientId:
          '460363291466-54hi10l634kep22kc5ld576bdrpg50bl.apps.googleusercontent.com',
    );

    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await _googleSignIn.authenticate(
      scopeHint: ['email', 'https://www.googleapis.com/auth/contacts.readonly'],
    );
    log(
      'googleUser: Email: ${googleUser.email}, ID: ${googleUser.id}, DisplayName: ${googleUser.displayName}',
      name: 'FirebaseService',
    );

    log(googleUser.authentication.toString());

    // Obtain the auth details from the request
    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleUser.authentication.idToken,
    );

    // Once signed in, return the UserCredential
    return _auth.signInWithCredential(credential);
  }
}
