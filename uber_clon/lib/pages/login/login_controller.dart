import 'package:flutter/material.dart';

class LoginController {
  BuildContext context;
  //Se crean objetos controladores para cada TextField
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Future init(BuildContext context) {
    this.context = context;
  }

  void login() {
    String email = emailController.text;
    String password = passwordController.text;

    print('Email: $email y password: $password');
    Navigator.pushNamed(context, 'ubicacion');
  }


  void goToRegistroPage() {
    Navigator.pushNamed(context, 'registro');
  } 

}
