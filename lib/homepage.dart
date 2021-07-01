import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
       child: Column(
         children: [
           Text('You are logged in',
           style: TextStyle(
             fontSize: 26,
             fontWeight: FontWeight.bold,
           ),),
           SizedBox(height: 30,),

           OutlinedButton(
               child: Text('Logout'),
               onPressed: () {
               FirebaseAuth.instance.signOut().then((value) {
                 Navigator.of(context).pushReplacementNamed('/landingpage');
               }).catchError((e){
                 print(e);
               });
               },

           ),

         ],
       ),
      ),
    );
  }
}
