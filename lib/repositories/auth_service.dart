import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<void> signInWithGoogle() async {
    // google cloud
    const clientId =
        '476057614092-l89jkubtqtio201meikscthmgitilp3c.apps.googleusercontent.com';

    const scopes = ['openid', 'profile', 'email'];

    final req = GoogleSignIn(clientId: clientId, scopes: scopes);
    final res = await req.signIn();

    final authn = await res?.authentication;
    final accessToken = authn?.accessToken;
    final idToken = authn?.idToken;

    if (accessToken == null) return;

    // firebase
    final credential = GoogleAuthProvider.credential(
      accessToken: accessToken,
      idToken: idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}