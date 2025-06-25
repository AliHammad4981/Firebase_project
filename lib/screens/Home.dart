import 'package:firebase_project/Services/auth_services.dart';
import 'package:firebase_project/screens/auth/login.dart';
import 'package:firebase_project/utils/Uihelper.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
final _auth = AuthServices();
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("welcome To Home Screen", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),),
              SizedBox(
                height: 20,
              ),
              Uihelper.customButton((){
                _auth.LogOut();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
              }, false, 'log Out')
            ],
          ),
        ),
      ),
    );
  }
}
