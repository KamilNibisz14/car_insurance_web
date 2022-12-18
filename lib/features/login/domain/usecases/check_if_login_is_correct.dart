
import 'package:firebase_auth/firebase_auth.dart';
import 'package:car_insurance/features/login/domain/entities/login_model.dart';

class CheckLogin{
  final _auth = FirebaseAuth.instance;

  Future<bool> ckeckIfLoginIsValid(LoginData loginData) async{
    try{
      final user = await _auth.signInWithEmailAndPassword(
        email: loginData.email!, password:  loginData.password!
      );
      if(user != null){
        return true;
      }
      else{
        return false;
      }
    }
    catch(e){
      print(e);
      return false;
    }
  }
}