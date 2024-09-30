import 'package:company_app/screens/Bottom_Nav_Bar.dart';
import 'package:company_app/widgets/dynamic_link.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DynamicLinkProvider().initDynamicLink();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,

       home: SafeArea(
           child: BottomNavBar()),
    );
  }
}
