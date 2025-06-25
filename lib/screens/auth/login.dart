import 'package:firebase_project/Services/auth_services.dart';
import 'package:firebase_project/screens/Home.dart';
import 'package:firebase_project/screens/auth/SignUp.dart';
import 'package:firebase_project/utils/Uihelper.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  login({super.key});

  @override
  State<login> createState() => _loginState();
}
final _auth = AuthServices();
class _loginState extends State<login> {
  TextEditingController _Email = TextEditingController();

  TextEditingController _Password = TextEditingController();
  @override
  void dispose() {
    _Email.dispose();
    _Password.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        title: Text("Log In"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Log in To Your Account", style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),),
            Column(
              children: [
                Uihelper.custometextfield(_Email, "Email", Icons.email, false),
                SizedBox(height: 10),
                Uihelper.custometextfield(_Password, "Password", Icons.password, true),
              ],
            ),
            Uihelper.customButton(Login, false, 'Log in'),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));

            }, child: Text("Create Account"))
          ],
        ),
      ),
    );
  }
  Login() async{
   final _user = await _auth.LoginUserWithEmailAndPassword(_Email.text, _Password.text);
   if(_user!=null)
     {
       print("Log In Successfull");
       Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
     }
  }
}
