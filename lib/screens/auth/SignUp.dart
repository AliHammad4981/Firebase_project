import 'package:firebase_project/Services/auth_services.dart';
import 'package:firebase_project/screens/auth/login.dart';
import 'package:flutter/material.dart';

import '../../utils/Uihelper.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}
final _auth = AuthServices();
class _SignupState extends State<Signup> {
  TextEditingController _Name = TextEditingController();

  TextEditingController _Email = TextEditingController();

  TextEditingController _Password = TextEditingController();
  @override
  void dispose() {
    _Name.dispose();
    _Email.dispose();
    _Password.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Create New Account", style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
            ),),
            Column(
              children: [
                Uihelper.custometextfield(_Name, "Name", Icons.person, false),
                SizedBox(height: 10),
                Uihelper.custometextfield(_Email, "Email", Icons.email, false),
                SizedBox(height: 10),
                Uihelper.custometextfield(_Password, "Password", Icons.password, true),
              ],
            ),
            Uihelper.customButton(_CreateAccount, false, 'Create Account'),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> login()));
            }, child: Text("Log In"))
          ],
        ),
      ),
    );
  }
  _CreateAccount() async{
    final user = _auth.CreateUserWithEmailAndPassword(_Email.text, _Password.text);
    if(user!=null)
      {
        Navigator.pop(context);
      }
  }
}
