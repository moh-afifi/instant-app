import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

//--------------------------------------------------------------------------
String name, email, imageUrl, id;

var _fireStore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {

  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
  await _auth.signInWithCredential(credential);
  final User user = authResult.user;
  if (user != null) {
    // Add the following lines after getting the user
    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);
    assert(user.uid != null);

    // Store the retrieved data

    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;
    id = user.uid;

    // Only taking the first part of the name, i.e., First Name
    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    return '$user';
  }

  return null;
}

Future<void> dataFirebase() async {

//   SharedPreferences prefs =
//   await SharedPreferences.getInstance();
//   prefs.setString('email', email);
  //----------------------------------------------------
  await _fireStore.collection("users").doc(id).set({
    "email": email,
    "name": name,
    "mobile": "0000000000",
    "imageUrl": imageUrl,
  });
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();
}
