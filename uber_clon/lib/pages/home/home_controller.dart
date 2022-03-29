import 'package:flutter/material.dart';

class HomeController {
  BuildContext context;
  //Aplica la regla NOT NULL
  //Se puede colocar el simbolo de pregunta para evitar el error

  //Constructor de la clase
  Future init(BuildContext context) {
    this.context = context;
  }

  void goToLoginPage() {
    Navigator.pushNamed(context, 'login');
  }
}
