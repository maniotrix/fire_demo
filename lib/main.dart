import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fire_demo/auth/auth.dart';
import 'screen/login_signup/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screen/home_screen/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Ideal time to initialize
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  // late FirebaseFirestore firestore;
  // String host = "localhost";
  // firestore = FirebaseFirestore.instance;
  // firestore.settings =
  //     const Settings(persistenceEnabled: true, sslEnabled: false);
  // firestore.useFirestoreEmulator(host, 8080);
  // [Authentication | localhost:9099]
  //await FirebaseAuth.instance.useEmulator('http://localhost:9099');

  // FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //   if (user == null) {
  //     print('User is currently signed out!');
  //   } else {
  //     print('User is signed in!');
  //   }
  // });

  // try {
  //   await FirebaseWrapper().addUser("a", "123456");
  // } on Exception catch (e) {
  //   e.toString();
  //   print("Print User Id Error");
  // }
  runApp(MyApp());
  // runApp(MaterialApp(
  //   home: GetUserName("0l36fWkY4gA9BTH1f9VJ"),
  // ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.lightBlue[800],
          scaffoldBackgroundColor: Colors.white,
        ),
        home: AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<User?>();

    if (user != null) {
      return Home();
    }
    return Welcome_screen();
  }
}
