

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // signin in anon 
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // a stream of data abount signing in status of the user
  // just for spinning up an animation while the user is validated as authentecated
  // like an observable
  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

 // shoukd not be used - customer will lose his uid
 Future signOut() async {
    try {
      await _auth.signOut();
      
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // sign in with email


   // register with email

   // sign out
}