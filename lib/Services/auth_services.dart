
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  final _auth = FirebaseAuth.instance;
  Future<User?>  CreateUserWithEmailAndPassword (String _email, String _password) async {
    try{
      final Cred = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
      return Cred.user;
    }catch(e){
      print(e);
    }
  }
  Future<User?>  LoginUserWithEmailAndPassword (String _email, String _password) async {
    try{
      final Cred = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
      return Cred.user;
    }catch(e){
      print(e);
    }
  }

  Future<void> LogOut() async{
    try{
      await _auth.signOut();
    }catch(e){
      print(e);
    }
  }
}