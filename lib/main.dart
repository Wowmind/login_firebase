import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_fire/homepage.dart';
import 'package:login_fire/signup.dart';

import 'login.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _int = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _int,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
        }else if(snapshot.hasError){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Column(
                  children: [
                    Icon(Icons.error),
                    Text('Something went wrong !')
                  ],
                ),
              ),
            )
          );
        } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: LogInPage(),
              routes: <String, WidgetBuilder>{
                '/landingpage': (BuildContext context) => new MyApp(),
                '/signup': (BuildContext context) => new SignUpPage(),
                '/homepage': (BuildContext context) => HomePage(),
              },
            );
          }

        }
        );
  }
}

class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.error),
            Text('Something went wrong !')
          ],
        ),
      ),
    );
  }
}
