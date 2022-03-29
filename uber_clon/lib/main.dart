import 'package:flutter/material.dart';
import 'package:uber_clon/pages/home/home_page.dart';
import 'package:uber_clon/pages/login/login_page.dart';
import 'package:uber_clon/pages/registro/registro_page.dart';
import 'package:uber_clon/pages/ubicacion/ubicacion_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uber Clon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'login': (BuildContext context) => LoginPage(),
        'registro': (BuildContext context)=> RegistroPage(),
        'ubicacion': (BuildContext context)=> UbicacionPage(),
      },
    );
  }
}
