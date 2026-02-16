import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


Future<User?> signIn({
  required String email,
  required String password,
}) async {
  try{
    final UserCredential credintial = await _auth.signInWithEmailAndPassword(    email: email,
    password:password,
    );
    return credintial.user;
  } on FirebaseAuthException catch (e){
    if(e.code == 'user-not-found'){
      throw Exception('No user found for that emial.');
    }else if(e.code == 'wrong password'){
      throw Exception('Wrong password provided.');
    } else{
      throw Exception(e.message ?? 'An unkown error occured');
    }
  }catch(e){
    throw Exception('System error: $e');
  }
}

Future<void> signOut() async{
  await _auth.signOut();
}
}