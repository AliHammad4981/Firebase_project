import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/screens/Home.dart';
import 'package:firebase_project/screens/auth/login.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder:(context, snapshots) {
        if(snapshots.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }else if(snapshots.hasError)
          {
            return Center(child: Text("Error"));
          }
        else{
          if(snapshots.data == null){
            return login();
          }
          else
            {
              return Home();
            }
        }
      } ),
    );
  }
}
