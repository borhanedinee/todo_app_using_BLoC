import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin {
  static final  _googleSignin = GoogleSignIn();
  static clear() {
    if (_googleSignin.currentUser != null) {
      return _googleSignin.disconnect();
    } else
      return Future.value(null);
  }

  static Future<GoogleSignInAccount?> login() => _googleSignin.signIn();
  static Future signOut() => _googleSignin.signOut();
}
